---
layout: post
title: "Carbon 1.7 Released"
date: 2014-04-30 13:40
comments: false
categories: 
tags: Carbon, Announcements
---

[Carbon](http://get-carbon.org) 1.7 is out and is [backwards compatible](http://semver.org) with 1.0 through 1.6.  It supports PowerShell 2. It contains mostly bug fixes and some enhancements.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

There is now [a Carbon support mailing list](https://groups.google.com/forum/#!forum/carbonps).

## Enhancements

### General

 * Import-Carbon.ps1 now supports the `-WhatIf` switch.
 * Import-Carbon.ps1 now hides verbose log messages when removing/importing Carbon even when supplying the `-Verbose` switch because I think the verbose output is too verbose and not helpful at all.
 * Import-Carbon.ps1 now supports adding a prefix when importing the Carbon module (with the `Prefix` parameter) to avoid name collisions and [follow best practices](http://blogs.msdn.com/b/powershell/archive/2014/04/07/what-s-in-a-name-using-the-ps-prefix.aspx).
 
### Certificates

 * [Get-CertificateStore](http://get-carbon.org/help/Get-CertificateStore.html) now supports non-standard, custom certificate stores.
 * [Get-Certificate](http://get-carbon.org/help/Get-Certificate.html) now supports non-standard, custom certificate stores.
 * [Install-Certificate](http://get-carbon.org/help/Install-Certificate.html) now supports non-standard, custom certificate stores.
 * [Uninstall-Certificate](http://get-carbon.org/help/Uninstall-Certificate.html) now supports non-standard, custom certificate stores.
 
## Bug Fixes

### General

 * No more silent errors when importing Carbon on Windows 2012 R2.

### Certificates

 * [Get-Certificate](http://get-carbon.org/help/Get-Certificate.html) no longer writes a silent error when a certificate does not exist. Instead, no error is written.

### File System

 * [Install-Junction](http://get-carbon.org/help/Install-Junction.html) fails when target path is hidden.
 * [Test-NtfsCompression](http://get-carbon.org/help/Test-NtfsCompression.html) fails when file/directory is hidden.
 * [Test-PathIsJunction](http://get-carbon.org/help/Test-PathIsJunction.html) fails when tested directory is hidden.

### Security

 * [Grant-Permission](http://get-carbon.org/help/Grant-Permission.html) fails when item is hidden.
 * [Grant-Permission](http://get-carbon.org/help/Grant-Permission.html) doesn't handle non-existent paths, causing cascading errors.
 * [Test-Permission](http://get-carbon.org/help/Test-Permission.html) always returns `$false` when testing leaf-level permissions and the `ApplyTo` parameter is provided, i.e. it doesn't ignore inheritance/propagation flags on leaves.

