Add-Type -AssemblyName System.Data
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;")
$conn.Open()
$cmd = $conn.CreateCommand()
$cmd.CommandText = "SELECT Id, Nombre FROM TipoDocumento"
$r = $cmd.ExecuteReader()
while ($r.Read()) {
    $id = $r.GetInt32(0)
    $val = $r.GetString(1)
    Write-Host "Id: $id - Value: $val"
}
$r.Close()
$conn.Close()
