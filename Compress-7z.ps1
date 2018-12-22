Param(
    [parameter (Mandatory = $true)]
    $SourceFolder,
    [parameter (Mandatory = $true)]
    $Destination7zFile,
    [Parameter (Mandatory = $false)]
    $CPUs,
    [parameter (Mandatory = $false)]
    $LogPath

)
function CompressWith7z ($SourcePath,$TargetPath,$CPUs){
    $7zArgs = @('a','-t7z','-bb3','-up1q0r2x1y2z1w2','-m0=lzma2',"`"$TargetPath`"","`"$SourcePath`"")
    
    if($CPUs){
        $7zArgs += "-mmt$CPUs"
    }
    $7zProcess = & 'C:\Program Files\7-Zip\7z.exe' $7zArgs
    
    
    return @{
        Command  = $7zArgs
        Output   = $7zProcess
        ExitCode = $LASTEXITCODE
    }
}

$Result = CompressWith7z -SourcePath $SourceFolder -TargetPath $Destination7zFile -CPUs $CPUs
if($LogPath){
    Set-Content -Path $LogPath -Value @"
Date:      $(Get-Date)
Exit code: $($Result.ExitCode)

7Zip Arguments: $($Result.Command)

7Zip Output
=====================================================================
$($Result.Output | Out-String)
"@
}
