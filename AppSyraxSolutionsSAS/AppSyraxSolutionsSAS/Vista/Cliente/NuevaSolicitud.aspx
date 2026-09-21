<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevaSolicitud.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Cliente.NuevaSolicitud" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Cliente - Crear Nueva Solicitud</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;500;600;700&amp;family=Sora:wght@600;700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#006591",
                        "primary-container": "#0ea5e9",
                        "secondary": "#006877",
                        "background": "#f7f9fb",
                        "on-surface": "#191c1e",
                        "on-surface-variant": "#3e4850",
                        "surface-container-lowest": "#ffffff",
                        "surface-container-low": "#f2f4f6",
                        "surface-container-high": "#e6e8ea",
                        "outline-variant": "#bec8d2",
                        "error": "#ba1a1a",
                        "error-container": "#ffdad6"
                    },
                    fontFamily: {
                        "headline-lg": ["Sora", "sans-serif"],
                        "headline-md": ["Sora", "sans-serif"],
                        "body-lg": ["Hanken Grotesk", "sans-serif"],
                        "body-md": ["Hanken Grotesk", "sans-serif"],
                        "label-md": ["Hanken Grotesk", "sans-serif"]
                    }
                }
            }
        };
    </script>
</head>
<body class="bg-background text-on-surface font-body-md overflow-x-hidden min-h-screen">
    <form id="form1" runat="server">
        
        <header class="bg-surface-container-lowest shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] sticky top-0 z-50 flex justify-between items-center w-full px-4 md:px-8 h-16 ml-0 md:ml-64 md:w-[calc(100%-16rem)]">
            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleSidebar()" class="md:hidden p-2 text-on-surface-variant hover:bg-surface-container-low rounded-full">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <h1 class="font-headline-md text-lg md:text-xl font-bold text-primary tracking-tight">Crear Solicitud de Servicio</h1>
            </div>
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 rounded-full bg-secondary/10 text-secondary flex items-center justify-center font-bold">
                    <asp:Literal ID="litInicial" runat="server">C</asp:Literal>
                </div>
                <div class="hidden sm:block text-left">
                    <p class="font-label-md text-xs font-semibold text-on-surface leading-none">
                        <asp:Literal ID="litNombreCliente" runat="server">Cliente</asp:Literal>
                    </p>
                    <p class="text-[11px] text-on-surface-variant">
                        <asp:Literal ID="litEmpresaCliente" runat="server">Acme Corp</asp:Literal>
                    </p>
                </div>
            </div>
        </header>

        <div class="flex">
            <!-- Sidebar -->
            <nav id="sidebar" class="bg-surface-container-lowest border-r border-outline-variant/30 h-screen w-64 fixed left-0 top-0 overflow-y-auto flex flex-col py-6 gap-1 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
                <div class="px-6 mb-6 flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-secondary rounded-xl flex items-center justify-center text-white font-bold text-xl shadow-sm">
                            S
                        </div>
                        <div>
                            <div class="font-headline-md text-base font-bold text-secondary">Syrax Portal</div>
                            <div class="text-[11px] text-on-surface-variant">Espacio Corporativo</div>
                        </div>
                    </div>
                    <button type="button" onclick="toggleSidebar()" class="md:hidden text-on-surface-variant p-1 rounded-full hover:bg-surface-container-low">
                        <span class="material-symbols-outlined text-lg">close</span>
                    </button>
                </div>

                <div class="flex-1 px-3 flex flex-col gap-1">
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Dashboard.aspx">
                        <span class="material-symbols-outlined text-lg">dashboard</span>
                        Mi Portal
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="MisProyectos.aspx">
                        <span class="material-symbols-outlined text-lg">account_tree</span>
                        Mis Proyectos
                    </a>
                    <a class="bg-secondary text-white rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-all shadow-sm" href="NuevaSolicitud.aspx">
                        <span class="material-symbols-outlined text-lg">add_circle</span>
                        Nueva Solicitud
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Soporte.aspx">
                        <span class="material-symbols-outlined text-lg">support_agent</span>
                        Soporte Técnico
                    </a>
                </div>

                <div class="mt-auto px-3">
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" 
                        CssClass="w-full text-error hover:bg-error-container/40 rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-colors">
                        <span class="material-symbols-outlined text-lg">logout</span>
                        Cerrar Sesión
                    </asp:LinkButton>
                </div>
            </nav>

            <div id="sidebarOverlay" onclick="toggleSidebar()" class="fixed inset-0 bg-black/40 z-40 hidden md:hidden"></div>

            <main class="flex-1 md:ml-64 p-4 md:p-8 min-h-[calc(100vh-64px)] max-w-4xl">
                
                <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6 p-4 rounded-xl flex items-center gap-3 text-sm">
                    <asp:Label ID="lblMensaje" runat="server" />
                </asp:Panel>

                <div class="mb-8">
                    <h2 class="font-headline-lg text-2xl md:text-3xl font-bold text-on-surface">Crear Nueva Solicitud</h2>
                    <p class="text-sm text-on-surface-variant mt-1">Completa los datos del requerimiento para que el equipo de arquitectura y desarrollo comience el análisis.</p>
                </div>

                <!-- Proceso de atención del requerimiento -->
                <div class="mb-6 grid grid-cols-1 sm:grid-cols-3 gap-3">
                    <div class="bg-white p-3.5 rounded-xl border border-slate-200/80 shadow-sm flex items-center gap-3">
                        <div class="w-8 h-8 rounded-lg bg-sky-50 text-primary flex items-center justify-center font-bold text-xs">1</div>
                        <div>
                            <p class="text-xs font-bold text-slate-800 leading-tight">Radicación</p>
                            <p class="text-[11px] text-slate-500">Envío de especificaciones</p>
                        </div>
                    </div>
                    <div class="bg-white p-3.5 rounded-xl border border-slate-200/80 shadow-sm flex items-center gap-3">
                        <div class="w-8 h-8 rounded-lg bg-sky-50 text-primary flex items-center justify-center font-bold text-xs">2</div>
                        <div>
                            <p class="text-xs font-bold text-slate-800 leading-tight">Análisis Técnico</p>
                            <p class="text-[11px] text-slate-500">Revisión por Arquitecto</p>
                        </div>
                    </div>
                    <div class="bg-white p-3.5 rounded-xl border border-slate-200/80 shadow-sm flex items-center gap-3">
                        <div class="w-8 h-8 rounded-lg bg-sky-50 text-primary flex items-center justify-center font-bold text-xs">3</div>
                        <div>
                            <p class="text-xs font-bold text-slate-800 leading-tight">Plan de Sprints</p>
                            <p class="text-[11px] text-slate-500">Cronograma y entregables</p>
                        </div>
                    </div>
                </div>

                <div class="bg-surface-container-lowest rounded-2xl p-6 md:p-8 shadow-[0_15px_35px_0_rgba(15,23,42,0.05)] border border-outline-variant/30 space-y-6">
                    
                    <div>
                        <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-2.5">
                            1. Categoría del Requerimiento <span class="text-error">*</span>
                        </label>
                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
                            <label class="border-2 border-slate-200 hover:border-primary has-[:checked]:border-primary has-[:checked]:bg-sky-50/50 rounded-2xl p-4 flex items-start gap-3 cursor-pointer transition-all duration-200 shadow-sm">
                                <input type="radio" name="rbCategoria" value="Desarrollo Web / SaaS" checked class="mt-1 text-primary focus:ring-primary h-4 w-4" />
                                <div>
                                    <div class="flex items-center gap-1.5 text-sm font-bold text-slate-900">
                                        <span class="material-symbols-outlined text-primary text-[18px]">code_blocks</span>
                                        <span>Web / SaaS</span>
                                    </div>
                                    <p class="text-[11px] text-slate-500 mt-1">Módulos, portales, APIs e integraciones</p>
                                </div>
                            </label>

                            <label class="border-2 border-slate-200 hover:border-primary has-[:checked]:border-primary has-[:checked]:bg-sky-50/50 rounded-2xl p-4 flex items-start gap-3 cursor-pointer transition-all duration-200 shadow-sm">
                                <input type="radio" name="rbCategoria" value="Infraestructura & Cloud" class="mt-1 text-primary focus:ring-primary h-4 w-4" />
                                <div>
                                    <div class="flex items-center gap-1.5 text-sm font-bold text-slate-900">
                                        <span class="material-symbols-outlined text-primary text-[18px]">cloud_sync</span>
                                        <span>Cloud &amp; DevOps</span>
                                    </div>
                                    <p class="text-[11px] text-slate-500 mt-1">AWS, Azure, servidores y clusters</p>
                                </div>
                            </label>

                            <label class="border-2 border-slate-200 hover:border-primary has-[:checked]:border-primary has-[:checked]:bg-sky-50/50 rounded-2xl p-4 flex items-start gap-3 cursor-pointer transition-all duration-200 shadow-sm">
                                <input type="radio" name="rbCategoria" value="Mantenimiento & Soporte" class="mt-1 text-primary focus:ring-primary h-4 w-4" />
                                <div>
                                    <div class="flex items-center gap-1.5 text-sm font-bold text-slate-900">
                                        <span class="material-symbols-outlined text-primary text-[18px]">support_agent</span>
                                        <span>Soporte 24/7</span>
                                    </div>
                                    <p class="text-[11px] text-slate-500 mt-1">Incidencias, parches y optimización</p>
                                </div>
                            </label>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="txtTitulo">
                                Título del Requerimiento <span class="text-error">*</span>
                            </label>
                            <asp:TextBox ID="txtTitulo" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition shadow-sm" 
                                placeholder="Ej: Pasarela de recaudos con PSE y Webhook" />
                            <p class="text-[11px] text-slate-400 mt-1">Sé breve y específico sobre el entregable principal.</p>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider mb-1.5" for="ddlPrioridad">
                                Prioridad del Servicio <span class="text-error">*</span>
                            </label>
                            <asp:DropDownList ID="ddlPrioridad" runat="server" 
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition shadow-sm">
                                <asp:ListItem Text="🟡 Media (Recomendada - Planificada)" Value="Media" />
                                <asp:ListItem Text="🔴 Alta (Urgente - Impacto en producción)" Value="Alta" />
                                <asp:ListItem Text="🟢 Baja (Mejora no crítica)" Value="Baja" />
                            </asp:DropDownList>
                            <p class="text-[11px] text-slate-400 mt-1">Determina el tiempo de asignación técnica de arquitectura.</p>
                        </div>
                    </div>

                    <div>
                        <div class="flex items-center justify-between mb-1.5">
                            <label class="block text-xs font-bold text-slate-700 uppercase tracking-wider" for="txtDescripcion">
                                Descripción Detallada y Objetivos del Proyecto <span class="text-error">*</span>
                            </label>
                            <span class="text-[11px] font-medium text-slate-400">Detalles técnicos</span>
                        </div>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="5" 
                            CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl p-4 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition resize-y shadow-sm leading-relaxed" 
                            placeholder="Describa el alcance técnico esperado, usuarios o sistemas con los que interactúa, reglas de negocio o integraciones con APIs externas..." />
                    </div>

                    <div class="flex flex-col sm:flex-row items-center justify-between gap-4 pt-4 border-t border-slate-200">
                        <div class="flex items-center gap-2 text-xs text-slate-500">
                            <span class="material-symbols-outlined text-primary text-[18px]">verified</span>
                            <span>Radicación directa en el sistema de gestión Syrax</span>
                        </div>
                        <div class="flex items-center gap-3 w-full sm:w-auto justify-end">
                            <a href="MisProyectos.aspx" class="px-5 py-2.5 rounded-full text-sm font-semibold text-slate-600 hover:bg-slate-100 transition">
                                Cancelar
                            </a>
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Requerimiento" OnClick="btnEnviar_Click" 
                                CssClass="bg-primary hover:bg-primary-hover text-white font-semibold text-sm px-7 py-2.5 rounded-full shadow-md shadow-primary/25 hover:shadow-lg active:scale-95 transition-all cursor-pointer" />
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
