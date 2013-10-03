---
layout: post
title: "Carbon v1.5.1 Released"
date: 2013-10-03 16:10
comments: false
tags: Carbon, Announcements
---

[Carbon](http://get-carbon.org) v1.5.1 is out and is [backwards compatible](http://semver.org) with v1.0 through v1.5.  It supports PowerShell 2.  It contains two bug fixes.

[Get the bits at BitBucket.](https://bitbucket.org/splatteredbits/carbon/downloads)

## Bug Fixes

### IIS

 * [Set-IisWebsiteID](http://get-carbon.org/help/Set-IisWebsiteID.html) wasn't consistently starting a website after changing its ID.

### Shares

 * [Install-SmbShare](http://get-carbon.org/help/Install-SmbShare.html) writes an error when running under strict mode.  (It has an unused variable which uses an undefined variable to create its value.  Removed the unused variable.)
 
 