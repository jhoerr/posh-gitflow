posh-gitflow
============

Adds PowerShell extensions to GitHub for Windows to enable GitFlow source code management

**Description**

This script adds support for PowerShell GitFlow to GitHub for Windows. The GitFlow <a href="http://nvie.com/posts/a-successful-git-branching-model/">concept</a> and <a href="https://github.com/nvie/gitflow">core scripts</a> were developed by nvie. The cheatsheet and script offered here is a modified version of one developed by Howard van Rooijen and documented in a fantastic <a href="http://blogs.endjin.com/2013/03/a-step-by-step-guide-to-using-gitflow-with-teamcity-part-1-different-branching-models/">series of blog posts</a> about using GitHub with TeamCity.

**Installation**

1. Run `./Configure-GitFlow.ps1`
2. In the GitHub for Windows client, browse to a repository and 'Open in Git Shell'
3. Run `git flow init` to initialize the repository for GitFlow.
4. Review the <a href="https://github.com/jhoerr/posh-gitflow/raw/master/One-Page%20GitFlow-Cheatsheet.pdf">One-Page GitFlow Cheatsheet</a> to learn the commands.



