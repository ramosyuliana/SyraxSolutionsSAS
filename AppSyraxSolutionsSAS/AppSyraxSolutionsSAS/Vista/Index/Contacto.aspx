<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.Contacto" %>

<!DOCTYPE html>
<html class="light scroll-smooth" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Contacto - Syrax Solutions S.A.S.</title>
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
                        "border-subtle": "#e2e8f0"
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
        .glass-panel {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
        }
    </style>
</head>
<body class="bg-surface text-on-surface font-sans antialiased min-h-screen flex flex-col selection:bg-primary-container/20 selection:text-primary">

    <!-- TopNavBar -->
    <header class="fixed top-0 w-full z-50 glass-panel border-b border-border-subtle transition-all duration-300">
        <div class="flex justify-between items-center w-full px-4 sm:px-8 py-3.5 max-w-7xl mx-auto">
            <a href="../../index.aspx" class="flex items-center gap-3 group">
                <div class="w-10 h-10 rounded-xl bg-gradient-to-tr from-primary to-accent flex items-center justify-center text-white font-display font-bold text-xl shadow-md group-hover:scale-105 transition-transform">
                    S
                </div>
                <div class="flex flex-col">
                    <span class="font-display text-lg font-bold text-primary tracking-tight leading-tight">Syrax Solutions</span>
                    <span class="text-[10px] uppercase tracking-widest font-semibold text-slate-500">Tecnología S.A.S.</span>
                </div>
            </a>
            
            <nav class="hidden md:flex items-center gap-8 text-sm font-semibold text-slate-600">
                <a class="hover:text-primary transition-colors" href="../../index.aspx">Inicio</a>
                <a class="hover:text-primary transition-colors" href="servicios.aspx">Servicios</a>
                <a class="hover:text-primary transition-colors" href="Nosotros.aspx">Nosotros</a>
                <a class="hover:text-primary transition-colors" href="Proyectos.aspx">Proyectos</a>
                <a class="text-primary border-b-2 border-primary pb-0.5" href="Contacto.aspx">Contacto</a>
            </nav>

            <div class="flex items-center gap-3">
                <a href="Login.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm px-5 py-2.5 rounded-full hover:shadow-lg hover:shadow-primary/20 active:scale-95 transition-all">
                    <span>Acceso Clientes</span>
                    <span class="material-symbols-outlined text-[18px]">lock</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="flex-1 w-full max-w-7xl mx-auto px-4 sm:px-8 pt-32 pb-20 relative">
        <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>

        <!-- Section Header -->
        <div class="text-center max-w-3xl mx-auto mb-16 space-y-3 relative z-10">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary border border-primary/20">
                <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
                <span>Asesoría Directa sin Intermediarios</span>
            </div>
            <h1 class="font-display text-3xl sm:text-5xl font-extrabold text-slate-900 tracking-tight">
                Ponte en Contacto con Nosotros
            </h1>
            <p class="text-base text-slate-600 font-normal leading-relaxed">
                Estamos listos para transformar la infraestructura y tecnología de tu empresa. Comunícate con nuestros arquitectos y desarrolladores senior en Bogotá.
            </p>
        </div>

        <form id="form1" runat="server" class="relative z-10">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
                
                <!-- Contact Form Card -->
                <div class="lg:col-span-7 bg-white rounded-3xl p-6 sm:p-10 shadow-card border border-border-subtle relative">
                    <h2 class="font-display text-xl font-bold text-slate-900 mb-6">
                        Cuéntanos sobre tu Requerimiento
                    </h2>

                    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6 p-4 rounded-xl flex items-center gap-3 text-xs bg-emerald-50 text-emerald-800 border border-emerald-200">
                        <span class="material-symbols-outlined text-emerald-600 text-[20px]">check_circle</span>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="font-medium" />
                    </asp:Panel>

                    <div class="space-y-5">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtNombre">
                                    Nombre Completo <span class="text-rose-500">*</span>
                                </label>
                                <asp:TextBox ID="txtNombre" runat="server" 
                                    CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                    placeholder="Ej: Carlos Mendoza" required="required" />
                            </div>
                            <div>
                                <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtEmpresa">
                                    Empresa o Razón Social
                                </label>
                                <asp:TextBox ID="txtEmpresa" runat="server" 
                                    CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                    placeholder="Ej: Acme Corp" />
                            </div>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtCorreo">
                                Correo Electrónico Corporativo <span class="text-rose-500">*</span>
                            </label>
                            <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                placeholder="carlos@empresa.com" required="required" />
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtMensaje">
                                Objetivos y Alcance del Proyecto <span class="text-rose-500">*</span>
                            </label>
                            <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="5" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition resize-y leading-relaxed" 
                                placeholder="Describe el alcance esperado: desarrollo web/SaaS, migración a la nube, soporte 24/7 o modernización de software..." required="required" />
                        </div>

                        <div class="pt-2">
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Solicitud de Asesoría" OnClick="btnEnviar_Click"
                                CssClass="w-full sm:w-auto inline-flex items-center justify-center px-8 py-3.5 bg-primary hover:bg-primary-hover text-white font-semibold text-sm rounded-xl shadow-md shadow-primary/25 hover:shadow-lg active:scale-95 transition-all cursor-pointer" />
                        </div>
                    </div>
                </div>

                <!-- Contact Info Column -->
                <div class="lg:col-span-5 space-y-6">
                    
                    <div class="bg-white rounded-3xl p-6 sm:p-8 shadow-card border border-border-subtle space-y-6">
                        <h3 class="font-display text-lg font-bold text-slate-900">Información Directa</h3>
                        
                        <div class="space-y-4">
                            <div class="flex items-start gap-4">
                                <div class="w-11 h-11 rounded-2xl bg-sky-50 text-primary flex items-center justify-center shrink-0">
                                    <span class="material-symbols-outlined text-[22px]">mail</span>
                                </div>
                                <div>
                                    <p class="text-xs font-bold uppercase tracking-wider text-slate-400">Correo Electrónico</p>
                                    <a class="text-sm font-semibold text-slate-800 hover:text-primary transition-colors" href="mailto:contacto@syraxsolutions.com">contacto@syraxsolutions.com</a>
                                    <p class="text-[11px] text-slate-500">Respuesta en menos de 2 horas hábiles</p>
                                </div>
                            </div>

                            <div class="flex items-start gap-4">
                                <div class="w-11 h-11 rounded-2xl bg-sky-50 text-primary flex items-center justify-center shrink-0">
                                    <span class="material-symbols-outlined text-[22px]">call</span>
                                </div>
                                <div>
                                    <p class="text-xs font-bold uppercase tracking-wider text-slate-400">Líneas de Atención (Colombia)</p>
                                    <a class="text-sm font-semibold text-slate-800 hover:text-primary transition-colors" href="tel:+576013001234">+57 (601) 300-1234</a>
                                    <p class="text-[11px] text-slate-500">Móvil / WhatsApp: +57 300 123 4567</p>
                                </div>
                            </div>

                            <div class="flex items-start gap-4">
                                <div class="w-11 h-11 rounded-2xl bg-sky-50 text-primary flex items-center justify-center shrink-0">
                                    <span class="material-symbols-outlined text-[22px]">location_on</span>
                                </div>
                                <div>
                                    <p class="text-xs font-bold uppercase tracking-wider text-slate-400">Sede Principal</p>
                                    <p class="text-sm font-semibold text-slate-800">Calle 100 # 15-20, Oficina 501</p>
                                    <p class="text-[11px] text-slate-500">Chicó Norte, Bogotá D.C., Colombia</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Horarios & SLA Card -->
                    <div class="bg-slate-900 text-white rounded-3xl p-6 sm:p-8 border border-slate-800 shadow-xl space-y-3">
                        <div class="flex items-center gap-2 text-sky-400 text-xs font-bold uppercase tracking-wider">
                            <span class="material-symbols-outlined text-[18px]">schedule</span>
                            <span>Horarios de Atención &amp; Soporte</span>
                        </div>
                        <h4 class="font-display text-base font-bold text-white">Mesa de Operaciones &amp; SLAs</h4>
                        <p class="text-xs text-slate-300 leading-relaxed">
                            Consultoría comercial: Lunes a Viernes de 8:00 a.m. a 6:00 p.m.<br/>
                            <strong class="text-emerald-400">Soporte Técnico Cloud &amp; Infraestructura:</strong> 24 horas al día, 7 días a la semana para clientes con planes activos.
                        </p>
                    </div>

                </div>

            </div>
        </form>
    </main>

    <!-- Footer -->
    <footer class="bg-white border-t border-slate-200 py-10 text-slate-600 font-sans text-xs mt-auto">
        <div class="max-w-7xl mx-auto px-4 sm:px-8 flex flex-col sm:flex-row items-center justify-between gap-4">
            <p>© 2026 Syrax Solutions S.A.S. NIT 901.884.231-5. Todos los derechos reservados.</p>
            <div class="flex items-center gap-6">
                <a href="../../index.aspx" class="hover:text-primary transition-colors">Inicio</a>
                <a href="servicios.aspx" class="hover:text-primary transition-colors">Servicios</a>
                <a href="Nosotros.aspx" class="hover:text-primary transition-colors">Nosotros</a>
                <a href="Login.aspx" class="hover:text-primary font-semibold transition-colors">Portal Clientes</a>
            </div>
        </div>
    </footer>

</body>
</html>