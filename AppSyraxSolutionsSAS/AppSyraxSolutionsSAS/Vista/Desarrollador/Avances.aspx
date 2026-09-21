<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avances.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Desarrollador.Avances" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Desarrollador - Registro de Avances Técnicos</title>
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
                <h1 class="font-headline-md text-lg md:text-xl font-bold text-primary tracking-tight">Registro y Control de Avances</h1>
            </div>
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 rounded-full bg-primary/10 text-primary flex items-center justify-center font-bold">
                    <asp:Literal ID="litInicial" runat="server">D</asp:Literal>
                </div>
                <div class="hidden sm:block text-left">
                    <p class="font-label-md text-xs font-semibold text-on-surface leading-none">
                        <asp:Literal ID="litNombre" runat="server">Desarrollador</asp:Literal>
                    </p>
                    <p class="text-[11px] text-on-surface-variant">Rol: Desarrollador</p>
                </div>
            </div>
        </header>

        <div class="flex">
            <nav id="sidebar" class="bg-surface-container-lowest border-r border-outline-variant/30 h-screen w-64 fixed left-0 top-0 overflow-y-auto flex flex-col py-6 gap-1 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
                <div class="px-6 mb-6 flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-primary rounded-xl flex items-center justify-center text-white font-bold text-xl shadow-sm">
                            S
                        </div>
                        <div>
                            <div class="font-headline-md text-base font-bold text-primary">Syrax Dev</div>
                            <div class="text-[11px] text-on-surface-variant">Gestión Técnica</div>
                        </div>
                    </div>
                    <button type="button" onclick="toggleSidebar()" class="md:hidden text-on-surface-variant p-1 rounded-full hover:bg-surface-container-low">
                        <span class="material-symbols-outlined text-lg">close</span>
                    </button>
                </div>

                <div class="flex-1 px-3 flex flex-col gap-1">
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Dashboard.aspx">
                        <span class="material-symbols-outlined text-lg">dashboard</span>
                        Panel Principal
                    </a>
                    <a class="bg-primary text-white rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-all shadow-sm" href="Avances.aspx">
                        <span class="material-symbols-outlined text-lg">task_alt</span>
                        Registro de Avances
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Proyectos.aspx">
                        <span class="material-symbols-outlined text-lg">account_tree</span>
                        Mis Proyectos
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

            <main class="flex-1 md:ml-64 p-4 md:p-8 min-h-[calc(100vh-64px)]">
                
                <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6 p-4 rounded-xl flex items-center gap-3 text-sm">
                    <asp:Label ID="lblMensaje" runat="server" />
                </asp:Panel>

                <!-- Formulario de Avance -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 mb-8">
                    <h2 class="font-headline-md text-xl font-bold text-on-surface mb-2">Nuevo Avance o Entregable</h2>
                    <p class="text-xs text-on-surface-variant mb-6">Documenta el progreso realizado para mantener informados al Administrador y al Cliente.</p>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                        <div>
                            <label class="block text-xs font-semibold text-on-surface uppercase tracking-wider mb-1.5">Proyecto</label>
                            <asp:DropDownList ID="ddlProyectos" runat="server" 
                                CssClass="w-full bg-[#F1F5F9] border-none rounded-xl px-4 py-2.5 text-sm text-on-surface focus:ring-2 focus:ring-primary focus:outline-none transition" />
                        </div>
                        <div>
                            <label class="block text-xs font-semibold text-on-surface uppercase tracking-wider mb-1.5">Fecha de Entrega</label>
                            <asp:TextBox ID="txtFechaEntrega" runat="server" TextMode="Date" 
                                CssClass="w-full bg-[#F1F5F9] border-none rounded-xl px-4 py-2.5 text-sm text-on-surface focus:ring-2 focus:ring-primary focus:outline-none transition" />
                        </div>
                        <div>
                            <label class="block text-xs font-semibold text-on-surface uppercase tracking-wider mb-1.5">Estado del Proyecto</label>
                            <asp:DropDownList ID="ddlEstadoProyecto" runat="server" 
                                CssClass="w-full bg-[#F1F5F9] border-none rounded-xl px-4 py-2.5 text-sm text-on-surface focus:ring-2 focus:ring-primary focus:outline-none transition">
                                <asp:ListItem Text="En Desarrollo" Value="En Desarrollo" />
                                <asp:ListItem Text="En Revisión" Value="En Revisión" />
                                <asp:ListItem Text="Finalizado" Value="Finalizado" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="block text-xs font-semibold text-on-surface uppercase tracking-wider mb-1.5">Descripción de la Evidencia Técnica</label>
                        <asp:TextBox ID="txtEvidencia" runat="server" TextMode="MultiLine" Rows="4" 
                            CssClass="w-full bg-[#F1F5F9] border-none rounded-xl p-4 text-sm text-on-surface focus:ring-2 focus:ring-primary focus:outline-none transition" 
                            placeholder="Detalle de las características completadas, enlaces de despliegue, documentación de la API..." />
                    </div>

                    <div class="flex justify-end">
                        <asp:Button ID="btnGuardar" runat="server" Text="Registrar Avance" OnClick="btnGuardar_Click" 
                            CssClass="bg-primary text-white font-label-md text-sm font-semibold px-6 py-2.5 rounded-full hover:bg-on-primary-container transition-colors shadow-sm cursor-pointer" />
                    </div>
                </div>

                <!-- Historial -->
                <div class="bg-surface-container-lowest rounded-2xl p-6 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20">
                    <h3 class="font-headline-md text-lg font-bold text-on-surface mb-4">Historial de Avances</h3>
                    <div class="space-y-4">
                        <asp:Repeater ID="rptAvances" runat="server">
                            <ItemTemplate>
                                <div class="p-5 rounded-2xl bg-surface-container-low border border-outline-variant/20">
                                    <div class="flex justify-between items-center mb-2 pb-2 border-b border-outline-variant/20">
                                        <span class="font-bold text-sm text-on-surface"><%# Eval("TituloProyecto") %></span>
                                        <span class="text-xs text-on-surface-variant font-medium">Entrega: <%# Eval("FechaEntrega", "{0:dd/MM/yyyy}") %></span>
                                    </div>
                                    <p class="text-sm text-on-surface whitespace-pre-line"><%# Eval("Evidencia") %></p>

                                    <!-- Observaciones y Retroalimentación -->
                                    <asp:Repeater ID="rptObsDev" runat="server" DataSource='<%# Eval("ListaObservaciones") %>'>
                                        <ItemTemplate>
                                            <div class="mt-3 p-3 rounded-xl bg-surface-container-lowest border border-outline-variant/20 flex items-start gap-2.5 text-xs">
                                                <span class="material-symbols-outlined text-primary text-sm mt-0.5">feedback</span>
                                                <div>
                                                    <span class="font-bold text-primary"><%# Eval("NombreUsuario") %>:</span>
                                                    <span class="text-on-surface ml-1"><%# Eval("Descripcion") %></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
