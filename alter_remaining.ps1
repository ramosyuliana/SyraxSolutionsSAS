Add-Type -AssemblyName System.Data
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;")
$conn.Open()

function Exec-Sql($sql) {
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $sql
    $cmd.ExecuteNonQuery() | Out-Null
}

Write-Host "Modificando indices y columnas restantes..."

# Drop index IX_Usuario if exists
$dropIndex = @"
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Usuario' AND object_id = OBJECT_ID('[dbo].[Usuario]'))
BEGIN
    DROP INDEX [IX_Usuario] ON [dbo].[Usuario];
END
"@
Exec-Sql $dropIndex

$alterRest = @"
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Correo] NVARCHAR(150);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Telefono] NVARCHAR(50);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Direccion] NVARCHAR(200);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Clave] NVARCHAR(250);

ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Titulo] NVARCHAR(150);
ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Descripcion] NVARCHAR(500);
ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Estado] NVARCHAR(50);

ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Titulo] NVARCHAR(150);
ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Mensaje] NVARCHAR(250);
ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Canal] NVARCHAR(50);

ALTER TABLE [dbo].[Historial] ALTER COLUMN [Estado] NVARCHAR(50);
"@
Exec-Sql $alterRest

# Recreate index IX_Usuario
$recreateIndex = @"
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuario] ON [dbo].[Usuario] ([Correo] ASC);
"@
Exec-Sql $recreateIndex
Write-Host "Indice y columnas restantes convertidas con exito."

# Re-ejecutar actualizacion de datos para asegurar tildes en todas las tablas
$updateAll = @"
UPDATE [dbo].[Usuario] SET 
    [Nombres] = N'Admin',
    [Apellidos] = N'Syrax',
    [Direccion] = N'Calle 100 # 15-20, Bogotá D.C.'
WHERE [Id] = 1;

UPDATE [dbo].[Usuario] SET 
    [Nombres] = N'Carlos',
    [Apellidos] = N'Mendoza',
    [Direccion] = N'Carrera 7 # 71-52, Bogotá D.C.'
WHERE [Id] = 2;

UPDATE [dbo].[Usuario] SET 
    [Nombres] = N'Laura Sofía',
    [Apellidos] = N'Vargas',
    [Direccion] = N'Calle 26 # 68-10, Bogotá D.C.'
WHERE [Id] = 3;

UPDATE [dbo].[Proyecto] SET 
    [Titulo] = N'Cloud Infrastructure Migration',
    [Descripcion] = N'Modernización y migración integral de infraestructura on-premise a la nube de AWS.',
    [Estado] = N'En Desarrollo'
WHERE [Id] = 1;

UPDATE [dbo].[Proyecto] SET 
    [Titulo] = N'Portal Empresarial B2B',
    [Descripcion] = N'Desarrollo de plataforma web para autogestión de clientes corporativos y pedidos.',
    [Estado] = N'En Revisión'
WHERE [Id] = 2;

IF NOT EXISTS (SELECT 1 FROM [dbo].[Proyecto] WHERE [Id] = 3)
BEGIN
    SET IDENTITY_INSERT [dbo].[Proyecto] ON;
    INSERT INTO [dbo].[Proyecto] ([Id], [Titulo], [Descripcion], [FechaCreacion], [FechaEntrega], [Estado], [Precio], [IdSuscripcion]) VALUES
    (3, N'App Móvil Corporativa & Logística', N'Aplicación móvil para conductores y supervisores con trazabilidad GPS en tiempo real.', '2026-08-20', '2026-12-20', N'En Desarrollo', 8200000.00, 1),
    (4, N'Auditoría de Ciberseguridad & DevOps', N'Implementación de pipelines CI/CD seguros, análisis de vulnerabilidades y hardening.', '2026-09-01', '2026-10-15', N'Finalizado', 3900000.00, 1);
    SET IDENTITY_INSERT [dbo].[Proyecto] OFF;
END
"@
Exec-Sql $updateAll
Write-Host "Datos actualizados."

$conn.Close()
