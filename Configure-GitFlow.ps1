Function Configure-GitFlow
{	
	$currentPath = Split-Path ${function:Configure-GitFlow}.File -Parent
	$operatingSystem = Get-WmiObject -Class Win32_OperatingSystem | Select-Object OSArchitecture

	if ($operatingSystem.OSArchitecture -eq "64-bit")
	{
		$programFilesPath = ${Env:ProgramFiles(x86)}
	}
	else
	{
		$programFilesPath = ${Env:ProgramFiles}
	}

	$gitPath = "C:\Users\$env:username\AppData\Local\GitHub\PortableGit_6d98349f44ba975cf6c762a720f8259a267ea445\bin"
	
	Write-Host "Copying Required supporting binaries"
	
	Copy-Item (Join-Path $currentPath "Dependencies\*.*") -Destination $gitPath -Verbose
	
	Write-Host "Copying GitFlow extensions"
	
	Copy-Item (Join-Path $currentPath "GitFlowExtensions\**") -Destination $gitPath -Verbose
	
	Write-Host "Copying Git components"
	
	Copy-Item (Join-Path $gitPath "libiconv-2.dll") -Destination (Join-Path $gitPath "libiconv2.dll") -Verbose

	Write-Host "Press Any Key to finish"
	Read-Host
}

Configure-GitFlow
