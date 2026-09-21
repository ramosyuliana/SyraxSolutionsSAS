<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Soporte.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Cliente.Soporte" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Cliente - Centro de Soporte &amp; Atención</title>
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
                        "error-container": "#ffdad6"
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
</head>
<body class="bg-surface text-on-surface font-sans antialiased min-h-screen">
    <form id="form1" runat="server">
        
        <!-- Top App Bar -->
        <header class="bg-white/85 backdrop-blur-md border-b border-border-subtle sticky top-0 z-50 flex justify-between items-center w-full px-4 md:px-8 h-16 ml-0 md:ml-64 md:w-[calc(100%-16rem)] transition-all">
            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleSidebar()" class="md:hidden p-2 text-slate-500 hover:bg-slate-100 rounded-xl">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <div class="flex items-center gap-2">
                    <span class="font-display text-base md:text-lg font-bold text-slate-900 tracking-tight">Centro de Soporte Técnico</span>
                    <span class="hidden sm:inline-block text-[11px] font-semibold bg-emerald-50 text-emerald-700 px-2.5 py-0.5 rounded-full border border-emerald-200">Mesa Activa</span>
                </div>
            </div>
            
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 rounded-xl bg-gradient-to-tr from-primary to-accent text-white flex items-center justify-center font-display font-bold text-sm shadow-sm">
                    <asp:Literal ID="litInicial" runat="server">C</asp:Literal>
                </div>
                <div class="hidden sm:block text-left">
                    <p class="text-xs font-bold text-slate-800 leading-tight">
                        <asp:Literal ID="litNombreCliente" runat="server">Cliente</asp:Literal>
                    </p>
                    <p class="text-[11px] text-slate-500 font-medium">
                        <asp:Literal ID="litEmpresaCliente" runat="server">Acme Corp</asp:Literal>
                    </p>
                </div>
            </div>
        </header>

        <div class="flex">
            <!-- Sidebar -->
            <nav id="sidebar" class="bg-white border-r border-border-subtle h-screen w-64 fixed left-0 top-0 overflow-y-auto flex flex-col py-6 gap-1 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
                <div class="px-6 mb-6 flex items-center justify-between">
                    <a href="../../index.aspx" class="flex items-center gap-3 group">
                        <div class="w-10 h-10 rounded-xl bg-gradient-to-tr from-primary to-accent flex items-center justify-center text-white font-display font-bold text-xl shadow-md group-hover:scale-105 transition-transform">
                            S
                        </div>
                        <div>
                            <div class="font-display text-base font-bold text-slate-900">Syrax Portal</div>
                            <div class="text-[10px] uppercase tracking-wider font-semibold text-slate-400">Cliente Corporativo</div>
                        </div>
                    </a>
                    <button type="button" onclick="toggleSidebar()" class="md:hidden text-slate-400 p-1 rounded-lg hover:bg-slate-100">
                        <span class="material-symbols-outlined text-lg">close</span>
                    </button>
                </div>

                <div class="flex-1 px-3 flex flex-col gap-1.5">
                    <a class="text-slate-600 hover:text-primary hover:bg-sky-50/50 rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-medium transition-colors" href="Dashboard.aspx">
                        <span class="material-symbols-outlined text-[20px]">dashboard</span>
                        <span>Mi Portal</span>
                    </a>
                    <a class="text-slate-600 hover:text-primary hover:bg-sky-50/50 rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-medium transition-colors" href="MisProyectos.aspx">
                        <span class="material-symbols-outlined text-[20px]">account_tree</span>
                        <span>Mis Proyectos</span>
                    </a>
                    <a class="text-slate-600 hover:text-primary hover:bg-sky-50/50 rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-medium transition-colors" href="NuevaSolicitud.aspx">
                        <span class="material-symbols-outlined text-[20px]">add_circle</span>
                        <span>Nueva Solicitud</span>
                    </a>
                    <a class="bg-primary text-white rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-semibold shadow-md shadow-primary/25 transition-all" href="Soporte.aspx">
                        <span class="material-symbols-outlined text-[20px]">support_agent</span>
                        <span>Soporte Técnico</span>
                    </a>
                </div>

                <div class="mt-auto px-3 pt-4 border-t border-slate-100">
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" 
                        CssClass="w-full text-rose-600 hover:bg-rose-50 rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-semibold transition-colors">
                        <span class="material-symbols-outlined text-[20px]">logout</span>
                        <span>Cerrar Sesión</span>
                    </asp:LinkButton>
                </div>
            </nav>
            
            <div id="sidebarOverlay" onclick="toggleSidebar()" class="fixed inset-0 bg-slate-900/40 z-40 hidden md:hidden backdrop-blur-sm"></div>

            <!-- Main Content -->
            <main class="flex-1 md:ml-64 p-6 md:p-10 min-h-[calc(100vh-64px)] space-y-8">
                
                <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="p-4 rounded-2xl flex items-center gap-3 text-xs bg-emerald-50 text-emerald-800 border border-emerald-200">
                    <span class="material-symbols-outlined text-emerald-600 text-[20px]">check_circle</span>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="font-medium" />
                </asp:Panel>

                <div>
                    <h2 class="font-display text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight">Atención al Cliente &amp; Soporte</h2>
                    <p class="text-xs sm:text-sm text-slate-500 mt-1">Radica tus dudas, incidencias técnicas o solicitudes de ajuste con prioridad empresarial.</p>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 items-start">
                    
                    <!-- Formulario de Ticket -->
                    <div class="lg:col-span-2 bg-white rounded-3xl p-6 sm:p-8 shadow-card border border-border-subtle space-y-5">
                        <div>
                            <h3 class="font-display text-lg font-bold text-slate-900">Crear Ticket de Soporte</h3>
                            <p class="text-xs text-slate-500">Un ingeniero del equipo asignado responderá tu requerimiento.</p>
                        </div>

                        <div class="space-y-4">
                            <div>
                                <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtAsunto">
                                    Asunto o Título del Ticket <span class="text-rose-500">*</span>
                                </label>
                                <asp:TextBox ID="txtAsunto" runat="server" 
                                    CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition" 
                                    placeholder="Ej: Inquietud con credenciales de staging o certificado SSL" />
                            </div>

                            <div>
                                <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtDetalle">
                                    Detalle de la Incidencia o Consulta <span class="text-rose-500">*</span>
                                </label>
                                <asp:TextBox ID="txtDetalle" runat="server" TextMode="MultiLine" Rows="5" 
                                    CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition resize-y leading-relaxed" 
                                    placeholder="Describe el comportamiento observado, pasos para reproducir o la solicitud técnica detallada..." />
                            </div>

                            <div class="flex justify-end pt-2">
                                <asp:Button ID="btnEnviarTicket" runat="server" Text="Enviar Ticket a Soporte" OnClick="btnEnviarTicket_Click" 
                                    CssClass="bg-primary hover:bg-primary-hover text-white font-semibold text-sm px-7 py-3 rounded-xl shadow-md shadow-primary/25 hover:shadow-lg active:scale-95 transition-all cursor-pointer" />
                            </div>
                        </div>
                    </div>

                    <!-- Canales de Atención -->
                    <div class="bg-white rounded-3xl p-6 sm:p-8 shadow-card border border-border-subtle space-y-6">
                        <div>
                            <h3 class="font-display text-lg font-bold text-slate-900">Canales Directos</h3>
                            <p class="text-xs text-slate-500">Horario de guardia técnica preferencial.</p>
                        </div>

                        <div class="space-y-4">
                            <div class="flex items-start gap-3.5 p-3.5 bg-slate-50 rounded-2xl border border-slate-100">
                                <span class="material-symbols-outlined text-primary text-[22px]">mail</span>
                                <div>
                                    <p class="text-xs font-bold text-slate-800">Correo Electrónico</p>
                                    <p class="text-xs text-slate-500">soporte@syraxsolutions.com</p>
                                </div>
                            </div>

                            <div class="flex items-start gap-3.5 p-3.5 bg-slate-50 rounded-2xl border border-slate-100">
                                <span class="material-symbols-outlined text-secondary text-[22px]">call</span>
                                <div>
                                    <p class="text-xs font-bold text-slate-800">Línea Telefónica Directa</p>
                                    <p class="text-xs text-slate-500">+57 300 123 4567</p>
                                </div>
                            </div>

                            <div class="flex items-start gap-3.5 p-3.5 bg-slate-50 rounded-2xl border border-slate-100">
                                <span class="material-symbols-outlined text-primary text-[22px]">schedule</span>
                                <div>
                                    <p class="text-xs font-bold text-slate-800">Horario Preferencial</p>
                                    <p class="text-xs text-slate-500">Lunes a Viernes: 8:00 AM - 6:00 PM</p>
                                    <p class="text-[11px] text-emerald-600 font-semibold mt-0.5">Guardia Cloud 24/7</p>
                                </div>
                            </div>
                        </div>

                        <div class="pt-4 border-t border-slate-100 text-center">
                            <span class="inline-flex items-center gap-1.5 text-xs text-slate-600 font-medium">
                                <span class="w-2 h-2 rounded-full bg-emerald-500"></span> SLA de Respuesta: &lt; 2 horas
                            </span>
                        </div>
                    </div>

                </div>

            </main>
        </div>

    </form>

    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('sidebar');
            var overlay = document.getElementById('sidebarOverlay');
            if (sidebar.classList.contains('-translate-x-full')) {
                sidebar.classList.remove('-translate-x-full');
                overlay.classList.remove('hidden');
            } else {
                sidebar.classList.add('-translate-x-full');
                overlay.classList.add('hidden');
            }
        }
    </script>
</body>
</html>
