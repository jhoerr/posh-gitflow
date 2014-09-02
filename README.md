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

**Known Issues**
Depending on your computer's PoweerShell execution policy, you may receive the following error during installation step #1:
```
.\Configure-GitFlow.ps1 : File Configure-GitFlow.ps1 cannot be loaded. The file Configure-GitFlow.ps1 is
not digitally signed. You cannot run this script on the current system. For more information about running
scripts and setting execution policy, see about_Execution_Policies at
http://go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ .\Configure-GitFlow.ps1
+ ~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
```

To proceed without adjusting the system's execution policy, navigate to the file in Explorer, right-click and choose Properties, then click the Unblock button.
