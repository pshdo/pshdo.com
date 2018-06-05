---
layout: post
title: Carbon v0.2.3 Released
date: 2012-06-27 9:56
comments: false
categories: [Announcements, Carbon]
---

I've released Carbon v0.2.3. [Download it from BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)  It's mostly documentation updates, but I snuck a couple of bug fixes in there.

## Enhancements

Improved documentation for:

 * [Disable-IEEnhancedSecurityConfiguration](http://get-carbon.org/help/Disable-IEEnhancedSecurityConfiguration.html)
 * [Enable-IEActivationPermissions](http://get-carbon.org/help/Enable-IEActivationPermissions.html)
 * [Get-FullPath](http://get-carbon.org/help/Disable-IEEnhancedSecurityConfiguration.html)
 * [Invoke-WindowsInstaller](http://get-carbon.org/help/Invoke-WindowsInstaller.html)
 * [Protect-String](http://get-carbon.org/help/Protect-String.html)
 * [Remove-EnvironmentVariable](http://get-carbon.org/help/Remove-EnvironmentVariable.html)
 * [Set-DotNetAppSetting](http://get-carbon.org/help/Set-DotNetAppSetting.html)
 * [Set-DotNetConnectionString](http://get-carbon.org/help/Set-DotNetConnectionString.html)
 * [Set-EnvironmentVariable](http://get-carbon.org/help/Set-EnvironmentVariable.html)
 * [Test-OSIs32Bit](http://get-carbon.org/help/Test-OSIs32Bit.html)
 * [Test-OSIs64Bit](http://get-carbon.org/help/Test-OSIs64Bit.html)
 * [Unprotect-String](http://get-carbon.org/help/Unprotect-String.html)

## Bug fixes
 * [Invoke-WindowsInstaller](http://get-carbon.org/help/Invoke-WindowsInstaller.html) doesn't validate that installer path ends in '.msi'.
 * [Invoke-WindowsInstaller](http://get-carbon.org/help/Invoke-WindowsInstaller.html) not showing correct exit code when installation fails.