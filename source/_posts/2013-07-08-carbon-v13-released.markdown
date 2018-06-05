---
layout: post
title: "Carbon v1.3 Released"
date: 2013-07-08 21:39
comments: false
categories: Carbon, Announcements
---

[Carbon](http://get-carbon.org) v1.3 is out, is [backwards compatible](http://semver.org) with v1.0 through v1.2.  This release  improves PowerShell 3 compatibility, updates [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) so it can run scripts, and adds [ConvertTo-Base64](http://get-carbon.org/help/ConvertTo-Base64.html) and [ConvertFrom-Base64](http://get-carbon.org/help/ConvertFrom-Base64.html) functions.

Thanks to [Jason Stangroome](http://blog.codeassassin.com/) for the feedback that contributed to the work done in this release.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Enhancements

### PowerShell

 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) now supports running an external script.
 * Added `OutputFormat` argument to [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) so your scripts/script blocks can return XML results instead of plain text.
 * Renamed [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html)'s `Args` parameter to `ArgumentList` (with backwards compatibile `Args` alias).
 * Renamed [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html)'s `Command` parameter to `ScriptBlock` (with backwards-compatible `Command` alias).
 * [Invoke-PowerShell](http://get-carbon.org/help/Invoke-PowerShell.html) now runs 64-bit PowerShell from 32-bit PowerShell.
 * [Get-PowerShellPath](http://get-carbon.org/help/Get-PowerShellPath.html) now returns path for 64-bit PowerShell when running 32-bit PowerShell.

### Text

 * Created new [ConvertTo-Base64](http://get-carbon.org/help/ConvertTo-Base64.html) function for encoding strings in base-64.
 * Created new [ConvertFrom-Base64](http://get-carbon.org/help/ConvertFrom-Base64.html) function for decoding base-64 strings.

 
## Bug Fixes
 
### .NET

 * [Set-DotNetAppSetting](http://get-carbon.org/help/Set-DotNetAppSetting.html) and [Set-DotNetConnectionString](http://get-carbon.org/help/Set-DotNetConnectionString.html) weren't able to set .NET 2.0 app settings and connections string when running under PowerShell 3.
