---
layout: post
title: Getting X509Certificate2's "Issued From" and "Issued To" Properties in PowerShell
date: 2013-03-14 14:36
comments: false
tags: [Carbon, X509Certificate2, PowerShell]
permalink: /archive/2013/3/14/getting-x509certificate2s-issued-from-and-issued-to-properti.html
---

One of my problems with the [X509Certificate2](http://msdn.microsoft.com/en-us/library/ms148409.aspx) object is that it doesn't expose properties for the "Issued From" and "Issued To" data, properties which show by default when viewing certificates in the Windows Certificate MMC snap-in. This makes it difficult to match certificates you see the Certificates MMC with certificates you see in PowerShell.

Today I [discovered](http://social.msdn.microsoft.com/Forums/en-US/csharpgeneral/thread/a74e3465-7e36-43a9-a83a-fb28a629218f) the [GetNameInfo method](http://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509certificate2.getnameinfo.aspx), which can return the "Issued To/By" text seen in the Certificates MMC snap-in:

    Get-ChildItem cert:\CurrentUser\My |
        Format-Table @{ Label = 'IssuedTo'; Expression = { $_.GetNameInfo( 'SimpleName', $false ) } },@{ Label = 'IssuedBy' ;Expression = { $_.GetNameInfo( 'SimpleName', $true ) } }

Here it is a little clearer:

    $cert.GetNameInfo( 'SimpleName', $false ) # This is IssuedTo.
    $cert.GetNameInfo( 'SimpleName', $true )  # This is IssuedBy.

You could also pipe your certificates to [Add-Member](http://technet.microsoft.com/en-us/library/hh849879.aspx):

    Get-ChildItem cert:\CurrentUser\My |
        Add-Member ScriptProperty -Name IssuedTo -Value { $this.GetNameInfo( 'SimpleName', $false) } -PassThru |
        Add-Member ScriptProperty -Name IssuedBy -Value { $this.GetNameInfo( 'SimpleName', $true ) } -PassThru |
        Format-Table -Property IssuedTo,IssuedBy -AutoSize

The next version of [Carbon](http://get-carbon.org) will add `IssuedBy` and `IssuedTo` properties to `X509Certificate2` objects, so you can do this instead:

    Get-ChildItem cert:\CurrentUser\My |
        Format-Table IssuedTo,IssuedBy -AutoSize
