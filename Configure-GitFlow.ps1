Function Configure-GitFlow
{	
	$currentPath = Split-Path ${function:Configure-GitFlow}.File -Parent

    # Find all 'PortableGit*' folders in the GitHub for Windows application folder
	$gitHubPath = "C:\Users\$env:username\AppData\Local\GitHub"
    $portableGitFolders = Get-ChildItem $gitHubPath | ?{ $_.PSIsContainer } | ?{$_.Name -like 'PortableGit*'}
	
    # Provision the PoSH GitFlow scripts for each instance of PortableGit
    foreach ($portableGitFolder in $portableGitFolders){

        $gitPath = (Join-Path (Join-Path $gitHubPath $portableGitFolder.Name) "bin")
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

