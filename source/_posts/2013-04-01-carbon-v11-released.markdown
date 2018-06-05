---
layout: post
title: Carbon v1.1 Released
date: 2013-04-01 13:32
comments: false
categories: [Announcements, Carbon]
---

Carbon v1.1 is out. It is [backwards-compatible](http://semver.org) with v1.0.  [Get the bits at BitBucket](https://bitbucket.org/splatteredbits/carbon/downloads).

## Upgrade Instructions

 * On Windows 2008 R2, custom identies that run IIS app pools need the `SeBatchLogonRight`.  [Install-IisAppPool](http://get-carbon.org/help/Install-IisAppPool.html) now grants this privilege on all operating systems.  If this won't work in your environment, you can remove these privileges with [Revoke-Privilege](http://get-carbon.org/help/Revoke-Privilege.html).

## Enhancements

### General

 * Fixed some typos and ommissions in the v0.5.0.1 and v0.5.0.0 sections of the release notes.
 * Updated `Import-Carbon.ps1` script to import Carbon regardless of the name of the directory Carbon is installed in.
 
### Certificates

 * Added `IssuedTo` and `IssuedBy` properties to [X509Certificate2](http://msdn.microsoft.com/en-us/library/ms148409.aspx) objects.  The values match what the Certificates MMC snap-in displays.
 * Added `DisplayName` property to [X509Store](http://msdn.microsoft.com/en-us/library/d228271e.aspx) objects, to show the names of the stores as they are displayed in the Certificates MMC snap-in.
 
### Computer

 * Created [Resolve-NetPath](http://get-carbon.org/help/Resolve-NetPath.html) for getting the path to the Windows `net.exe` command/application.  Updated all functions that call `net.exe` to use this function to resolve its path.  Thanks to Paul Aage Aasheim for discovering that when running login scripts, `net.exe` isn't in the path.

### IIS

 * Created [Get-IisHttpHeader](http://get-carbon.org/help/Get-IisHttpHeader.html) for getting the custom HTTP headers for a website or one of its sub-directories.
 * Created [Set-IisHttpHeader](http://get-carbon.org/help/Set-IisHttpHeader.html) for creating/setting a custom HTTP header for a website or one of its sub-directories.
 * Created [Get-IisMimeMap](http://get-carbon.org/help/Get-IisMimeMap.html) for getting the file extension to MIME type mappings for the IIS web server.
 * Created [Remove-IisMimeMap](http://get-carbon.org/help/Remove-IisMimeMap.html) for removing a file extension to MIME type mapping for the IIS web server.
 * Created [Set-IisMimeMap](http://get-carbon.org/help/Set-IisMimeMap.html) for creating/setting a file extension to MIME type mapping for the IIS web server.
 * When creating an app pool that runs under a custom, non-service account, [Install-IisAppPool](http://get-carbon.org/help/Install-IisAppPool.html) grants that user the `SeBatchLogonRight`.
 * [Install-IisAppPool](http://get-carbon.org/help/Install-IisAppPool.html) writes an error if its user account doesn't exist (i.e. if the value of the `Username` parameter doesn't exist).
 
### Privileges

 * Improved exception handling in [Grant-Privilege](http://get-carbon.org/help/Grant-Privilege.html) and [Revoke-Privilege](http://get-carbon.org/help/Revoke-Privilege.html).
 * [Grant-Privilege](http://get-carbon.org/help/Grant-Privilege.html) and [Revoke-Privilege](http://get-carbon.org/help/Revoke-Privilege.html) now write an error message if an identity doesn't exist.


## Bug Fixes

### Computer

 * [Install-SmbShare](http://get-carbon.org/help/Install-SmbShare.html) can't find `net.exe` when running as part of a Windows logon script.  Thanks to Paul Aage Aasheim for identifying and reporting this bug.  All usages of the `net.exe` application were updated to use the new [Resolve-NetPath](http://get-carbon.org/help/Resolve-NetPath.html) function, which get the path to `net.exe` without assuming it is in the user's `PATH` environment variable.
 
 
### Users and Groups

 * [Test-Identity](http://get-carbon.org/help/Test-Identity.html) no longer writes an error if it can't find a fully-qualified local user, e.g. `$env:COMPUTERNAME\Username`.
