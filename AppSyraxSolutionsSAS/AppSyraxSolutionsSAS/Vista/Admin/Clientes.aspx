<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Admin.Clientes" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Admin - Gestión de Clientes</title>
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
        
        <!-- Header -->
        <header class="bg-surface-container-lowest shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] sticky top-0 z-50 flex justify-between items-center w-full px-4 md:px-8 h-16 ml-0 md:ml-64 md:w-[calc(100%-16rem)]">
            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleSidebar()" class="md:hidden p-2 text-on-surface-variant hover:bg-surface-container-low rounded-full">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <h1 class="font-headline-md text-lg md:text-xl font-bold text-primary tracking-tight">Gestión Corporativa de Clientes</h1>
            </div>
            <div class="flex items-center gap-3">
                <div class="w-9 h-9 rounded-full bg-primary/10 text-primary flex items-center justify-center font-bold">
                    <asp:Literal ID="litInicial" runat="server">A</asp:Literal>
                </div>
                <div class="hidden sm:block text-left">
                    <p class="font-label-md text-xs font-semibold text-on-surface leading-none">
                        <asp:Literal ID="litNombreUsuario" runat="server">Administrador</asp:Literal>
                    </p>
                    <p class="text-[11px] text-on-surface-variant">Rol: Administrador</p>
                </div>
            </div>
        </header>

        <div class="flex">
            <!-- Menú Lateral -->
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
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Dashboard.aspx">
                        <span class="material-symbols-outlined text-lg">dashboard</span>
                        Dashboard
                    </a>
                    <a class="bg-primary text-white rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-all shadow-sm" href="Clientes.aspx">
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

            <!-- Contenido -->
            <main class="flex-1 md:ml-64 p-4 md:p-8 min-h-[calc(100vh-64px)]">
                
                <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6 p-4 rounded-xl flex items-center gap-3 text-sm">
                    <asp:Label ID="lblMensaje" runat="server" />
                </asp:Panel>

                <!-- Encabezado y Acciones -->
                <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
                    <div>
                        <h2 class="font-headline-lg text-2xl md:text-3xl font-bold text-on-surface">Gestión de Clientes</h2>
                        <p class="text-sm text-on-surface-variant mt-1">Directorio de cuentas corporativas y personas de contacto.</p>
                    </div>
                </div>

                <!-- Tabla de Clientes -->
                <div class="bg-surface-container-lowest rounded-2xl overflow-hidden shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20">
                    <div class="p-4 border-b border-surface-container-high flex items-center justify-between">
                        <span class="text-sm font-semibold text-on-surface">Listado de Clientes Activos</span>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-sm border-collapse">
                            <thead>
                                <tr class="border-b border-surface-container-high bg-surface-container-low/40 text-xs text-on-surface-variant uppercase tracking-wider">
                                    <th class="py-3.5 px-6 font-semibold">Cliente / Contacto</th>
                                    <th class="py-3.5 px-6 font-semibold">Empresa</th>
                                    <th class="py-3.5 px-6 font-semibold">Documento</th>
                                    <th class="py-3.5 px-6 font-semibold">Teléfono</th>
                                    <th class="py-3.5 px-6 font-semibold">Dirección</th>
                                    <th class="py-3.5 px-6 font-semibold">Estado</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-surface-container-high/60">
                                <asp:Repeater ID="rptClientes" runat="server">
                                    <ItemTemplate>
                                        <tr class="hover:bg-surface-container-low/50 transition-colors">
                                            <td class="py-4 px-6">
                                                <div class="font-bold text-on-surface"><%# Eval("NombreCompleto") %></div>
                                                <div class="text-xs text-on-surface-variant"><%# Eval("Correo") %></div>
                                            </td>
                                            <td class="py-4 px-6 font-medium text-on-surface">
                                                <%# Eval("NombreEmpresa") %>
                                            </td>
                                            <td class="py-4 px-6 text-on-surface-variant">
                                                <%# Eval("NombreTipoDocumento") %>: <%# Eval("NumeroDocumento") %>
                                            </td>
                                            <td class="py-4 px-6 text-on-surface-variant">
                                                <%# Eval("Telefono") %>
                                            </td>
                                            <td class="py-4 px-6 text-on-surface-variant text-xs">
                                                <%# Eval("Direccion") %>
                                            </td>
                                            <td class="py-4 px-6">
                                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-primary/10 text-primary">
                                                    Activo
                                                </span>
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
