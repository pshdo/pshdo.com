---
layout: post
title: Monitoring Windows Process Start and Exit Events
date: 2013-03-18 14:14
comments: false
categories: [ "Process Monitor", Sysinternals, Troubleshooting ]
---

Part of my build server management responsibilities include trying to figure out why things are going wrong.  I don't know about other environments, but our builds run a lot of processes. For example, we use [Robocopy](http://technet.microsoft.com/en-us/library/cc733145.aspx) to individually deploy a website's sub-directories.  When things go wrong, it's hard to debug because these robocopy processes start and stop so quickly, I don't have time to double-click them in [Process Explorer](http://technet.microsoft.com/en-us/sysinternals/bb896653). I usually resorted to adding lines in our deployment script to output the Robocopy command line and exit code, then running the build, waiting for it to finish, then inspecting the build logs.  

*Ugh.*

Last week, I discovered that [Process Monitor](http://technet.microsoft.com/en-us/sysinternals/bb896645.aspx) captures process start and exit events.  Just the information I need in these situations.

Open Process Monitor, and click the "Filter" button.

<img src="/storage/screenshots/procmon/ProcessMonitorFilterButton.png" alt=""/>

Create a new condition that matches when the `Operation` column contains the word `process` (don't forget to click the `Add` button).

<img src="/storage/screenshots/procmon/ProcessMonitorFilterOperationContainsProcess.png" alt=""/>

Click OK and Process Monitor will start to show process start and exit events. Start events will show the parent process ID and command line used to start the program. Exit events will show the exit/return code and CPU/memory statistics.

<img src="/storage/screenshots/procmon/ProcessMonitorProcessStartExitEvents.png" alt=""/>

 If you double-click the start event, you'll be able to see the entire command line and all the process's environment variables.

Thanks to the [Windows Sysinternals team](http://technet.microsoft.com/en-us/sysinternals/bb545021.aspx) for the great tools.
