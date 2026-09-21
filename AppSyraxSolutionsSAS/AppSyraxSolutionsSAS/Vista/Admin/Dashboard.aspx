<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Admin.Dashboard" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Admin - Dashboard</title>
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
                        "on-primary-container": "#003751",
                        "secondary": "#006877",
                        "secondary-container": "#3fe1fd",
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
        
        <!-- Top App Bar -->
        <header class="bg-surface-container-lowest shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] sticky top-0 z-50 flex justify-between items-center w-full px-4 md:px-8 h-16 ml-0 md:ml-64 md:w-[calc(100%-16rem)]">
            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleSidebar()" class="md:hidden p-2 text-on-surface-variant hover:bg-surface-container-low rounded-full">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <h1 class="font-headline-md text-lg md:text-xl font-bold text-primary tracking-tight">Panel de Administración</h1>
            </div>
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-full bg-primary/10 text-primary flex items-center justify-center font-bold">
                        <asp:Literal ID="litInicial" runat="server">A</asp:Literal>
                    </div>
                    <div class="hidden sm:block text-left">
                        <p class="font-label-md text-xs font-semibold text-on-surface leading-none">
                            <asp:Literal ID="litNombreUsuario" runat="server">Super Administrador</asp:Literal>
                        </p>
                        <p class="text-[11px] text-on-surface-variant">Rol: Administrador</p>
                    </div>
                </div>
            </div>
        </header>

        <div class="flex">
            <!-- Side Navigation Bar -->
            <nav id="sidebar" class="bg-surface-container-lowest border-r border-outline-variant/30 h-screen w-64 fixed left-0 top-0 overflow-y-auto flex flex-col py-6 gap-1 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
                <div class="px-6 mb-6 flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-primary rounded-xl flex items-center justify-center text-white font-bold text-xl shadow-sm">
                            S
                        </div>
                        <div>
                            <div class="font-headline-md text-base font-bold text-primary">Syrax Admin</div>
                            <div class="text-[11px] text-on-surface-variant">Gestión Empresarial</div>
                        </div>
                    </div>
                    <button type="button" onclick="toggleSidebar()" class="md:hidden text-on-surface-variant p-1 rounded-full hover:bg-surface-container-low">
                        <span class="material-symbols-outlined text-lg">close</span>
                    </button>
                </div>

                <div class="flex-1 px-3 flex flex-col gap-1">
                    <a class="bg-primary text-white rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-all shadow-sm" href="Dashboard.aspx">
                        <span class="material-symbols-outlined text-lg">dashboard</span>
                        Dashboard
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Clientes.aspx">
                        <span class="material-symbols-outlined text-lg">group</span>
                        Clientes
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Trabajadores.aspx">
                        <span class="material-symbols-outlined text-lg">badge</span>
                        Colaboradores
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Proyectos.aspx">
                        <span class="material-symbols-outlined text-lg">account_tree</span>
                        Proyectos
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

            <!-- Main Content Area -->
            <main class="flex-1 md:ml-64 p-6 md:p-10 min-h-[calc(100vh-64px)]">
                <!-- Page Header -->
                <div class="mb-8 flex flex-col md:flex-row md:items-end justify-between gap-4">
                    <div>
                        <h2 class="font-headline-lg text-2xl md:text-3xl font-bold text-on-surface">Bienvenido al Centro de Control</h2>
                        <p class="text-sm text-on-surface-variant mt-1">Monitoreo en tiempo real de clientes, desarrollos activos y solicitudes corporativas.</p>
                    </div>
                </div>

                <!-- KPI Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                    <!-- Clientes Activos -->
                    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 flex flex-col justify-between">
                        <div class="flex justify-between items-start mb-4">
                            <div class="p-3 bg-primary/10 rounded-xl text-primary">
                                <span class="material-symbols-outlined">group</span>
                            </div>
                            <span class="text-xs font-semibold text-primary bg-primary/10 px-2.5 py-1 rounded-full">Base Datos</span>
                        </div>
                        <div>
                            <div class="font-headline-lg text-3xl font-bold text-on-surface">
                                <asp:Literal ID="litTotalClientes" runat="server">0</asp:Literal>
                            </div>
                            <div class="text-xs font-medium text-on-surface-variant mt-1">Clientes Registrados</div>
                        </div>
                    </div>

                    <!-- Proyectos Activos -->
                    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 flex flex-col justify-between">
                        <div class="flex justify-between items-start mb-4">
                            <div class="p-3 bg-secondary/10 rounded-xl text-secondary">
                                <span class="material-symbols-outlined">account_tree</span>
                            </div>
                            <span class="text-xs font-semibold text-secondary bg-secondary/10 px-2.5 py-1 rounded-full">En Marcha</span>
                        </div>
                        <div>
                            <div class="font-headline-lg text-3xl font-bold text-on-surface">
                                <asp:Literal ID="litProyectosActivos" runat="server">0</asp:Literal>
                            </div>
                            <div class="text-xs font-medium text-on-surface-variant mt-1">Proyectos Activos</div>
                        </div>
                    </div>

                    <!-- Solicitudes Pendientes -->
                    <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 flex flex-col justify-between">
                        <div class="flex justify-between items-start mb-4">
                            <div class="p-3 bg-error/10 rounded-xl text-error">
                                <span class="material-symbols-outlined">receipt_long</span>
                            </div>
                            <span class="text-xs font-semibold text-error bg-error/10 px-2.5 py-1 rounded-full">Por Revisar</span>
                        </div>
                        <div>
                            <div class="font-headline-lg text-3xl font-bold text-on-surface">
                                <asp:Literal ID="litSolicitudesPendientes" runat="server">0</asp:Literal>
                            </div>
                            <div class="text-xs font-medium text-on-surface-variant mt-1">Solicitudes Pendientes</div>
                        </div>
                    </div>
                </div>

                <!-- Proyectos Recientes en Tabla Bento -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20">
                    <div class="flex justify-between items-center mb-6">
                        <div>
                            <h3 class="font-headline-md text-lg font-bold text-on-surface">Proyectos en Curso</h3>
                            <p class="text-xs text-on-surface-variant">Últimos desarrollos gestionados en la plataforma.</p>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-sm">
                            <thead>
                                <tr class="border-b border-surface-container-high text-xs text-on-surface-variant uppercase tracking-wider">
                                    <th class="py-3 px-4 font-semibold">Proyecto</th>
                                    <th class="py-3 px-4 font-semibold">Cliente / Empresa</th>
                                    <th class="py-3 px-4 font-semibold">Estado</th>
                                    <th class="py-3 px-4 font-semibold">Progreso</th>
                                    <th class="py-3 px-4 font-semibold text-right">Presupuesto</th>
                                    <th class="py-3 px-4 font-semibold text-center">Acción</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-surface-container-high/60">
                                <asp:Repeater ID="rptProyectos" runat="server">
                                    <ItemTemplate>
                                        <tr class="hover:bg-surface-container-low/50 transition-colors">
                                            <td class="py-4 px-4 font-semibold text-on-surface">
                                                <%# Eval("Titulo") %>
                                                <div class="text-xs text-on-surface-variant font-normal"><%# Eval("Descripcion") %></div>
                                            </td>
                                            <td class="py-4 px-4 text-on-surface">
                                                <div class="font-medium"><%# Eval("NombreEmpresa") %></div>
                                                <div class="text-xs text-on-surface-variant"><%# Eval("NombreCliente") %></div>
                                            </td>
                                            <td class="py-4 px-4">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-[11px] font-semibold border
                                                    <%# Eval("Estado").ToString() == "Finalizado" ? "bg-emerald-50 text-emerald-700 border-emerald-200" :
                                                        Eval("Estado").ToString() == "En Desarrollo" ? "bg-sky-50 text-sky-700 border-sky-200" :
                                                        Eval("Estado").ToString() == "En Revisión" ? "bg-indigo-50 text-indigo-700 border-indigo-200" :
                                                        "bg-amber-50 text-amber-700 border-amber-200" %>">
                                                    <%# Eval("Estado") %>
                                                </span>
                                            </td>
                                            <td class="py-4 px-4">
                                                <div class="w-32 bg-surface-container-high rounded-full h-2">
                                                    <div class="bg-primary h-2 rounded-full" style="width: <%# Eval("PorcentajeAvance") %>%"></div>
                                                </div>
                                                <span class="text-[11px] text-on-surface-variant mt-1 block"><%# Eval("PorcentajeAvance") %>% completado</span>
                                            </td>
                                            <td class="py-4 px-4 text-right font-semibold text-on-surface">
                                                $<%# string.Format("{0:N0}", Eval("Precio")) %>
                                            </td>
                                            <td class="py-4 px-4 text-center">
                                                <a href='DetalleProyecto.aspx?id=<%# Eval("Id") %>' class="inline-flex items-center gap-1 px-3 py-1 bg-primary/10 hover:bg-primary text-primary hover:text-white rounded-full text-xs font-semibold transition-colors">
                                                    <span>Ver</span>
                                                    <span class="material-symbols-outlined text-[14px]">arrow_forward</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
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
