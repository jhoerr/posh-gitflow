<# 
.SYNOPSIS 
    Adds PowerShell GitFlow extensions to GitHub for Windows
.DESCRIPTION
    This script adds support for PowerShell GitFlow to GitHub for Windows. The GitFlow scripts were developed
    by nvie (https://github.com/nvie/gitflow). This script is itself a modified version of a script developed 
    by Howard van Rooijen and documented in a fantastic series of blog posts about using GitHub with TeamCity: 
    http://blogs.endjin.com/2013/03/a-step-by-step-guide-to-using-gitflow-with-teamcity-part-1-different-branching-models/
.NOTES 
    Author     : John Hoerr - jhoerr@gmail.com
.LINK 
    http://github.com/jhoerr/posh-gitflow
#> 
Function Configure-GitFlow
{
    Param([string]$customGitPath = "")

    $currentPath = Split-Path ${function:Configure-GitFlow}.File -Parent
 
    if ($customGitPath -eq "") 
    {
        Write-Host "No custom git path supplied, looking for global git installation"

        $environment = Get-ChildItem Env:Path | Select-Object -First 1 -ExpandProperty "Value"
        $gitPath = $environment.Split(';') | Where-Object {$_.Contains("Git")} | Select-Object -First 1;

        if (Test-Path $gitPath)
        {
            Write-Host "Global git installation found at: $gitPath"
            $folders = $gitPath
        }
        else
        {
            Write-Host "No global git installation found, looking for PortableGit inside GitHub installation"
            # Find all 'PortableGit*' folders in the GitHub for Windows application folder
            $gitHubPath = "C:\Users\$env:username\AppData\Local\GitHub"
            $portaleGitFolders = Get-ChildItem $gitHubPath | ?{ $_.PSIsContainer } | ?{$_.Name -like 'PortableGit*'} | Join-Path -ChildPath "bin"

            if (Test-Path $portableGitFolders)
            {
                $folders = $portableGitFolders
            }
            else 
            {
                Write-Host "No PortableGit found inside GitHub installation"
            }
        }
    }	
    else 
    {
        if (Test-Path (Join-Path $customGitPath "git.exe"))
        {
            $folders = @($customGitPath)
        }
    }

    if ($folders.Length -eq 0)
    {
        Write-Host "No global Git in Path, no GitHub installation found or no custom path found"
        Return
    } 

	# Provision the PoSH GitFlow scripts for each instance of PortableGit
	foreach ($gitPath in $folders){
		Write-Host "Installing extensions to Git binaries in '$gitPath'" -ForegroundColor Green

		Write-Host "Copying Required supporting binaries"
		Copy-Item (Join-Path $currentPath "Dependencies\*.*") -Destination $gitPath -Verbose
    	
		Write-Host "Copying GitFlow extensions"
		Copy-Item (Join-Path $currentPath "GitFlowExtensions\**") -Destination $gitPath -Verbose
    	
		Write-Host "Copying Git components"
		Copy-Item (Join-Path $gitPath "libiconv-2.dll") -Destination (Join-Path $gitPath "libiconv2.dll") -Verbose
	}

	Write-Host "Press Any Key to finish"
	Read-Host
}


Configure-GitFlow
