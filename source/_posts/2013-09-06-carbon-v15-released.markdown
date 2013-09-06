---
layout: post
title: "Carbon v1.5 Released"
date: 2013-09-06 9:35
comments: false
tags: Carbon, Announcements
---

[Carbon](http://get-carbon.org) v1.5 is out and is [backwards compatible](http://semver.org) with v1.0 through v1.4.  This release adds a few new features and some bug fixes to improve PowerShell 3 support.

This is definitely the last release to support PowerShell 2.  There were enough bug fixes that I didn't feel good about making people upgrade to a backwards-incompatible version to get them, so I jumped through some extra hoops to test on PowerShell 2.  You're welcome.  `;-)`

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Enhancements

### IIS

 * [Set-IisWebsiteID](http://get-carbon.org/help/Set-IisWebsiteID.html) now attempts to start a website whose ID has changed, since IIS stops a website whenever its ID changes.

### Network

 * Added [Get-IPAddress](http://get-carbon.org/help/Get-IPAddress.html) function for getting the IPv4/IPv6 addresses currently in use on the local computer's network interfaces.
 * Added [Test-IPAddress](http://get-carbon.org/help/Test-IPAddress.html) function for testing if an IP address is in use on one the local computer's network interfaces.

### Path

 * Added [Test-UncPath](http://get-carbon.org/help/Test-UncPath.html) function for testing if a path is a UNC or not.
 
### PowerShell

 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) now runs script blocks in PowerShell 3 under a v2.0 CLR.

### Shares

 * [Install-SmbShare](http://get-carbon.org/help/Install-SmbShare.html) now creates the share's directory if it doesn't exist.

## Bug Fixes

### Certificates

 * [Get-Certificate](http://get-carbon.org/help/Get-Certificate.html) throws an exception and halts script execution when loading a certificate file with a private key and the user doesn't have permission to write to Windows' MachineKeys directory.  It now writes an error instead.
 
### PowerShell

 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) doesn't run under a v2.0 CLR when using parameters `-Runtime 'v2.0'`.
