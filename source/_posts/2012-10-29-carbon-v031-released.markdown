---
layout: post
title: Carbon v0.3.1 Released
date: 2012-10-29 21:58
comments: false
categories: [Announcements, Carbon]
---

I've released Carbon v0.3.1, a 100% enhancement and new feature release.

## New Features
 * Created [Get-ComPermissions](http://get-carbon.org/help/Get-ComPermissions.html) function for getting COM Access or Launch and Activation Permissions.  These are the permissions you see in Component Services (i.e. dcomcnfg) when you right-click `My Computer`, select `Properties`, click the `COM Security` tab then click the `Edit Default..` or `Edit Limits...` buttons under **Access Permissions** or **Launch and Activation Permissions**, respectively.
 * Created [Grant-ComPermissions](http://get-carbon.org/help/Grant-ComPermissions.html) for granting COM Access and/or Launch and Activation permissions.
 * Created [Revoke-ComPermissions](http://get-carbon.org/help/Revoke-ComPermissions.html) for revoking COM Access and/or Launch and ACtivation permissions.
 * Created [Test-Identity](http://get-carbon.org/help/Test-Identity.html) function for testing if user or group exists on the local computer or in a domain.
 * Created [Resolve-IdentityName](http://get-carbon.org/help/Resolve-IdentityName.html) function for determinig a user/group's canonical name.  For example, it converts `Administrators` into `BUILTIN\Administrators`.
 * Created [Reset-MsmqQueueManagerID](http://get-carbon.org/help/Reset-MsmqQueueManagerID.html) function, which resets MSMQ's Queue Manager ID.

## Enhancements
 * Improved [Disable-IEEnhancedSecurityConfiguration](http://get-carbon.org/help/Disable-IEEnhancedSecurityConfiguration.html) and [Enable-IEActivationPermissions](http://get-carbon.org/help/Enable-IEActivationPermissions.html) for enabling Internet Explorer to run headless by non-priveleged users.
 * Changed the way [Invoke-WindowsInstaller](http://get-carbon.org/help/Invoke-WindowsInstaller.html) waits for MSI to finish installing: instead of searching for any MSI process, it now searches for an MSI process that is a child of the current PowerShell process.
 * Simplified how [Add-GroupMembers](http://get-carbon.org/help/Add-GroupMembers.html) adds group members.
 * The version number in the module manifest now gets updated correctly for each release.  You should now be able to tell what version you're running by looking in `Carbon\Carbon.psd1`, or, if Carbon is imported in your console, running `Get-Module Carbon | Select-Object Version`.
 * Improved the way the Windows Features functions detect the best way to manage Windows features.  The old way would write an error to the error stream, which bubbled up at weird times and made diagnosing real errors harder.
 * Added a `Quiet` parameter to [Set-RegistryKeyValue](http://get-carbon.org/help/Set-RegistryKeyValue.html) so that `Write-Host` output is muffled.

I'm pretty proud of the COM functions.  I'll try to carve out some time in the next week to describe them in more detail and why they're important.
