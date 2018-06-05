---
layout: post
title: "PowerShell: Check if Processes Are Waiting and Prompting for User Input"
date: 2013-03-25 13:13
comments: false
categories: [Mercurial, Start-Process, Stop-Process, System.Diagnostics.Process, Wait-Process, "hg merge", powershell]
---

I'm currently writing a PowerShell script that will commit changes to a [Mercurial](http://mercurial.selenic.com) repository, then push those changes out to our central Mercurial server.  If there are new changes on the server, the script will need to pull those changes down before it pushes, merge them, commit the merge, then re-push to the server.  Rinse and repeat until the push succeeds.  Because it will run under our continuous integration build server, it needs to be able to run headless (i.e., non-interactively).

During a merge, Mercurial will sometimes prompt the user for input (e.g. if a file was deleted by someone, but modified by someone else, Mercurial asks if you want to keep the change or keep the deletion).  Prompting for input won't work under a continuous integration server because no one's around to answer.  So, my script needs to detect when Mercurial is prompting for input, kill it, then notify those responsible that manual intervention is necessary.

Google turned up *[Is My Process Waiting for Input?](http://stackoverflow.com/questions/1704791/is-my-process-waiting-for-input)* on StackOverflow.  The .NET [System.Net.Diagnostics.Process](http://msdn.microsoft.com/en-us/library/system.diagnostics.process.aspx) class has a [Threads](http://msdn.microsoft.com/en-us/library/system.diagnostics.process.threads.aspx) property, which is a collection of [ProcessThread](http://msdn.microsoft.com/en-us/library/system.diagnostics.processthread.aspx) objects.  If a process is waiting for input, one of its threads will be in a wait state (i.e. its [ThreadState](http://msdn.microsoft.com/en-us/library/system.diagnostics.processthread.threadstate.aspx) property will be `Wait`), waiting for user input (i.e., its [WaitReason](http://msdn.microsoft.com/en-us/library/system.diagnostics.processthread.waitreason.aspx) property will be `LpcReply`).

So, to get all process in PowerShell that are waiting for user input, you can do something like this:

    Get-Process | Where-Object { 
        Select-Object -ExpandProperty Threads | 
            Where-Object { $_.ThreadState -eq 'Wait' -and $_.WaitReason -eq 'LpcReply' }
    }

Of course, this is the easy part.  Here's my final script.  In addition to using `Start-Process` to start the merge so we can monitor the process while its running, it redirects STDOUT and STDERR to files, so we can see it in our build log.

    # Create some files for storing STDOUT and STDERR streams
    $randomFileName = [IO.Path]::GetRandomFileName()
    
    $stdOutFile = 'hg.merge.StdOut.{0}' -f $randomFileName
    $stdOutFile = Join-Path $env:Temp $stdOutFile
    
    $stdErrFile = 'hg.merge.StdErr.{0}' -f $randomFileName
    $stdErrFile = Join-Path $env:Temp $stdErrFile

    # Start the merge.
    $mergeProcess = Start-Process -FilePath hg.exe `
                                  -ArgumentList 'merge','-r',$Revision `
                                  -PassThru `
                                  -NoNewWindow `
                                  -RedirectStandardOutput $stdOutFile `
                                  -RedirectStandardError $stdErrFile
    try
    {
        do
        {
            # If the merge every prompts the user for input, kill it.
            Start-Sleep -Milliseconds 100
            $waitingForInput = $mergeProcess.Threads | 
                                    Where-Object { $_.ThreadState -eq 'Wait' -and $_.WaitReason -eq 'LpcReply' }
            if( $waitingForInput )
            {
                Write-Error -Message ('Stopping non-interactive merge: Mercurial is prompting for input.') `
                            -RecommendedAction 'Please merge manually.'
                $null = $mergeProcess | Stop-Process -PassThru | Wait-Process
                break
            }
        }
        while( -not $mergeProcess.HasExited )
        
        # Display STDOUT.
        Get-Content -Path $stdOutFile | Write-Host
        
        # Display STDERR
        # For some reason, it takes a little time to read the Standard Error file.
        $errors = $null
        $readFile = $false
        do
        {
            Start-Sleep -Milliseconds 100
            try
            {
                $errors = [IO.File]::ReadAllText($stdErrFile)
                $readFile = $true
            }
            catch
            {
            }
        }
        while( -not $readFile )
        
        if( $errors )
        {
            Write-Error -Message $errors
        }
        
    }
    finally
    {
        # Clean up the temporary files used to capture STDOUT and STDERR
        ($stdOutFile,$stdErrFile) | Where-Object { Test-Path -Path $_ -PathType Leaf } | Remove-Item
    }
