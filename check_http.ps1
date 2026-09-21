$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0")
$bytes = $wc.DownloadData("http://localhost:8088/index.aspx")
$utf8 = [System.Text.Encoding]::UTF8.GetString($bytes)

$idx = $utf8.IndexOf("<title>")
if ($idx -ge 0) {
    $titleSnippet = $utf8.Substring($idx, 60)
    Write-Host "Title snippet UTF8: $titleSnippet"
    $titleBytes = [System.Text.Encoding]::UTF8.GetBytes($titleSnippet)
    Write-Host "Hex: $([System.BitConverter]::ToString($titleBytes))"
}
