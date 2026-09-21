USE [dbSyraxSolutionsSASLTDA];
GO

-- 1. Insertar Roles
IF NOT EXISTS (SELECT 1 FROM [dbo].[Rol])
BEGIN
    SET IDENTITY_INSERT [dbo].[Rol] ON;
    INSERT INTO [dbo].[Rol] ([Id], [Nombre]) VALUES
    (1, N'Administrador'),
    (2, N'Cliente'),
    (3, N'Desarrollador');
    SET IDENTITY_INSERT [dbo].[Rol] OFF;
    PRINT 'Roles insertados correctamente.';
END
ELSE
BEGIN
    UPDATE [dbo].[Rol] SET [Nombre] = N'Administrador' WHERE [Id] = 1;
    UPDATE [dbo].[Rol] SET [Nombre] = N'Cliente' WHERE [Id] = 2;
    UPDATE [dbo].[Rol] SET [Nombre] = N'Desarrollador' WHERE [Id] = 3;
    PRINT 'Roles actualizados.';
END
GO

-- 2. Insertar Tipos de Documento
IF NOT EXISTS (SELECT 1 FROM [dbo].[TipoDocumento])
BEGIN
    SET IDENTITY_INSERT [dbo].[TipoDocumento] ON;
    INSERT INTO [dbo].[TipoDocumento] ([Id], [Nombre]) VALUES
    (1, N'Cédula de Ciudadanía (CC)'),
    (2, N'Cédula de Extranjería (CE)'),
    (3, N'Pasaporte'),
    (4, N'NIT / Registro Mercantil');
    SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF;
    PRINT 'Tipos de Documento insertados correctamente.';
END
ELSE
BEGIN
    UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Ciudadanía (CC)' WHERE [Id] = 1;
    UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Cédula de Extranjería (CE)' WHERE [Id] = 2;
    UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'Pasaporte' WHERE [Id] = 3;
    UPDATE [dbo].[TipoDocumento] SET [Nombre] = N'NIT / Registro Mercantil' WHERE [Id] = 4;
    PRINT 'Tipos de Documento actualizados.';
END
GO

-- 3. Insertar Métodos de Pago
IF NOT EXISTS (SELECT 1 FROM [dbo].[MetodoPago])
BEGIN
    SET IDENTITY_INSERT [dbo].[MetodoPago] ON;
    INSERT INTO [dbo].[MetodoPago] ([Id], [Nombre]) VALUES
    (1, N'Transferencia Bancaria'),
    (2, N'Tarjeta de Crédito'),
    (3, N'PSE'),
    (4, N'Efectivo');
    SET IDENTITY_INSERT [dbo].[MetodoPago] OFF;
    PRINT 'Métodos de Pago insertados correctamente.';
END
GO

-- 4. Insertar Tipos de Plan
IF NOT EXISTS (SELECT 1 FROM [dbo].[TipoPlan])
BEGIN
    SET IDENTITY_INSERT [dbo].[TipoPlan] ON;
    INSERT INTO [dbo].[TipoPlan] ([Id], [Nombre]) VALUES
    (1, N'Desarrollo de Software a la Medida'),
    (2, N'Mantenimiento e Infraestructura'),
    (3, N'Soporte y Consultoría Cloud');
    SET IDENTITY_INSERT [dbo].[TipoPlan] OFF;
    PRINT 'Tipos de Plan insertados correctamente.';
END
GO

-- 5. Insertar Planes
IF NOT EXISTS (SELECT 1 FROM [dbo].[Plan])
BEGIN
    SET IDENTITY_INSERT [dbo].[Plan] ON;
    INSERT INTO [dbo].[Plan] ([Id], [Nombre], [Descripcion], [PrecioEstimado], [DuracionEstimada], [Estado], [IdTipoPlan]) VALUES
    (1, N'Plan Arquitectura Cloud & Modernización', N'Migración integral y arquitectura resiliente en AWS / Azure.', 4500000.00, 90, N'Activo', 3),
    (2, N'Plan Desarrollo Plataforma Web / SaaS', N'Diseño y construcción completa de portal web y servicios backend.', 6800000.00, 120, N'Activo', 1),
    (3, N'Plan Soporte y Mantenimiento Premium 24/7', N'Monitoreo preventivo, resolución de tickets y optimización mensual.', 1500000.00, 30, N'Activo', 2);
    SET IDENTITY_INSERT [dbo].[Plan] OFF;
    PRINT 'Planes insertados correctamente.';
END
GO

-- 6. Insertar Empresas
IF NOT EXISTS (SELECT 1 FROM [dbo].[Empresa])
BEGIN
    SET IDENTITY_INSERT [dbo].[Empresa] ON;
    INSERT INTO [dbo].[Empresa] ([Id], [Nit], [Nombre], [Direccion], [Telefono], [Descripcion]) VALUES
    (1, N'901.884.231-5', N'Syrax Solutions S.A.S.', N'Calle 100 # 15-20 Oficina 501, Bogotá D.C.', N'+57 (601) 300-1234', N'Soluciones tecnológicas empresariales y transformación digital de alto impacto.'),
    (2, N'900.543.876-1', N'Acme Corporation', N'Carrera 7 # 71-52 Torre B, Bogotá D.C.', N'+57 (601) 310-9876', N'Empresa líder en distribución y logística internacional.');
    SET IDENTITY_INSERT [dbo].[Empresa] OFF;
    PRINT 'Empresas insertadas correctamente.';
END
GO

-- 7. Insertar Usuarios Iniciales
IF NOT EXISTS (SELECT 1 FROM [dbo].[Usuario])
BEGIN
    SET IDENTITY_INSERT [dbo].[Usuario] ON;
    INSERT INTO [dbo].[Usuario] ([Id], [NumeroDocumento], [Nombres], [Apellidos], [Correo], [Telefono], [Direccion], [Clave], [IdEmpresa], [IdTipoDocumento], [IdRol]) VALUES
    (1, N'1010203040', N'Admin', N'Syrax', N'admin@syrax.com', N'+57 300 123 4567', N'Calle 100 # 15-20, Bogotá D.C.', N'Admin123*', 1, 1, 1),
    (2, N'1020304050', N'Carlos', N'Mendoza', N'cliente@acme.com', N'+57 310 987 6543', N'Carrera 7 # 71-52, Bogotá D.C.', N'Cliente123*', 2, 1, 2),
    (3, N'1030405060', N'Laura Sofía', N'Vargas', N'dev@syrax.com', N'+57 320 555 7890', N'Calle 26 # 68-10, Bogotá D.C.', N'Dev123*', 1, 1, 3);
    SET IDENTITY_INSERT [dbo].[Usuario] OFF;
    PRINT 'Usuarios iniciales insertados correctamente.';
END
GO

-- 8. Insertar Suscripción y Proyectos
IF NOT EXISTS (SELECT 1 FROM [dbo].[Suscripcion])
BEGIN
    SET IDENTITY_INSERT [dbo].[Suscripcion] ON;
    INSERT INTO [dbo].[Suscripcion] ([Id], [IdUsuario], [IdPlan]) VALUES
    (1, 2, 1);
    SET IDENTITY_INSERT [dbo].[Suscripcion] OFF;
    PRINT 'Suscripción de prueba insertada.';
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Proyecto])
BEGIN
    SET IDENTITY_INSERT [dbo].[Proyecto] ON;
    INSERT INTO [dbo].[Proyecto] ([Id], [Titulo], [Descripcion], [FechaCreacion], [FechaEntrega], [Estado], [Precio], [IdSuscripcion]) VALUES
    (1, N'Cloud Infrastructure Migration', N'Modernización y migración integral de infraestructura on-premise a la nube de AWS.', '2026-08-01', '2026-11-30', N'En Desarrollo', 4500000.00, 1),
    (2, N'Portal Empresarial B2B', N'Desarrollo de plataforma web para autogestión de clientes corporativos y pedidos.', '2026-08-15', '2026-12-15', N'En Revisión', 6800000.00, 1),
    (3, N'App Móvil Corporativa & Logística', N'Aplicación móvil para conductores y supervisores con trazabilidad GPS en tiempo real.', '2026-08-20', '2026-12-20', N'En Desarrollo', 8200000.00, 1),
    (4, N'Auditoría de Ciberseguridad & DevOps', N'Implementación de pipelines CI/CD seguros, análisis de vulnerabilidades y hardening.', '2026-09-01', '2026-10-15', N'Finalizado', 3900000.00, 1);
    SET IDENTITY_INSERT [dbo].[Proyecto] OFF;
    PRINT 'Proyectos de prueba insertados.';
END
GO

-- 9. Insertar Avances Técnicos
IF NOT EXISTS (SELECT 1 FROM [dbo].[Avance])
BEGIN
    SET IDENTITY_INSERT [dbo].[Avance] ON;
    INSERT INTO [dbo].[Avance] ([Id], [IdProyecto], [Evidencia], [FechaEntrega]) VALUES
    (1, 1, N'Configuración de la VPC, subredes públicas y privadas, gateways de enlace y tablas de ruteo completadas en AWS us-east-1.', '2026-08-15'),
    (2, 1, N'Despliegue de clúster Amazon EKS con Kubernetes 1.30, ingress controller NGINX y certificados TLS configurados.', '2026-09-01'),
    (3, 2, N'Diseño e implementación de arquitectura de autenticación segura con JWT, roles jerárquicos y cifrado de contraseñas.', '2026-08-28'),
    (4, 2, N'Construcción de módulos de catálogo corporativo, carro de compras y panel de gestión de pedidos en tiempo real.', '2026-09-08'),
    (5, 3, N'Estructura inicial en Flutter con integración de mapas nativos y servicios en segundo plano para geolocalización.', '2026-09-10');
    SET IDENTITY_INSERT [dbo].[Avance] OFF;
    PRINT 'Avances insertados correctamente.';
END
GO

-- 10. Insertar Observaciones
IF NOT EXISTS (SELECT 1 FROM [dbo].[Observaciones])
BEGIN
    SET IDENTITY_INSERT [dbo].[Observaciones] ON;
    INSERT INTO [dbo].[Observaciones] ([Id], [IdAvance], [IdUsuario], [Descripcion]) VALUES
    (1, 1, 1, N'Excelente estructuración de red. Asegurar que los Security Groups solo expongan los puertos estrictamente necesarios.'),
    (2, 2, 1, N'Clúster validado correctamente. Se autoriza continuar con el pipeline de despliegue continuo de microservicios.'),
    (3, 3, 2, N'Probamos las credenciales en el entorno de pruebas y la autenticación respondió de manera fluida y rápida.'),
    (4, 4, 1, N'Revisar las validaciones en el formulario de pedidos al momento de calcular impuestos sobre la orden.');
    SET IDENTITY_INSERT [dbo].[Observaciones] OFF;
    PRINT 'Observaciones insertadas correctamente.';
END
GO

-- 11. Insertar Empresas y Usuarios Adicionales (Cliente 2 y Desarrollador 2)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Empresa] WHERE [Id] = 3)
BEGIN
    SET IDENTITY_INSERT [dbo].[Empresa] ON;
    INSERT INTO [dbo].[Empresa] ([Id], [Nit], [Nombre], [Direccion], [Telefono], [Descripcion]) VALUES
    (3, N'901.332.110-8', N'FinTech Innovate S.A.S.', N'Calle 72 # 10-34 Piso 8, Bogotá D.C.', N'+57 (601) 450-8899', N'Plataforma de pagos digitales y microcréditos automatizados.');
    SET IDENTITY_INSERT [dbo].[Empresa] OFF;
    PRINT 'Empresa FinTech Innovate insertada.';
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Usuario] WHERE [Id] = 4)
BEGIN
    SET IDENTITY_INSERT [dbo].[Usuario] ON;
    INSERT INTO [dbo].[Usuario] ([Id], [NumeroDocumento], [Nombres], [Apellidos], [Correo], [Telefono], [Direccion], [Clave], [IdEmpresa], [IdTipoDocumento], [IdRol]) VALUES
    (4, N'1040506070', N'Diana Marcela', N'Torres', N'diana@fintechinnovate.co', N'+57 315 444 9911', N'Calle 72 # 10-34, Bogotá D.C.', N'Cliente123*', 3, 1, 2),
    (5, N'1050607080', N'Mateo Andrés', N'Gómez', N'mateo.dev@syrax.com', N'+57 301 777 2233', N'Carrera 15 # 85-40, Bogotá D.C.', N'Dev123*', 1, 1, 3);
    SET IDENTITY_INSERT [dbo].[Usuario] OFF;
    PRINT 'Usuarios adicionales insertados (Cliente Diana y Desarrollador Mateo).';
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[Suscripcion] WHERE [Id] = 2)
BEGIN
    SET IDENTITY_INSERT [dbo].[Suscripcion] ON;
    INSERT INTO [dbo].[Suscripcion] ([Id], [IdUsuario], [IdPlan]) VALUES
    (2, 4, 2);
    SET IDENTITY_INSERT [dbo].[Suscripcion] OFF;
    PRINT 'Suscripción adicional insertada.';
END
GO

-- 12. Insertar Proyectos en Estado Pendiente (Alimentar métricas de solicitudes en Dashboard)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Proyecto] WHERE [Id] = 5)
BEGIN
    SET IDENTITY_INSERT [dbo].[Proyecto] ON;
    INSERT INTO [dbo].[Proyecto] ([Id], [Titulo], [Descripcion], [FechaCreacion], [FechaEntrega], [Estado], [Precio], [IdSuscripcion]) VALUES
    (5, N'Integración Pasarela de Pagos PSE', N'[Prioridad: Alta] Requerimiento para conectar API de procesamiento de pagos y recaudos recurrentes.', '2026-09-18', '2026-11-15', N'Pendiente', 3500000.00, 2),
    (6, N'Módulo de Facturación Electrónica DIAN', N'[Prioridad: Media] Emisión automática de facturas y notas crédito integradas con software contable.', '2026-09-19', '2026-12-10', N'Pendiente', 4200000.00, 1);
    SET IDENTITY_INSERT [dbo].[Proyecto] OFF;
    PRINT 'Proyectos pendientes insertados.';
END
GO

-- 13. Insertar Historial de Pagos / Facturación
IF NOT EXISTS (SELECT 1 FROM [dbo].[Historial] WHERE [Id] = 1)
BEGIN
    SET IDENTITY_INSERT [dbo].[Historial] ON;
    INSERT INTO [dbo].[Historial] ([Id], [IdSuscripcion], [IdMetodoPago], [Valor], [FechaPago], [Estado]) VALUES
    (1, 1, 1, 4500000.00, '2026-08-02', N'Aprobado'),
    (2, 1, 2, 6800000.00, '2026-08-16', N'Aprobado');
    SET IDENTITY_INSERT [dbo].[Historial] OFF;
    PRINT 'Historial base insertado.';
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Historial] WHERE [Id] = 3)
BEGIN
    SET IDENTITY_INSERT [dbo].[Historial] ON;
    INSERT INTO [dbo].[Historial] ([Id], [IdSuscripcion], [IdMetodoPago], [Valor], [FechaPago], [Estado]) VALUES
    (3, 2, 3, 3500000.00, '2026-09-18', N'Pendiente');
    SET IDENTITY_INSERT [dbo].[Historial] OFF;
    PRINT 'Historial adicional de pagos insertado.';
END
GO

-- 14. Insertar Notificaciones de Sistema
IF NOT EXISTS (SELECT 1 FROM [dbo].[Notificaciones] WHERE [Id] = 1)
BEGIN
    SET IDENTITY_INSERT [dbo].[Notificaciones] ON;
    INSERT INTO [dbo].[Notificaciones] ([Id], [IdProyecto], [IdCliente], [Titulo], [Mensaje], [FechaEnvio], [Canal]) VALUES
    (1, 1, 2, N'Nuevo Avance Publicado', N'Se ha registrado el despliegue del clúster Amazon EKS en su proyecto de infraestructura.', '2026-09-01', N'Email / Plataforma'),
    (2, 2, 2, N'Proyecto en Revisión', N'El Portal Empresarial B2B ha completado la fase de pruebas y se encuentra listo para su validación.', '2026-09-10', N'Plataforma');
    SET IDENTITY_INSERT [dbo].[Notificaciones] OFF;
    PRINT 'Notificaciones base insertadas.';
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Notificaciones] WHERE [Id] = 3)
BEGIN
    SET IDENTITY_INSERT [dbo].[Notificaciones] ON;
    INSERT INTO [dbo].[Notificaciones] ([Id], [IdProyecto], [IdCliente], [Titulo], [Mensaje], [FechaEnvio], [Canal]) VALUES
    (3, 5, 4, N'Solicitud Recibida', N'Su requerimiento de Integración Pasarela PSE fue radicado con éxito y está en revisión técnica.', '2026-09-18', N'Email');
    SET IDENTITY_INSERT [dbo].[Notificaciones] OFF;
    PRINT 'Notificación para cliente 2 insertada.';
END
GO

-- 15. Resincronizar Contadores Identity para evitar conflictos de claves primarias en formularios
DBCC CHECKIDENT ('[dbo].[Rol]', RESEED);
DBCC CHECKIDENT ('[dbo].[TipoDocumento]', RESEED);
DBCC CHECKIDENT ('[dbo].[MetodoPago]', RESEED);
DBCC CHECKIDENT ('[dbo].[TipoPlan]', RESEED);
DBCC CHECKIDENT ('[dbo].[Plan]', RESEED);
DBCC CHECKIDENT ('[dbo].[Empresa]', RESEED);
DBCC CHECKIDENT ('[dbo].[Usuario]', RESEED);
DBCC CHECKIDENT ('[dbo].[Suscripcion]', RESEED);
DBCC CHECKIDENT ('[dbo].[Proyecto]', RESEED);
DBCC CHECKIDENT ('[dbo].[Avance]', RESEED);
DBCC CHECKIDENT ('[dbo].[Observaciones]', RESEED);
DBCC CHECKIDENT ('[dbo].[Historial]', RESEED);
DBCC CHECKIDENT ('[dbo].[Notificaciones]', RESEED);
PRINT 'Identidades reindexadas correctamente.';
GO

