---
layout: post
title: Carbon v0.2.7 Released
date: 2012-09-03 9:25
comments: false
categories: [Announcements, Carbon]
---

I've released version 0.2.7 of Carbon this morning.  This release contains only new functionality:

## Enhancements

New functions for working with the registry:

 * [Get-RegistryKeyValue](http://get-carbon.org/help/Get-RegistryKeyValue.html): Get a value from a registry key.
 * [Install-RegistryKey](http://get-carbon.org/help/Install-RegistryKey.html): Create a new registry key.
 * [Remove-RegistryKeyValue](http://get-carbon.org/help/Remove-RegistryKeyValue.html): Remove a value from a registry key.
 * [Set-RegistryKeyValue](http://get-carbon.org/help/Set-RegistryKeyValue.html): Set/create a value in a registry key.
 * [Test-RegistryKeyValue](http://get-carbon.org/help/Test-RegistryKeyValue.html): Test if a value exists in a registry key.

Other enhancements:

 * [Unprotect-AclAccessRules](http://get-carbon.org/help/Unprotect-AclAccessRules.html): Turns off inherited access rules on an item in the file system or registry.
 * Added a `Clear` parameter to the [Grant-Permissions](http://get-carbon.org/help/Grant-Permissions.html) function for clearing any non-inherited permissions on a file system/registry item.

[Go get it!](https://bitbucket.org/splatteredbits/carbon/downloads)
