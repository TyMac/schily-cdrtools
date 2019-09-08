$ErrorActionPreference = 'Stop'

$version = "3.02a07"
$url = "https://svwh.dl.sourceforge.net/project/tumagcc/schily-cdrtools-$version.7z"
$checksum = "CEF986C790F63B2D815E28502DEA1A75090B6F15F9B016F970B91AA2F60795C3"
$fileName  = "schily-cdrtools-$version.7z"
$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$zip_path = "$toolsPath\$fileName"
Remove-Item $toolsPath\* -Recurse -Force -Exclude $fileName
 
$packageArgs = @{
    Url             = $url
    Checksum        = $checksum
    ChecksumType    = 'sha256'
    PackageName     = 'schily-cdrtools'
    FileFullPath    = $zip_path
    Destination     = $toolsPath
}
Get-ChocolateyUnzip @packageArgs
Remove-Item $zip_path -ea 0
