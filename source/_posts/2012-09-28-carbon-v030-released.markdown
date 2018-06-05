---
layout: post
title: Carbon v0.3.0 Released
date: 2012-09-28 15:59
comments: false
categories: [Announcements, Carbon]
---

I've released version 0.3.0 of Carbon.  This release contains some minor enhancements, several bug fixes, and backwards-**incompatible** changes to the following functions:

 * [Set-IisSslFlags](http://get-carbon.org/help/Set-IisSslFlags.html)
 * [Set-TrustedHosts](http://get-carbon.org/help/Set-TrustedHosts.html)
 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html)

### Set-IisSslFlags

This function was renamed to `Enable-IisSsl`.  Its `Enable128BitSsl` parameter was renamed to `Require128BitSsl`.  

Configuring client certificates is now a little stricter/clearer.  You can no longer specify both `AcceptClientCertificates` and `RequireClientCertificates`.  Also, if you specify `RequireClientCertificates`, you must now also supply the `RequireSsl` switch (before, setting the `RequireClientCertificates` switch implicitly set the `RequireSsl` switch).

### Set-TrustedHosts

Make sure you're not calling `Set-TrustedHosts` with an empty array/value for the `Entries` parameter.  The function now throw an error in that situation.  If you need to clear the list of trusted hosts, use `Clear-TrustedHosts`.

### Invoke-PowerShell

If you call `Invoke-PowerShell` without the `x86` switch and PowerShell is 32-bit, you'll get an error.  Under Windows x64, 32-bit PowerShell can't start the 64-bit instance because Windows redirects all access from C:\Windows\system32 to C:\Windows\SysWOW64.  If anyone knows how to get around this, let me know!

## Enhancements

 * Renamed `Set-IisSslFlags` to `Enable-IisSsl` to better reflect what it does.  Also, created parameter sets around client certificate settings so you can't configure them incorrectly.  ([Fixes #25: Set-IisSslFlags: Create parameter sets to accurately reflect what flags are allowed to be set simultaneously.](https://bitbucket.org/splatteredbits/carbon/issue/25/set-iissslflags-create-parameter-sets-to))
 * Added `WhatIf` support to [Install-MsmqMessageQueue](http://get-carbon.org/help/Install-MsmqMessageQueue.html).
 * Created new [Clear-TrustedHosts](http://get-carbon.org/help/Clear-TrustedHosts.html) for clearing PowerShell's trusted hosts list.

## Bug Fixes

 * Rename [Enable-IisSsl/Set-IisSslFlags's](http://get-carbon.org/help/Set-IisSslFlags.html) `Enable128BitSsl` parameter to `Require128BitSsl`] ([Fix #24 Set-IisSslFlags: Rename the Enable128BitSsl parameter to Require128BitSsl](https://bitbucket.org/splatteredbits/carbon/issue/24/set-iissslflags-rename-the-enable128bitssl)).
 * [Fix issue #19](https://bitbucket.org/splatteredbits/carbon/issue/19/install-iisapppool-doesnt-change-an): [Install-IisAppPool](http://get-carbon.org/help/Install-IisAppPool.html) doesn't change an existing 32-bit app pool to be a 64-bit app pool.
 * [Fix issue #33](https://bitbucket.org/splatteredbits/carbon/issue/33/install-msmqmessagequeue-can-wait-forever): [Install-MsmqMessageQueue](http://get-carbon.org/help/Install-MsmqMessageQueue.html): Can wait forever for a queue to get created.  It now waits 10 seconds.  
 * [Fix issue #36](https://bitbucket.org/splatteredbits/carbon/issue/36/get-powershellpath-returns-the-wrong-path): [Get-PowerShellPath](http://get-carbon.org/help/Get-PowershellPath.html) returns the wrong path when running x86 PowerShell on x64 computers.
 * [Fix issue #37](https://bitbucket.org/splatteredbits/carbon/issue/37/invoke-powershell-should-write-an-error): [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) should write an error when running as x86 on Windows x64 without the x86 flag (i.e. 32-bit PowerShell can't launch a 64-bit PowerShell, so throw an error in that situation).
 * [Fix issue #38](https://bitbucket.org/splatteredbits/carbon/issue/38/set-trustedhosts-passing-an-empty-value): [Set-TrustedHosts](http://get-carbon.org/help/Set-TrustedHosts.html): passing an empty value for the Entries parameter clears the hosts list.  The `Entries` parameter is now required.  To clear the trusted hosts list, use `Clear-TrustedHosts`.

[Go get it!](https://bitbucket.org/splatteredbits/carbon/downloads)