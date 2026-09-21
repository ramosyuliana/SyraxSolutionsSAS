$files = Get-ChildItem -Path "AppSyraxSolutionsSAS" -Recurse -Include *.cs,*.aspx,*.sql
$corruptedFiles = @()
foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    
    # Check for specific corrupt characters
    $matches = [regex]::Matches($text, "[\u01F8\u01ED\uFFFD\u00C0-\u00C3][\u0080-\u00BF]?")
    if ($matches.Count -gt 0) {
        Write-Host "$($f.FullName) has $($matches.Count) suspect characters:"
        foreach ($m in $matches | Select-Object -First 5) {
            Write-Host "   Char: '$($m.Value)' (0x$(([int][char]$m.Value[0]).ToString('X4')))"
        }
    }
}
