$files = Get-ChildItem -Path "c:\Users\Admin\Desktop\C#\SyraxSolutions\AppSyraxSolutionsSAS" -Recurse -Include *.aspx,*.cs,*.designer.cs,*.html,*.sql
$found = 0
foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    
    # Check for mojibake patterns: Ã followed by another char, or 
    if ($text -match "[\uFFFD]|Ã[\u0080-\u00BF]") {
        Write-Host "Mojibake in: $($f.FullName)"
        $found++
    }
}
Write-Host "Total files with mojibake: $found"
