---
layout: post
title: "Carbon 1.6 Released"
date: 2014-02-01 12:14
comments: true
categories: [ Carbon, Announcements ]
---

[Carbon](http://get-carbon.org) 1.6 is out and is [backwards compatible](http://semver.org) with 1.0 through 1.5.1.  It supports PowerShell 2.  It contains a few bug fixes and many enhancements.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Bug Fixes

### File System

 * [Remove-Junction](http://get-carbon.org/help/Remove-Junction.html) doesn't delete a junction when given a relative path to the junction.
 
### Services

 * [Install-Service](http://get-carbon.org/help/Install-Service.html) doesn't properly resolve a service's path.
 
### Shares

 * Fixed [Install-SmbShare](http://get-carbon.org/help/Install-SmbShare.html) example to use correct syntax. [#111.](https://bitbucket.org/splatteredbits/carbon/issue/111)

## Enhancements

### Hosts File

 * Created [Remove-HostsEntry](http://get-carbon.org/help/Remove-HostsEntry.html) function for removing hostnames from a hosts file.

### IIS

 * Created [Join-IisVirtualPath](http://get-carbon.org/help/Join-IisVirtualPath.html) for joining paths used by the IIS APIs.
 * Renamed all IIS `Path` parameters which represented virtual paths to `VirtualPath` (with backwards-compatible aliases):
    * [Disable-IisSecurityAuthentication](http://get-carbon.org/help/Disable-IisSecurityAuthentication.html)
    * [Enable-IisDirectoryBrowsing](http://get-carbon.org/help/Enable-IisDirectoryBrowsing.html)
    * [Enable-IisSecurityAuthentication](http://get-carbon.org/help/Enable-IisSecurityAuthentication.html)
    * [Enable-IisSsl](http://get-carbon.org/help/Enable-IisSsl.html)
    * [Get-IisApplication](http://get-carbon.org/help/Get-IisApplication.html)
    * [Get-IisConfigurationSection](http://get-carbon.org/help/Get-IisConfigurationSection.html)
    * [Get-IisHttpHeader](http://get-carbon.org/help/Get-IisHttpHeader.html)
    * [Get-IisHttpRedirect](http://get-carbon.org/help/Get-IisHttpRedirect.html)
    * [Get-IisMimeMap](http://get-carbon.org/help/Get-IisMimeMap.html)
    * [Get-IisSecurityAuthentication](http://get-carbon.org/help/Get-IisSecurityAuthentication.html)
    * [Set-IisHttpHeader](http://get-carbon.org/help/Set-IisHttpHeader.html)
    * [Set-IisHttpRedirect](http://get-carbon.org/help/Set-IisHttpRedirect.html)
    * [Set-IisWindowsAuthentication](http://get-carbon.org/help/Set-IisWindowsAuthentication.html)
    * [Test-IisConfigurationSection](http://get-carbon.org/help/Test-IisConfigurationSection.html)
    * [Test-IisSecurityAuthentication](http://get-carbon.org/help/Test-IisSecurityAuthentication.html)
 * Renamed [Get-IisWebsite](http://get-carbon.org/help/Get-IisWebsite.html)'s `SiteName` parameter to `Name` (with a backwards-compatible alias).
 * Renamed all IIS `Name` parameters which represented virtual paths to `VirtualPath` (with backwards-compatible aliases):
    * [Install-IisApplication](http://get-carbon.org/help/Install-IisApplication.html)
    * [Install-IisVirtualDirectory](http://get-carbon.org/help/Install-IisVirtualDirectory.html)
 * Renamed all IIS `Path` parameters which represented physical paths to `PhysicalPath` (with backwards-compatible aliases):
    * [Install-IisApplication](http://get-carbon.org/help/Install-IisApplication.html)
    * [Install-IisVirtualDirectory](http://get-carbon.org/help/Install-IisVirtualDirectory.html)
    * [Install-IisWebsite](http://get-carbon.org/help/Install-IisWebsite.html)
    
### .NET

 * Created [Test-DotNet](http://get-carbon.org/help/Test-DotNet.html) for testing if v2 or v4 of the .NET framework is installed.

### Path

 * Created [Get-PathProvider](http://get-carbon.org/help/Get-PathProvider.html) function for getting a path's PowerShell provider.
 
### PowerShell

 * Updated [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) to test if the appropriate .NET framework is installed if the user chooses an explicit runtime to use.

### Security

 * Created [Test-Permission](http://get-carbon.org/help/Test-Permission.html) function for checking if a user/group has a set of permissions and, optionally, a set of inheritance and propagation flags on a file, directory, or registry key.
 * [Test-Permission](http://get-carbon.org/help/Test-Permission.html) now automatically includes the `Synchronize` permission when checking for exact permissions, since this permission is always on and can never be removed from a file/directory.

### Services

 * [Install-Service](http://get-carbon.org/help/Install-User.html) no longer requires a password, in order to support [managed service accounts and virtual accounts](http://technet.microsoft.com/en-us/library/dd548356.aspx).  We have no idea if this works, since we can't test locally.  Please let us know if this fix works for you. [#114](https://bitbucket.org/splatteredbits/carbon/issue/114)
 
### Users and Groups

 * Updated [Install-User](http://get-carbon.org/help/Install-User.html) to support passwords longer than 14 characters.  Thanks to [James Crowley](http://www.jamescrowley.co.uk/) for the fix.

### Windows Features

 * Marked Assert-WindowsFeatureFunctionsSupported as an internal function.  Please don't use.  It will be removed from future versions of PowerShell.
 * Updated [Test-WindowsFeature](http://get-carbon.org/help/Invoke-PowerShell.html) to work on Windows 8/2012.
 * Created new `Carbon.Identity` class for representing identities.  It also contains a static `FindByName` method which uses The Windows `LookupAccountName` function to find full account names, domains, and sids.  
 * Updated [Test-Identity](http://get-carbon.org/help/Test-Identity.html) to use `[Carbon.Identity]::FindByName` to find identities so it no longer throws exceptions when an identity can't be found.
 * Updated [Resolve-IdentityName](http://get-carbon.org/help/Resolve-IdentityName.html) to use `[Carbon.Identity]::FindByName` to find identities so it no longer throws exceptions when an identity can't be found.
 