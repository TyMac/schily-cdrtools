$ErrorActionPreference = 'Stop'
 
$fileName  = 'schily-cdrtools-3.02a07.7z'
$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$zip_path = "$toolsPath\$fileName"
Remove-Item $toolsPath\* -Recurse -Force -Exclude $fileName
 
$packageArgs = @{
    PackageName  = 'schily-cdrtools'
    FileFullPath = $zip_path
    Destination  = $toolsPath
}
Get-ChocolateyUnzip @packageArgs
Remove-Item $zip_path -ea 0
