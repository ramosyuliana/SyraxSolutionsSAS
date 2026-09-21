<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.Registro" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Solutions - Registro Empresarial</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@300;400;500;600;700&amp;family=Sora:wght@400;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#006591",
                        "primary-hover": "#004f72",
                        "primary-container": "#0ea5e9",
                        secondary: "#006877",
                        accent: "#0284c7",
                        surface: "#f7f9fb",
                        "on-surface": "#0f172a",
                        "on-surface-variant": "#475569",
                        "border-subtle": "#e2e8f0",
                        error: "#ba1a1a",
                        "error-container": "#ffdad6",
                        "on-error-container": "#93000a"
                    },
                    fontFamily: {
                        sans: ["Hanken Grotesk", "sans-serif"],
                        display: ["Sora", "sans-serif"]
                    },
                    boxShadow: {
                        card: "0 10px 30px -5px rgba(15, 23, 42, 0.06), 0 4px 6px -2px rgba(15, 23, 42, 0.02)"
                    }
                }
            }
        };
    </script>
    <style>
        .hero-pattern {
            background-color: #f8fafc;
            background-image: radial-gradient(#0284c7 0.8px, transparent 0.8px);
            background-size: 28px 28px;
            opacity: 0.35;
        }
    </style>
</head>
<body class="bg-surface text-on-surface font-sans antialiased min-h-screen py-10 px-4 flex items-center justify-center relative selection:bg-primary-container/20 selection:text-primary">

    <!-- Background Decor -->
    <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>
    <div class="absolute top-1/4 left-1/2 -translate-x-1/2 w-[600px] h-[350px] bg-sky-200/30 rounded-full blur-3xl pointer-events-none z-0"></div>

    <main class="max-w-3xl w-full mx-auto relative z-10">
        
        <!-- Back Link -->
        <div class="mb-4">
            <a href="Login.aspx" class="inline-flex items-center gap-1.5 text-xs font-semibold text-slate-500 hover:text-primary transition-colors">
                <span class="material-symbols-outlined text-[18px]">arrow_back</span>
                <span>¿Ya tienes cuenta? Iniciar Sesión</span>
            </a>
        </div>

        <div class="bg-white rounded-3xl shadow-card border border-border-subtle overflow-hidden">
            
            <!-- Encabezado Corporativo -->
            <div class="pt-8 pb-6 px-6 sm:px-10 flex flex-col items-center text-center border-b border-slate-100">
                <a href="../../index.aspx" class="inline-block transition-transform hover:scale-105 mb-3">
                    <div class="w-12 h-12 rounded-2xl bg-gradient-to-tr from-primary to-accent flex items-center justify-center text-white font-display font-bold text-2xl shadow-md">
                        S
                    </div>
                </a>
                <div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-sky-50 text-primary border border-sky-200/50 mb-2">
                    <span class="material-symbols-outlined text-[15px]">badge</span>
                    <span>Registro Empresarial</span>
                    <span class="text-slate-300">•</span>
                    <span class="font-normal text-slate-500">Activación Inmediata</span>
                </div>
                <h1 class="font-display text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight">
                    Crear Cuenta Corporativa
                </h1>
                <p class="text-xs sm:text-sm text-slate-500 mt-1.5 max-w-xl font-normal leading-relaxed">
                    Registra los datos del representante y la información de la empresa para habilitar el portal de gestión y proyectos en Syrax Solutions.
                </p>
            </div>

            <!-- Formulario de Registro -->
            <form id="form1" runat="server" class="p-6 sm:p-10 space-y-8">
                
                <!-- Panel de Alerta -->
                <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="p-4 rounded-xl flex items-center gap-3 text-xs bg-error-container text-on-error-container border border-error/20">
                    <span class="material-symbols-outlined text-error text-[20px]">error</span>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="font-medium" />
                </asp:Panel>

                <!-- SECCIÓN 1: DATOS DEL REPRESENTANTE O CLIENTE -->
                <div class="space-y-5">
                    <div class="flex items-center justify-between pb-3 border-b border-slate-100">
                        <div class="flex items-center gap-2.5">
                            <div class="w-7 h-7 rounded-xl bg-primary text-white font-display font-bold text-xs flex items-center justify-center shadow-sm">
                                1
                            </div>
                            <h2 class="font-display text-sm font-bold text-slate-900 tracking-wide uppercase">
                                Datos del Contacto / Representante
                            </h2>
                        </div>
                        <span class="text-[11px] text-slate-400"><span class="text-error">*</span> Campos obligatorios</span>
                    </div>

                    <!-- Row 1: Tipo & Número de Documento -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="ddlTipoDocumento">
                                Tipo de Documento <span class="text-error">*</span>
                            </label>
                            <asp:DropDownList ID="ddlTipoDocumento" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtNumeroDocumento">
                                Número de Documento <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtNumeroDocumento" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: 1020345678" required="required" />
                        </div>
                    </div>

                    <!-- Row 2: Nombres y Apellidos -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtNombres">
                                Nombres <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtNombres" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: Carlos Eduardo" required="required" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtApellidos">
                                Apellidos <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtApellidos" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: Mendoza Gómez" required="required" />
                        </div>
                    </div>

                    <!-- Row 3: Correo & Teléfono -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtCorreo">
                                Correo Corporativo <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="contacto@empresa.com" required="required" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtTelefono">
                                Teléfono / Celular <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtTelefono" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="+57 310 000 0000" required="required" />
                        </div>
                    </div>

                    <!-- Row 4: Contraseña de Acceso -->
                    <div>
                        <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtClave">
                            Contraseña de Acceso al Portal <span class="text-error">*</span>
                        </label>
                        <asp:TextBox ID="txtClave" runat="server" TextMode="Password" 
                            CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                            placeholder="Mínimo 6 caracteres" required="required" />
                    </div>
                </div>

                <!-- SECCIÓN 2: DATOS DE LA EMPRESA -->
                <div class="space-y-5 pt-2">
                    <div class="flex items-center justify-between pb-3 border-b border-slate-100">
                        <div class="flex items-center gap-2.5">
                            <div class="w-7 h-7 rounded-xl bg-secondary text-white font-display font-bold text-xs flex items-center justify-center shadow-sm">
                                2
                            </div>
                            <h2 class="font-display text-sm font-bold text-slate-900 tracking-wide uppercase">
                                Información de la Empresa
                            </h2>
                        </div>
                    </div>

                    <!-- Row 1: Razón Social y NIT -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtNombreEmpresa">
                                Razón Social / Nombre Comercial <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtNombreEmpresa" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: Soluciones Logísticas S.A.S." required="required" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtNitEmpresa">
                                NIT / Identificación Tributaria <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtNitEmpresa" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: 901.456.789-0" required="required" />
                        </div>
                    </div>

                    <!-- Row 2: Dirección y Teléfono Corporativo -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtDireccionEmpresa">
                                Dirección de la Sede Principal
                            </label>
                            <asp:TextBox ID="txtDireccionEmpresa" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: Carrera 7 # 71-52 Torre B, Bogotá" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtTelefonoEmpresa">
                                Teléfono Corporativo
                            </label>
                            <asp:TextBox ID="txtTelefonoEmpresa" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="Ej: +57 601 345 6789" />
                        </div>
                    </div>

                    <!-- Descripción / Sector -->
                    <div>
                        <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtDescripcionEmpresa">
                            Sector o Actividad Económica
                        </label>
                        <asp:TextBox ID="txtDescripcionEmpresa" runat="server" 
                            CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                            placeholder="Ej: Distribución mayorista, retail, salud, tecnología..." />
                    </div>
                </div>

                <!-- Botón de Envío y Enlaces -->
                <div class="pt-6 border-t border-slate-100 flex flex-col items-center gap-3">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Crear Cuenta y Acceder" OnClick="btnRegistrar_Click" 
                        CssClass="w-full sm:w-auto px-10 py-3.5 bg-primary hover:bg-primary-hover text-white font-semibold text-sm rounded-xl shadow-md shadow-primary/25 hover:shadow-lg active:scale-95 transition-all cursor-pointer" />
                    
                    <p class="text-xs text-slate-500 text-center mt-2">
                        ¿Ya tienes una cuenta corporativa registrada? 
                        <a href="Login.aspx" class="font-bold text-primary hover:underline">Inicia sesión aquí</a>
                    </p>
                </div>

            </form>
        </div>
    </main>

</body>
</html>
