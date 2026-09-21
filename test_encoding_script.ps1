Add-Type -AssemblyName System.Data
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;")
$conn.Open()
$cmd = $conn.CreateCommand()
$cmd.CommandText = "UPDATE TipoDocumento SET Nombre = @nombre WHERE Id = 1"
$cmd.Parameters.AddWithValue("@nombre", "Cédula de Ciudadanía (CC)")
$cmd.ExecuteNonQuery()
$cmd.CommandText = "SELECT Nombre, CAST(Nombre as varbinary(50)) FROM TipoDocumento WHERE Id = 1"
$r = $cmd.ExecuteReader()
if ($r.Read()) {
    $val = $r.GetString(0)
    $hex = [System.BitConverter]::ToString($r.GetValue(1))
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    Write-Host "Read back: $val"
    Write-Host "Hex in DB: $hex"
}
$conn.Close()
