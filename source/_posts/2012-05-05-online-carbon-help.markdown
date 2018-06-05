---
layout: post
title: Online Carbon Help
date: 2012-05-30 12:11
comments: false
categories: [Announcements, Carbon]
---

The current version of the [Carbon](http://get-carbon.org) help is now [online](http://get-carbon.org/help/).  There are still a lot of functions that have little to no documentation.  Now that I've put it online, and have automated scripts that will generate it for me, I'll be steadily improving the documentation.  It's my number one priority before I release version 1.0.

I'm using a heavily-modified version of [Out-Html](http://poshcode.org/587) to [convert the built-in help to HTML](https://bitbucket.org/splatteredbits/carbon/src/tip/Out-Html.ps1).  All the description and example explanations in the help are written using [Markdown](http://daringfireball.net/projects/markdown), and I'm using [MarkdownSharp](http://code.google.com/p/markdownsharp/) to convert to HTML.

The only outstanding improvement I'd like to make to the online help is to create links from type names to their MSDN documentation.