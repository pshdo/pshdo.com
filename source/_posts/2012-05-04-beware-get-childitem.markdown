---
layout: post
title: "Beware Get-ChildItem"
date: 2012-05-04 16:05
comments: false
categories: [Get-ChildItem, pitfalls, powershell]
---

I discovered today that the `Get-ChildItem` cmdlet wasn't behaving as I expected.  Passing it `$null`, `@()`, or `''` will return the contents of the current directory:

    > Get-ChildItem .
    

       Directory: C:\Temp\BewareGetChildItem
    
    Mode                LastWriteTime     Length Name
    ----                -------------     ------ ----
    -a---          5/4/2012   4:08 PM          6 Get-ChildItem.txt
    
    
    > Get-ChildItem $null

    
       Directory: C:\Temp\BewareGetChildItem
    
    Mode                LastWriteTime     Length Name
    ----                -------------     ------ ----
    -a---          5/4/2012   4:08 PM          6 Get-ChildItem.txt
    
    
    > Get-ChildItem @()

    
       Directory: C:\Temp\BewareGetChildItem
    
    Mode                LastWriteTime     Length Name
    ----                -------------     ------ ----
    -a---          5/4/2012   4:08 PM          6 Get-ChildItem.txt
    
    
    > Get-ChildItem ''

    
       Directory: C:\Temp\BewareGetChildItem
    
    Mode                LastWriteTime     Length Name
    ----                -------------     ------ ----
    -a---          5/4/2012   4:08 PM          6 Get-ChildItem.txt
    
Yikes!  I would expect it to write an error or just return nothing.

We have a function in our website deployment script that takes in a list of items and a filter, and deletes any item that doesn't match the filter, like this:

    function Remove-ExtraFiles($Items, $Exclude)
    {
        Get-ChildItem $Items -Exclude $Exclude -Recurse |
            Where-Object { -not $_.PsIsContainer } |
            Remove-Item
    }

I was testing this script when I saw that files under my local directory were getting deleted.  By the time I killed the script, it was too late: the last two hours of work were gone.  It turns out that `Remove-ExtraFiles` was getting called with an empty array as the `$Items` parameter value.

In my case, the solution was to add some validation to the `$Items` parameter:

    function Remove-ExtraFiles
    {
        param(
            [Parameter(Mandatory=$true)]
            [string[]]
            $Items,
            
            [string[]]
            $Exclude)
        )
        Get-ChildItem $Items -Exclude $Exclude -Recurse |
            Where-Object { -not $_.PsIsContainer } |
            Remove-Item
    }

Making the parameter mandatory causes a script error if calling `Remove-ExtraFiles` with null, an empty array, or an empty string.