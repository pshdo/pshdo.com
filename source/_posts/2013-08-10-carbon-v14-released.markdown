---
layout: post
title: "Carbon v1.4 Released"
date: 2013-08-10 3:50
comments: false
categories: Carbon, Announcements
---

[Carbon](http://get-carbon.org) v1.4 is out and is [backwards compatible](http://semver.org) with v1.0 through v1.3.  This release adds a few new features and some bug fixes introduced in v1.3.

This will most likely be the last version of Carbon tested and supported on PowerShell 2.  We'll be moving the build server to PowerShell 3 sometime around August 15th, which means that's the version of PowerShell the automated tests will use.  We encourage everyone to upgrade to PowerShell 3 as soon as possible.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Enhancements

### File System

 * Created [Install-Junction](http://get-carbon.org/help/Install-Junction.html) function for creating new and/or updating existing junctions. This is a more idempotent way of creating junctions, as opposed to [New-Junction](http://get-carbon.org/help/New-Junction.html) and [Remove-Junction](http://get-carbon.org/help/Remove-Junction.html) which report errors if a junction already exists or doesn't exist, respectively.

### IIS

 * Objects returned by [Get-IisWebsite](http://get-carbon.org/help/Get-IisWebsite.html) now have a dynamic `PhysicalPath` script property, so you don't have to traverse down into the default application's default virtual directory object to get it.
 * [Install-IisApplication](http://get-carbon.org/help/Install-IisApplication.html), [Install-IisWebsite](http://get-carbon.org/help/Install-IisWebsite.html), and [Install-IisVirtualDirectory](http://get-carbon.org/help/Install-IisVirtualDirectory.html) now canonicalize physical paths, i.e. they convert any path with a relative part (e.g. '..') to a full path.  It turns out IIS doesn't like paths with relative parts.
 * Created [Get-IisApplication](http://get-carbon.org/help/Get-IisApplication.html) function to get `Microsoft.Web.Administration.Application` objects for all or specific applications under a website.
 * [Install-IisApplication](http://get-carbon.org/help/Install-IisApplication.html) now uses the `Microsoft.Web.Administration` API instead of `appcmd.exe`.
 
### PowerShell

 * Added `ExecutionPolicy` parameter to [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) to allow setting a custom exeuction policy when using [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) to run a script.

## Bug Fixes

### IIS

 * [Install-IisApplication](http://get-carbon.org/help/Install-IisApplication.html) not updating/changing physical path on existing application.

### .NET

 * [Set-DotNetAppSetting](http://get-carbon.org/help/Set-DotNetAppSetting.html) and [Set-DotNetConnectionString](http://get-carbon.org/help/Set-DotNetConnectionString.html) failed if setting .NET configuration under an architecture where the PowerShell execution policy doesn't allow running scripts.
