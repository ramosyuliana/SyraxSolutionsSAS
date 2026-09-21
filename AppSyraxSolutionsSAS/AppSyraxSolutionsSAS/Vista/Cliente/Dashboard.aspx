<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Cliente.Dashboard" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Cliente - Mi Portal</title>
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
                    <span class="font-display text-base md:text-lg font-bold text-slate-900 tracking-tight">Portal del Cliente</span>
                    <span class="hidden sm:inline-block text-[11px] font-semibold bg-sky-50 text-primary px-2.5 py-0.5 rounded-full border border-sky-200/60">Espacio Seguro</span>
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
                    <a class="bg-primary text-white rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-semibold shadow-md shadow-primary/25 transition-all" href="Dashboard.aspx">
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
                    <a class="text-slate-600 hover:text-primary hover:bg-sky-50/50 rounded-xl flex items-center gap-3 px-4 py-2.5 text-sm font-medium transition-colors" href="Soporte.aspx">
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
                
                <!-- Welcome Banner -->
                <div class="bg-gradient-to-r from-slate-900 via-primary to-slate-900 text-white rounded-3xl p-6 sm:p-8 shadow-card flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6 relative overflow-hidden">
                    <div class="space-y-1 relative z-10">
                        <span class="text-xs font-semibold text-sky-300 uppercase tracking-wider">Espacio Privado de Gestión</span>
                        <h2 class="font-display text-2xl sm:text-3xl font-bold">
                            Hola, <asp:Literal ID="litPrimerNombre" runat="server">Cliente</asp:Literal> 👋
                        </h2>
                        <p class="text-xs sm:text-sm text-slate-300 max-w-xl">
                            Revisa el estado de tus entregables en vivo, fechas de sprints y radica nuevos requerimientos con nuestro equipo de ingeniería.
                        </p>
                    </div>
                    <div class="relative z-10">
                        <a href="NuevaSolicitud.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-sky-400 to-primary hover:opacity-95 text-white font-semibold text-xs sm:text-sm px-6 py-3 rounded-full shadow-lg shadow-sky-500/25 transition-all shrink-0">
                            <span class="material-symbols-outlined text-[18px]">add</span>
                            <span>Crear Solicitud</span>
                        </a>
                    </div>
                </div>

                <!-- Quick Action Bento Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <a href="NuevaSolicitud.aspx" class="bg-white rounded-3xl p-6 sm:p-7 border border-border-subtle shadow-card hover:-translate-y-1 hover:shadow-lg transition-all flex flex-col justify-between group">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-12 h-12 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                                <span class="material-symbols-outlined text-2xl">add_task</span>
                            </div>
                            <span class="material-symbols-outlined text-slate-400 group-hover:text-primary group-hover:translate-x-1 transition-all">arrow_forward</span>
                        </div>
                        <div>
                            <h3 class="font-display text-lg font-bold text-slate-900 mb-1">Nueva Solicitud de Servicio</h3>
                            <p class="text-xs text-slate-500 leading-relaxed">Radica requerimientos de desarrollo, APIs, clústeres cloud o mejoras técnicas para tu empresa.</p>
                        </div>
                    </a>

                    <a href="Soporte.aspx" class="bg-white rounded-3xl p-6 sm:p-7 border border-border-subtle shadow-card hover:-translate-y-1 hover:shadow-lg transition-all flex flex-col justify-between group">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-12 h-12 rounded-2xl bg-sky-50 text-secondary flex items-center justify-center group-hover:bg-secondary group-hover:text-white transition-colors">
                                <span class="material-symbols-outlined text-2xl">support_agent</span>
                            </div>
                            <span class="material-symbols-outlined text-slate-400 group-hover:text-secondary group-hover:translate-x-1 transition-all">arrow_forward</span>
                        </div>
                        <div>
                            <h3 class="font-display text-lg font-bold text-slate-900 mb-1">Mesa de Soporte &amp; Ayuda</h3>
                            <p class="text-xs text-slate-500 leading-relaxed">Reporta incidencias, consulta el estado de servidores o contacta a tu arquitecto asignado.</p>
                        </div>
                    </a>
                </div>

                <!-- Proyectos del Cliente -->
                <div class="bg-white rounded-3xl p-6 sm:p-8 shadow-card border border-border-subtle space-y-6">
                    <div class="flex items-center justify-between pb-4 border-b border-slate-100">
                        <div>
                            <h3 class="font-display text-lg font-bold text-slate-900">Mis Proyectos &amp; Soluciones</h3>
                            <p class="text-xs text-slate-500">Trazabilidad de desarrollo y entregas en tiempo real.</p>
                        </div>
                        <a href="MisProyectos.aspx" class="text-xs font-bold text-primary hover:underline flex items-center gap-1">
                            <span>Ver todos</span>
                            <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                        </a>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <asp:Repeater ID="rptMisProyectos" runat="server">
                            <ItemTemplate>
                                <div class="bg-slate-50 rounded-2xl p-5 border border-slate-200/80 flex flex-col justify-between hover:bg-white hover:shadow-md transition-all">
                                    <div class="space-y-3 mb-4">
                                        <div class="flex justify-between items-start gap-2">
                                            <h4 class="font-display font-bold text-sm text-slate-900"><%# Eval("Titulo") %></h4>
                                            <span class="text-[11px] font-semibold px-2.5 py-0.5 rounded-full whitespace-nowrap 
                                                <%# Eval("Estado").ToString() == "Finalizado" ? "bg-emerald-50 text-emerald-700 border border-emerald-200" :
                                                    Eval("Estado").ToString() == "En Desarrollo" ? "bg-sky-50 text-sky-700 border border-sky-200" :
                                                    Eval("Estado").ToString() == "En Revisión" ? "bg-indigo-50 text-indigo-700 border border-indigo-200" :
                                                    "bg-amber-50 text-amber-700 border border-amber-200" %>">
                                                <%# Eval("Estado") %>
                                            </span>
                                        </div>
                                        <p class="text-xs text-slate-600 leading-relaxed line-clamp-2"><%# Eval("Descripcion") %></p>
                                    </div>
                                    <div class="pt-3 border-t border-slate-200/60 space-y-1.5">
                                        <div class="flex justify-between text-xs font-semibold">
                                            <span class="text-slate-500">Avance General</span>
                                            <span class="text-primary"><%# Eval("PorcentajeAvance") %>%</span>
                                        </div>
                                        <div class="w-full bg-slate-200 rounded-full h-2 overflow-hidden">
                                            <div class="bg-gradient-to-r from-primary to-accent h-2 rounded-full transition-all duration-500" style="width: <%# Eval("PorcentajeAvance") %>%"></div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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
