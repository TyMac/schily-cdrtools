$ErrorActionPreference = 'Stop'

$version = "3.02a09"
$url = "https://svwh.dl.sourceforge.net/project/tumagcc/schily-cdrtools-$version.7z"
$checksum = "0B83F199EBF72CC5A1B60BCB4AA915A420C33B8886B00496E21467E5845AA135"
$checksumType = "sha256"
$fileName  = "schily-cdrtools-$version.7z"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zip_path = "$toolsDir\$fileName"
Remove-Item $toolsDir\* -Recurse -Force -Exclude $fileName

$packageArgs = @{
    Url             = $url
    Checksum        = $checksum
    ChecksumType    = $checksumType
    UnzipLocation   = $toolsDir
    PackageName     = 'schily-cdrtools'
    FileFullPath    = $zip_path
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item $zip_path -ea 0
