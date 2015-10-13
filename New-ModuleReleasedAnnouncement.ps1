<#
.SYNOPSIS
Creates a new module released announcement post.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]
    $ModuleName,

    [Parameter(Mandatory=$true)]
    [string]
    $Content,

    [Parameter(Mandatory=$true)]
    [Version]
    $Version
)

#Requires -Version 4
Set-StrictMode -Version Latest

Push-Location -Path $PSScriptRoot
try
{
    $postsRoot = Join-Path -Path $PSScriptRoot -ChildPath 'source/_posts'
    $moduleNameLower = $ModuleName.ToLower()
    $postWildcard = Join-Path -Path $postsRoot -ChildPath ('*-{0}-{1}-released.markdown' -f $moduleNameLower,$Version)

    if( -not (Test-Path -Path $postWildcard -PathType Leaf) )
    {
        bundle exec rake ("new_post[{0} {1} Released]" -f $ModuleName,$Version)

        $post = Get-ChildItem -Path $postsRoot -File |
                    Sort-Object -Property 'LastWriteTime' -Descending |
                    Select-Object -First 1 |
                    Rename-Item -NewName { $_.Name -replace '-\d+(-dot)?-\d+(-dot)?-\d+-',('-{0}-' -f $Version) } -PassThru

        if( -not $post )
        {
            Write-Error ('Post {0} not found.' -f $postWildcard)
            return
        }
    }
    else
    {
        $post = Get-Item -Path $postWildcard
    }

    $inHeader = $false
    $pastHeader = $false
    $header = Get-Content -Path $post.FullName |
                    ForEach-Object {
                        if( $pastHeader )
                        {
                            return
                        }

                        $_

                        if( -not $inHeader -and $_ -eq '---' )
                        {
                            $inHeader = $true
                        }
                        elseif( $inHeader -and $_ -eq '---' )
                        {
                            $pastHeader = $true
                        }

                    }
    (@'
{0}

{1}
'@ -f ($header -join ([Environment]::NewLine)),$Content) | Set-Content -Path $post.FullName
    
    bundle exec rake generate

    hg addremove

    if( hg status )
    {
        hg commit -m ('{0} {1} Released' -f $ModuleName,$Version)
        hg log -rtip
    }

    if( hg out )
    {
        hg push
    }
}
finally
{
    Pop-Location
}