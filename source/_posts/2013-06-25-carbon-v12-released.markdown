---
layout: post
title: "Carbon v1.2 Released"
date: 2013-06-25 21:32
comments: false
tags: Carbon, Announcements
---

[Carbon](http://get-carbon.org) v1.2 is out, is [backwards compatible](http://semver.org) with v1.0 and v1.1 and supports PowerShell 3.  (Future releases of Carbon will most likely *only* support PowerShell 3.)  This release features mostly new functionality, including new functions for managing NTFS compression and performing XDT transformations.  Thanks to Mark Sargent and Philip Teilmeier for contributing enhancements.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Enhancements

### General

 * Carbon now works under PowerShell v3.0!

### Certificates

 * Added support for IPv6 addresses to [Get-SslCertificateBinding](http://get-carbon.org/help/Get-SslCertificateBinding.html), [Remove-SslCertificateBinding](http://get-carbon.org/help/Remove-SslCertificateBinding.html), and [Set-SslCertificateBinding](http://get-carbon.org/help/Set-SslCertificateBinding.html).

### .NET

 * Added `ProviderName` parameter to [Set-DotNetConnectionString ](http://get-carbon.org/help/Set-DotNetConnectionString.html) for setting a connection string's `providerName` attribute/value.

### File System

 * Created [Disable-NtfsCompression](http://get-carbon.org/help/Disable-NtfsCompression.html) function for disabling NTFS compression on files/directories.
 * Created [Enable-NtfsCompression](http://get-carbon.org/help/Enable-NtfsCompression.html) function for enabling NTFS compression on files/directories.
 * Created [Test-NtfsCompression](http://get-carbon.org/help/Test-NtfsCompression.html) function for testing if NTFS compression is enabled on a file/directory.

### IIS
 * The [site object](http://msdn.microsoft.com/en-us/library/microsoft.web.administration.site.aspx) returned by [Get-IisWebsite](http://get-carbon.org/help/Get-IisWebsite.html) now as a `CommitChanges` method so you can persist modifications you make to the site.
 * [Get-IisWebsite](http://get-carbon.org/help/Get-IisWebsite.html) now returns all websites if no `SiteName` is given.
 * Created [Set-IisWebsiteID](http://get-carbon.org/help/Set-IisWebsiteID.html) function for explicitly setting a website's ID.

### INI

 * Created [Remove-IniEntry](http://get-carbon.org/help/Remove-IniEntry.html) function for removing entries/settings from an INI file.

### Performance Counters

 * [Install-PerformanceCounter](http://get-carbon.org/help/Install-PerformanceCounter.html) now supports installing a base performance counter.  Thanks to Philip Teilmeier for the contribution.
 * [Install-PerformanceCounter](http://get-carbon.org/help/Install-PerformanceCounter.html)'s `Description` parameter is now optional.

### PowerShell

 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) now defaults to running under the current CLR, instead of defaulting to a v2.0 CLR.  This makes upgrading to PowerShell v3.0 easier.
 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) now writes an error and returns if running PowerShell v3.0 and you want to run under a v2.0 CLR.  Unfortunately, PowerShell v3.0 requires .NET 4.0, so you can't run anything on an earlier CLR.

### Privileges

 * [Revoke-Privilege](http://get-carbon.org/help/Revoke-Privilege.html) now supports case-insensitive privilege names.
 * Updated [Grant-Privilege](http://get-carbon.org/help/Grant-Privilege.html) to better handle when passing a privilege name with the wrong case.
 * Updated [Grant-Privilege](http://get-carbon.org/help/Grant-Privilege.html) documentation to make it clear privilege names are case-sensitive.

### XML

 * New [Convert-XmlFile](http://get-carbon.org/help/Convert-XmlFile.html), for transforming an XML file with Microsoft's XDT (XML Data Transformation) technology.  Thanks to Mark Sargent for the contribution.


## Bug Fixes

### General

 * Deleted the obsolete variable `$CarbonImported`.  Carbon no longer exports any of its variables.

### Certificates

 * [Get-SslCertificateBinding](http://get-carbon.org/help/Get-SslCertificateBinding.html) can't parse bindings to IPv6 addresses.

### Performance Counters

 * [Install-PerformanceCounter](http://get-carbon.org/help/Install-PerformanceCounter.html) couldn't be used to create counters that used/required a base counter. Thanks to Philip Teilmeier for the contribution.

