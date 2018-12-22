# Compress-7z
A PowerShell script to compress files and folders using 7Zip 

```PowerShell 
$SourceFolder    = "C:\Folder To Compress"
$DestinationFile = "C:\7ZipFile.7z"
$CPUs            = 2 #Optional
$LogFile         = "C:\CompressionLog.log" #Optional

.\Compress-7z.ps1 -SourceFolder $SourceFolder -Destination7zFile $DestinationFile -LogPath $LogFile -CPUs $CPUs
```

