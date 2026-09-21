Add-Type -AssemblyName System.Data
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;")
$conn.Open()

function Exec-Sql($sql) {
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $sql
    $cmd.ExecuteNonQuery() | Out-Null
}

Write-Host "1. Modificando columnas a NVARCHAR para soporte Unicode total..."
$alterSql = @"
-- TipoDocumento
ALTER TABLE [dbo].[TipoDocumento] ALTER COLUMN [Nombre] NVARCHAR(100);

-- MetodoPago
ALTER TABLE [dbo].[MetodoPago] ALTER COLUMN [Nombre] NVARCHAR(100);

-- Rol
ALTER TABLE [dbo].[Rol] ALTER COLUMN [Nombre] NVARCHAR(100);

-- TipoPlan
ALTER TABLE [dbo].[TipoPlan] ALTER COLUMN [Nombre] NVARCHAR(150);

-- Plan
ALTER TABLE [dbo].[Plan] ALTER COLUMN [Nombre] NVARCHAR(150);
ALTER TABLE [dbo].[Plan] ALTER COLUMN [Descripcion] NVARCHAR(250);
ALTER TABLE [dbo].[Plan] ALTER COLUMN [Estado] NVARCHAR(50);

-- Empresa
ALTER TABLE [dbo].[Empresa] ALTER COLUMN [Nit] NVARCHAR(50);
ALTER TABLE [dbo].[Empresa] ALTER COLUMN [Nombre] NVARCHAR(100);
ALTER TABLE [dbo].[Empresa] ALTER COLUMN [Direccion] NVARCHAR(200);
ALTER TABLE [dbo].[Empresa] ALTER COLUMN [Telefono] NVARCHAR(50);
ALTER TABLE [dbo].[Empresa] ALTER COLUMN [Descripcion] NVARCHAR(250);

-- Usuario
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [NumeroDocumento] NVARCHAR(50);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Nombres] NVARCHAR(100);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Apellidos] NVARCHAR(100);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Correo] NVARCHAR(150);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Telefono] NVARCHAR(50);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Direccion] NVARCHAR(200);
ALTER TABLE [dbo].[Usuario] ALTER COLUMN [Clave] NVARCHAR(250);

-- Proyecto
ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Titulo] NVARCHAR(150);
ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Descripcion] NVARCHAR(500);
ALTER TABLE [dbo].[Proyecto] ALTER COLUMN [Estado] NVARCHAR(50);

-- Notificaciones
ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Titulo] NVARCHAR(150);
ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Mensaje] NVARCHAR(250);
ALTER TABLE [dbo].[Notificaciones] ALTER COLUMN [Canal] NVARCHAR(50);

-- Historial
ALTER TABLE [dbo].[Historial] ALTER COLUMN [Estado] NVARCHAR(50);
"@
Exec-Sql $alterSql
Write-Host "Columnas convertidas a NVARCHAR con exito."

Write-Host "2. Actualizando datos maestros con tildes y enes correctas..."
$updateMaestros = @"
-- Roles
UPDATE [dbo].[Rol] SET [Nombre] = N'Administrador' WHERE [Id] = 1;
UPDATE [dbo].[Rol] SET [Nombre] = N'Cliente' WHERE [Id] = 2;
UPDATE [dbo].[Rol] SET [Nombre] = N'Desarrollador' WHERE [Id] = 3;

-- Tipos de Documento
UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Ciudadanía (CC)' WHERE [Id] = 1;
UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Extranjería (CE)' WHERE [Id] = 2;
UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Pasaporte' WHERE [Id] = 3;
UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'NIT / Registro Mercantil' WHERE [Id] = 4;

-- Metodos de Pago
UPDATE [dbo].[MetodoPago] SET [Nombre] = N'Transferencia Bancaria' WHERE [Id] = 1;
UPDATE [dbo].[MetodoPago] SET [Nombre] = N'Tarjeta de Crédito' WHERE [Id] = 2;
UPDATE [dbo].[MetodoPago] SET [Nombre] = N'PSE' WHERE [Id] = 3;
UPDATE [dbo].[MetodoPago] SET [Nombre] = N'Efectivo' WHERE [Id] = 4;

-- Tipos de Plan
UPDATE [dbo].[TipoPlan] SET [Nombre] = N'Desarrollo de Software a la Medida' WHERE [Id] = 1;
UPDATE [dbo].[TipoPlan] SET [Nombre] = N'Mantenimiento e Infraestructura' WHERE [Id] = 2;
UPDATE [dbo].[TipoPlan] SET [Nombre] = N'Soporte y Consultoría Cloud' WHERE [Id] = 3;

-- Planes
UPDATE [dbo].[Plan] SET 
    [Nombre] = N'Plan Arquitectura Cloud & Modernización',
    [Descripcion] = N'Migración integral y arquitectura resiliente en AWS / Azure.'
WHERE [Id] = 1;

UPDATE [dbo].[Plan] SET 
    [Nombre] = N'Plan Desarrollo Plataforma Web / SaaS',
    [Descripcion] = N'Diseño y construcción completa de portal web y servicios backend.'
WHERE [Id] = 2;

UPDATE [dbo].[Plan] SET 
    [Nombre] = N'Plan Soporte y Mantenimiento Premium 24/7',
    [Descripcion] = N'Monitoreo preventivo, resolución de tickets y optimización mensual.'
WHERE [Id] = 3;

-- Empresas
UPDATE [dbo].[Empresa] SET 
    [Nombre] = N'Syrax Solutions S.A.S.',
    [Direccion] = N'Calle 100 # 15-20 Oficina 501, Bogotá D.C.',
    [Telefono] = N'+57 (601) 300-1234',
    [Descripcion] = N'Soluciones tecnológicas empresariales y transformación digital de alto impacto.'
WHERE [Id] = 1;

UPDATE [dbo].[Empresa] SET 
    [Nombre] = N'Acme Corporation',
    [Direccion] = N'Carrera 7 # 71-52 Torre B, Bogotá D.C.',
    [Telefono] = N'+57 (601) 310-9876',
    [Descripcion] = N'Empresa líder en distribución y logística internacional.'
WHERE [Id] = 2;

-- Usuarios
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

-- Proyectos existentes
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
"@
Exec-Sql $updateMaestros
Write-Host "Datos maestros corregidos con ortografia exacta."

Write-Host "3. Insertando proyectos adicionales y enriqueciendo el catalogo..."
$proyectosSql = @"
IF NOT EXISTS (SELECT 1 FROM [dbo].[Proyecto] WHERE [Id] = 3)
BEGIN
    SET IDENTITY_INSERT [dbo].[Proyecto] ON;
    INSERT INTO [dbo].[Proyecto] ([Id], [Titulo], [Descripcion], [FechaCreacion], [FechaEntrega], [Estado], [Precio], [IdSuscripcion]) VALUES
    (3, N'App Móvil Corporativa & Logística', N'Aplicación móvil para conductores y supervisores con trazabilidad GPS en tiempo real.', '2026-08-20', '2026-12-20', N'En Desarrollo', 8200000.00, 1),
    (4, N'Auditoría de Ciberseguridad & DevOps', N'Implementación de pipelines CI/CD seguros, análisis de vulnerabilidades y hardening.', '2026-09-01', '2026-10-15', N'Finalizado', 3900000.00, 1);
    SET IDENTITY_INSERT [dbo].[Proyecto] OFF;
END
"@
Exec-Sql $proyectosSql

Write-Host "4. Insertando avances tecnicos realistas..."
$avancesSql = @"
-- Limpiar o actualizar avances
DELETE FROM [dbo].[Observaciones];
DELETE FROM [dbo].[Avance];

SET IDENTITY_INSERT [dbo].[Avance] ON;
INSERT INTO [dbo].[Avance] ([Id], [IdProyecto], [Evidencia], [FechaEntrega]) VALUES
(1, 1, N'Configuración de la VPC, subredes públicas y privadas, gateways de enlace y tablas de ruteo completadas en AWS us-east-1.', '2026-08-15'),
(2, 1, N'Despliegue de clúster Amazon EKS con Kubernetes 1.30, ingress controller NGINX y certificados TLS configurados.', '2026-09-01'),
(3, 2, N'Diseño e implementación de arquitectura de autenticación segura con JWT, roles jerárquicos y cifrado de contraseñas.', '2026-08-28'),
(4, 2, N'Construcción de módulos de catálogo corporativo, carro de compras y panel de gestión de pedidos en tiempo real.', '2026-09-08'),
(5, 3, N'Estructura inicial en Flutter con integración de mapas nativos y servicios en segundo plano para geolocalización.', '2026-09-10');
SET IDENTITY_INSERT [dbo].[Avance] OFF;
"@
Exec-Sql $avancesSql
Write-Host "Avances insertados con exito."

Write-Host "5. Insertando observaciones tecnicas..."
$obsSql = @"
SET IDENTITY_INSERT [dbo].[Observaciones] ON;
INSERT INTO [dbo].[Observaciones] ([Id], [IdAvance], [IdUsuario], [Descripcion]) VALUES
(1, 1, 1, N'Excelente estructuración de red. Asegurar que los Security Groups solo expongan los puertos estrictamente necesarios.'),
(2, 2, 1, N'Clúster validado correctamente. Se autoriza continuar con el pipeline de despliegue continuo de microservicios.'),
(3, 3, 2, N'Probamos las credenciales en el entorno de pruebas y la autenticación respondió de manera fluida y rápida.'),
(4, 4, 1, N'Revisar las validaciones en el formulario de pedidos al momento de calcular impuestos sobre la orden.');
SET IDENTITY_INSERT [dbo].[Observaciones] OFF;
"@
Exec-Sql $obsSql
Write-Host "Observaciones insertadas con exito."

Write-Host "6. Insertando notificaciones e historial de pagos..."
$notifSql = @"
IF NOT EXISTS (SELECT 1 FROM [dbo].[Notificaciones])
BEGIN
    SET IDENTITY_INSERT [dbo].[Notificaciones] ON;
    INSERT INTO [dbo].[Notificaciones] ([Id], [IdProyecto], [IdCliente], [Titulo], [Mensaje], [FechaEnvio], [Canal]) VALUES
    (1, 1, 2, N'Nuevo avance publicado', N'Se ha registrado un nuevo entregable técnico en el proyecto Cloud Infrastructure Migration.', '2026-09-01', N'Correo'),
    (2, 2, 2, N'Revisión requerida', N'El módulo de pedidos corporativos está listo para su homologación en el portal.', '2026-09-08', N'Portal');
    SET IDENTITY_INSERT [dbo].[Notificaciones] OFF;
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Historial])
BEGIN
    SET IDENTITY_INSERT [dbo].[Historial] ON;
    INSERT INTO [dbo].[Historial] ([Id], [IdSuscripcion], [IdMetodoPago], [Valor], [FechaPago], [Estado]) VALUES
    (1, 1, 1, 4500000.00, '2026-08-01', N'Completado'),
    (2, 1, 2, 6800000.00, '2026-08-15', N'Completado');
    SET IDENTITY_INSERT [dbo].[Historial] OFF;
END
"@
Exec-Sql $notifSql
Write-Host "Notificaciones e Historial listos."

$conn.Close()
Write-Host "Migracion de base de datos finalizada satisfactoriamente."
