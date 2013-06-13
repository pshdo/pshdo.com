---
layout: post
title: Best Practices for Importing PowerShell Modules
date: 2012-06-04 14:59
comments: false
tags: ["best practice", modules, powershell]
permalink: /archive/2012/6/4/best-practices-for-importing-powershell-modules.html
---
## Importing Modules Is Messy

An error users encounter with [Carbon](http://get-carbon.org) is double-importing its extended type data file.  If Carbon has been imported in another module (i.e. Carbon is a sub-module of that module), when you use `Import-Module` to import Carbon, PowerShell will sometimes complain about not being able to load Carbon's extended data file:

    > Import-Module SubModuleWhichImportsCarbon
	> Import-Module Carbon
	Import-Module : The following error occurred while loading the extended type data file:
    Microsoft.PowerShell, Carbon.types.ps1xml : File skipped because it was already present from "Microsoft.PowerShell".
	
I've tried a bunch of things to mitigate this error.  I've always just wanted to import Carbon with one line of code:

    Import-Module Carbon
	
At first, I tried using the `-Force` parameter to `Import-Module`, but that didn't work.  Then I tried removing Carbon if it was present before importing it again:

    if( (Get-Module Carbon) )
	{
		Remove-Module Carbon
    }
	Import-Module Carbon
	
Unfortunately, the above code doesn't work when Carbon is a sub-module because `Get-Module` doesn't return sub-modules.  

Next, I updated all my modules that imported Carbon to check for and remove any stand-alone Carbon modules before importing Carbon.  I basically added the code above to all the modules that used Carbon.  This approach worked most of the time, but there were still weird edge cases that caused the double-import error.  The only solution left, I thought, was to re-write all my scripts to add additional code to detect a Carbon sub-module.  That's a lot of scripts to update and a lot of duplicate code between scripts.

## The Solution

Looking back, I can see that my brain was stuck in the rut of trying to solve the problem in each of my scripts using as few lines as possible.  It hit me the other day that I should write an `Import-Carbon.ps1` script which properly handles all the weird edge cases. With this script in place, I could update all my scripts that use Carbon to call `Import-Carbon.ps1` to do the import.

	$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
    & (Join-Path $PSScriptRoot Tools\Carbon\Import-Carbon.ps1 -Resolve)

Finally!  One line of code to import a module.  And, only one place to change if additional weird edge cases pop up.

## Sub-module Detection

Now, I just had to write code to detect a Carbon sub-module.  The best way to do this is to check for the presence of a variable or function specific to a module.  In this case, I use the `$CarbonImported` variable, which I added to Carbon for just this purpose:

    if( (Get-Module Carbon) )
    {
        Remove-Module Carbon
    }
    elseif( Test-Path "variable:CarbonImported" )
    {
        $var = Get-Variable 'CarbonImported'
        $varModule = Get-Module $var.Module
        Write-Warning ("Carbon already present as nested module in {0} module ({1})." -f $var.Module, $varModule.ModuleBase)    
        return
    }

    Import-Module Carbon

If Carbon is present as a sub-module, I write out a warning and return without attempting a re-import.  

## Therefore, What?

When writing a module, **always write and include a script that safely imports the module**.  I recommend using the above code as a template.  If you're using a module that doesn't include a safe import scrpt, write one yourself.  Test for a variable or function that is specific to the module.  (That's not fool-proof, however.  Users can always import individual functions and variables from your module.  In that case, the function/variable you're detecting may not have been imported, and the detection will fail.)  

**Don't** detect the presence of your assemblies or types.  They remain loaded even if your module has been removed.