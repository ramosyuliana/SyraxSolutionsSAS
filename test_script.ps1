$utf8Bom = New-Object System.Text.UTF8Encoding($true)
$sql = "UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Ciudadanía (CC)' WHERE [Id] = 1;"
[System.IO.File]::WriteAllText("c:\Users\Admin\Desktop\C#\SyraxSolutions\test_utf8.sql", $sql, $utf8Bom)

Add-Type -AssemblyName System.Data
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;")
$conn.Open()
$cmd = $conn.CreateCommand()
$cmd.CommandText = "UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Ciudadanía (CC)' WHERE [Id] = 1"
$cmd.ExecuteNonQuery()

$cmd.CommandText = "SELECT [Nombre], CAST([Nombre] AS varbinary(50)) FROM [dbo].[TipoDocumento] WHERE [Id] = 1"
$r = $cmd.ExecuteReader()
if ($r.Read()) {
    $val = $r.GetString(0)
    $hex = [System.BitConverter]::ToString($r.GetValue(1))
    Write-Host "Read: $val"
    Write-Host "Hex: $hex"
}
$conn.Close()
