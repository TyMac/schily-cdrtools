$ErrorActionPreference = 'Stop'

$version = "3.02a07"
$url = "https://svwh.dl.sourceforge.net/project/tumagcc/schily-cdrtools-$version.7z"
$checksum = "BAD39F9B5CEF30013E8DEF5375397C3B891745BC4C69B30532908B3A89116121"
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
