#powershell script, numbers in substring to change with length of filename

#removes current zip and zips contents in one version higher
#for uploading .php files to AWS

#change path to whichever folder you're working on
$path = ".\soc"
$destinationpath = ".\soc"

#for removing and increasing versions
$i = [string[]](Get-ChildItem $path *.zip) | Out-String
$length = $i.length - 11
$version = $i.Substring(5, $length)

$version = [int]$version + 1
write-host "Version: $version"

rm $path/*.zip
compress-archive -Path "$path\*" -DestinationPath "$destinationpath\soc v$version.zip"
