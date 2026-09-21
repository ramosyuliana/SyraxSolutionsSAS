$files = Get-ChildItem -Path "AppSyraxSolutionsSAS\AppSyraxSolutionsSAS" -Recurse -Include *.aspx,*.cs,*.designer.cs
foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    # Check for replacement character U+FFFD or mojibake like Ã, Â, Ǹ, etc.
    if ($text.Contains([char]0xFFFD) -or $text -match "[ÃÂǸǭ]") {
        Write-Host "Found encoding issue in: $($f.FullName)"
    }
}
