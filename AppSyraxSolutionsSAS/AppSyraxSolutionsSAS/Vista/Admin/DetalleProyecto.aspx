<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleProyecto.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Admin.DetalleProyecto" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Admin - Detalle de Proyecto</title>
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
        
        <!-- Header Superior -->
        <header class="bg-surface-container-lowest shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] sticky top-0 z-50 flex justify-between items-center w-full px-4 md:px-8 h-16 ml-0 md:ml-64 md:w-[calc(100%-16rem)]">
            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleSidebar()" class="md:hidden p-2 text-on-surface-variant hover:bg-surface-container-low rounded-full">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <div class="flex items-center gap-2">
                    <a href="Proyectos.aspx" class="text-on-surface-variant hover:text-primary transition-colors flex items-center gap-1 text-sm font-semibold">
                        <span class="material-symbols-outlined text-base">arrow_back</span>
                        <span>Proyectos</span>
                    </a>
                    <span class="text-outline-variant">/</span>
                    <h1 class="font-headline-md text-base md:text-lg font-bold text-primary tracking-tight truncate max-w-xs md:max-w-md">
                        <asp:Literal ID="litTituloHeader" runat="server">Detalle de Proyecto</asp:Literal>
                    </h1>
                </div>
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
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Clientes.aspx">
                        <span class="material-symbols-outlined text-lg">group</span>
                        Clientes
                    </a>
                    <a class="text-on-surface-variant hover:bg-surface-container-low rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-medium transition-colors" href="Trabajadores.aspx">
                        <span class="material-symbols-outlined text-lg">badge</span>
                        Colaboradores
                    </a>
                    <a class="bg-primary text-white rounded-full flex items-center gap-3 px-4 py-2.5 font-label-md text-sm font-semibold transition-all shadow-sm" href="Proyectos.aspx">
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

            <!-- Área Principal -->
            <main class="flex-1 md:ml-64 p-4 md:p-8 min-h-[calc(100vh-64px)] max-w-[1280px]">
                
                <!-- Panel de Alertas -->
                <asp:Panel ID="pnlAlerta" runat="server" Visible="false" CssClass="mb-6 p-4 rounded-2xl flex items-center gap-3 text-sm">
                    <asp:Label ID="lblMensaje" runat="server" />
                </asp:Panel>

                <!-- Encabezado del Proyecto con Acciones -->
                <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-6 mb-8 bg-surface-container-lowest p-6 sm:p-8 rounded-3xl shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20">
                    <div>
                        <div class="flex flex-wrap items-center gap-2.5 mb-2">
                            <span class="font-headline-md text-xs font-bold uppercase tracking-wider px-3 py-1 rounded-full bg-primary/10 text-primary">
                                <asp:Literal ID="litEstadoBadge" runat="server">En Desarrollo</asp:Literal>
                            </span>
                            <span class="text-outline-variant">•</span>
                            <span class="text-xs text-on-surface-variant flex items-center gap-1 font-medium">
                                <span class="material-symbols-outlined text-sm text-secondary">business</span>
                                <asp:Literal ID="litEmpresa" runat="server">Empresa</asp:Literal>
                            </span>
                            <span class="text-outline-variant">•</span>
                            <span class="text-xs text-on-surface-variant flex items-center gap-1 font-medium">
                                <span class="material-symbols-outlined text-sm text-primary">person</span>
                                <asp:Literal ID="litCliente" runat="server">Contacto</asp:Literal>
                            </span>
                        </div>
                        <h2 class="font-headline-lg text-2xl sm:text-3xl font-bold text-on-surface tracking-tight mb-2">
                            <asp:Literal ID="litTitulo" runat="server">Título del Proyecto</asp:Literal>
                        </h2>
                        <p class="text-sm text-on-surface-variant max-w-3xl leading-relaxed">
                            <asp:Literal ID="litDescripcion" runat="server">Descripción detallada del proyecto empresarial.</asp:Literal>
                        </p>
                    </div>

                    <!-- Cambiar Estado Directamente -->
                    <div class="w-full lg:w-auto flex flex-col sm:flex-row items-stretch sm:items-center gap-3 bg-surface-container-low p-4 rounded-2xl border border-surface-container-high">
                        <div class="flex flex-col">
                            <label class="text-[11px] font-semibold text-on-surface-variant uppercase tracking-wider mb-1" for="ddlEstado">
                                Cambiar Estado:
                            </label>
                            <asp:DropDownList ID="ddlEstado" runat="server"
                                CssClass="bg-surface-container-lowest border border-outline-variant/40 rounded-full px-4 py-2 text-xs font-semibold text-on-surface focus:ring-2 focus:ring-primary focus:outline-none">
                                <asp:ListItem Text="Pendiente" Value="Pendiente" />
                                <asp:ListItem Text="En Desarrollo" Value="En Desarrollo" />
                                <asp:ListItem Text="En Revisión" Value="En Revisión" />
                                <asp:ListItem Text="Finalizado" Value="Finalizado" />
                                <asp:ListItem Text="Cancelado" Value="Cancelado" />
                            </asp:DropDownList>
                        </div>
                        <div class="sm:self-end">
                            <asp:Button ID="btnActualizarEstado" runat="server" Text="Actualizar" OnClick="btnActualizarEstado_Click"
                                CssClass="w-full px-5 py-2 bg-primary hover:bg-primary/90 text-white font-semibold text-xs rounded-full shadow-sm transition active:scale-95 cursor-pointer" />
                        </div>
                    </div>
                </div>

                <!-- Bento Grid Layout -->
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 mb-8">
                    
                    <!-- Card 1: Progreso, Cronograma & Métricas -->
                    <div class="lg:col-span-8 bg-surface-container-lowest rounded-3xl p-6 sm:p-8 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-center mb-4">
                                <div class="flex items-center gap-2.5">
                                    <div class="w-8 h-8 rounded-full bg-primary/10 text-primary flex items-center justify-center">
                                        <span class="material-symbols-outlined text-lg">trending_up</span>
                                    </div>
                                    <h3 class="font-headline-md text-lg font-bold text-on-surface">Progreso &amp; Cronograma</h3>
                                </div>
                                <span class="font-headline-md text-2xl font-bold text-primary">
                                    <asp:Literal ID="litPorcentaje" runat="server">65%</asp:Literal>
                                </span>
                            </div>

                            <!-- Barra de Progreso -->
                            <div class="w-full bg-surface-container-high rounded-full h-3 mb-6 overflow-hidden">
                                <div id="divProgresoBar" runat="server" class="bg-primary h-3 rounded-full transition-all duration-700 ease-out" style="width: 65%;"></div>
                            </div>

                            <!-- Fechas Clave y Presupuesto -->
                            <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-4 border-t border-surface-container-high">
                                <div class="bg-surface-container-low p-4 rounded-2xl">
                                    <p class="text-[11px] text-on-surface-variant font-semibold uppercase tracking-wider mb-1 flex items-center gap-1">
                                        <span class="material-symbols-outlined text-[14px]">calendar_month</span> Fecha Inicio
                                    </p>
                                    <p class="font-headline-md text-sm font-bold text-on-surface">
                                        <asp:Literal ID="litFechaInicio" runat="server">12/10/2024</asp:Literal>
                                    </p>
                                </div>
                                <div class="bg-surface-container-low p-4 rounded-2xl">
                                    <p class="text-[11px] text-on-surface-variant font-semibold uppercase tracking-wider mb-1 flex items-center gap-1">
                                        <span class="material-symbols-outlined text-[14px]">event_available</span> Fecha Entrega
                                    </p>
                                    <p class="font-headline-md text-sm font-bold text-on-surface">
                                        <asp:Literal ID="litFechaEntrega" runat="server">30/01/2025</asp:Literal>
                                    </p>
                                </div>
                                <div class="bg-surface-container-low p-4 rounded-2xl">
                                    <p class="text-[11px] text-on-surface-variant font-semibold uppercase tracking-wider mb-1 flex items-center gap-1">
                                        <span class="material-symbols-outlined text-[14px]">payments</span> Inversión Acordada
                                    </p>
                                    <p class="font-headline-md text-sm font-bold text-primary">
                                        $<asp:Literal ID="litPrecio" runat="server">0</asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Fases del Roadmap -->
                        <div class="mt-6 pt-6 border-t border-surface-container-high">
                            <h4 class="text-xs font-bold text-on-surface uppercase tracking-wider mb-3">Fases de Ejecución Técnica</h4>
                            <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
                                <div class="p-3 rounded-xl border border-primary/20 bg-primary/5 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-primary text-base">check_circle</span>
                                    <div>
                                        <p class="text-xs font-bold text-on-surface">1. Requerimientos</p>
                                        <p class="text-[10px] text-on-surface-variant">Alcance y Arquitectura</p>
                                    </div>
                                </div>
                                <div class="p-3 rounded-xl border border-primary/40 bg-primary/10 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-primary text-base">sync</span>
                                    <div>
                                        <p class="text-xs font-bold text-on-surface">2. Desarrollo Core</p>
                                        <p class="text-[10px] text-on-surface-variant">Implementación Activa</p>
                                    </div>
                                </div>
                                <div class="p-3 rounded-xl border border-outline-variant/30 bg-surface-container-low flex items-center gap-2 opacity-70">
                                    <span class="material-symbols-outlined text-outline text-base">hourglass_empty</span>
                                    <div>
                                        <p class="text-xs font-bold text-on-surface">3. Pruebas &amp; QA</p>
                                        <p class="text-[10px] text-on-surface-variant">Despliegue y Entrega</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2: Información Corporativa del Cliente -->
                    <div class="lg:col-span-4 bg-surface-container-lowest rounded-3xl p-6 sm:p-8 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 flex flex-col justify-between">
                        <div>
                            <div class="flex items-center gap-2.5 mb-6">
                                <div class="w-8 h-8 rounded-full bg-secondary/10 text-secondary flex items-center justify-center">
                                    <span class="material-symbols-outlined text-lg">corporate_fare</span>
                                </div>
                                <h3 class="font-headline-md text-lg font-bold text-on-surface">Ficha del Cliente</h3>
                            </div>

                            <div class="space-y-4 text-xs">
                                <div class="pb-3 border-b border-surface-container-high">
                                    <span class="text-[11px] text-on-surface-variant block uppercase font-semibold">Empresa Contratante</span>
                                    <span class="text-sm font-bold text-on-surface">
                                        <asp:Literal ID="litCardEmpresa" runat="server">N/A</asp:Literal>
                                    </span>
                                </div>

                                <div class="pb-3 border-b border-surface-container-high">
                                    <span class="text-[11px] text-on-surface-variant block uppercase font-semibold">Representante</span>
                                    <span class="text-sm font-semibold text-on-surface">
                                        <asp:Literal ID="litCardCliente" runat="server">N/A</asp:Literal>
                                    </span>
                                </div>

                                <div class="pb-3 border-b border-surface-container-high">
                                    <span class="text-[11px] text-on-surface-variant block uppercase font-semibold">Correo Electrónico</span>
                                    <span class="text-xs font-medium text-primary">
                                        <asp:Literal ID="litCardCorreo" runat="server">N/A</asp:Literal>
                                    </span>
                                </div>

                                <div>
                                    <span class="text-[11px] text-on-surface-variant block uppercase font-semibold">ID Suscripción</span>
                                    <span class="text-xs font-mono bg-surface-container-low px-2 py-1 rounded inline-block mt-1">
                                        <asp:Literal ID="litCardSuscripcion" runat="server">#0</asp:Literal>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="mt-6 pt-4 border-t border-surface-container-high">
                            <a href="Clientes.aspx" class="w-full py-2.5 bg-surface-container-low hover:bg-surface-container-high text-on-surface text-xs font-semibold rounded-full text-center flex items-center justify-center gap-2 transition-colors">
                                <span class="material-symbols-outlined text-sm">contacts</span>
                                <span>Ver Directorio de Clientes</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Sección: Registro y Bitácora de Avances Técnicos -->
                <div class="bg-surface-container-lowest rounded-3xl p-6 sm:p-8 shadow-[0_20px_40px_0_hsla(210,20%,30%,0.05)] border border-outline-variant/20 mb-8">
                    
                    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 pb-6 border-b border-surface-container-high mb-6">
                        <div>
                            <div class="flex items-center gap-2.5">
                                <div class="w-8 h-8 rounded-full bg-primary/10 text-primary flex items-center justify-center">
                                    <span class="material-symbols-outlined text-lg">history_edu</span>
                                </div>
                                <h3 class="font-headline-md text-lg font-bold text-on-surface">Bitácora de Avances Técnicos</h3>
                            </div>
                            <p class="text-xs text-on-surface-variant mt-1">Registro cronológico de entregables, sprints y evidencias reportadas.</p>
                        </div>
                        
                        <button type="button" onclick="toggleFormAvance()" class="px-4 py-2 bg-primary/10 hover:bg-primary text-primary hover:text-white rounded-full text-xs font-semibold transition-colors flex items-center gap-1.5 cursor-pointer">
                            <span class="material-symbols-outlined text-sm">add_circle</span>
                            <span>Reportar Nuevo Avance</span>
                        </button>
                    </div>

                    <!-- Formulario Desplegable para Registrar Avance -->
                    <div id="formAvanceContainer" class="hidden mb-6 p-5 bg-surface-container-low rounded-2xl border border-outline-variant/40">
                        <h4 class="text-xs font-bold text-on-surface uppercase tracking-wider mb-3">Registrar Nueva Evidencia / Avance</h4>
                        <div class="space-y-3">
                            <asp:TextBox ID="txtEvidencia" runat="server" TextMode="MultiLine" Rows="3"
                                CssClass="w-full bg-surface-container-lowest border border-outline-variant/30 rounded-xl p-3 text-xs text-on-surface focus:ring-2 focus:ring-primary focus:outline-none transition"
                                placeholder="Describe detalladamente el avance técnico realizado, módulos completados, repositorios o enlaces de entrega..." />
                            <div class="flex justify-end gap-2">
                                <button type="button" onclick="toggleFormAvance()" class="px-4 py-2 text-xs font-medium text-on-surface-variant hover:bg-surface-container-high rounded-full">
                                    Cancelar
                                </button>
                                <asp:Button ID="btnGuardarAvance" runat="server" Text="Guardar Avance" OnClick="btnGuardarAvance_Click"
                                    CssClass="px-5 py-2 bg-primary hover:bg-primary/90 text-white font-semibold text-xs rounded-full shadow-sm transition active:scale-95 cursor-pointer" />
                            </div>
                        </div>
                    </div>

                    <!-- Lista de Avances -->
                    <div class="space-y-4">
                        <asp:Repeater ID="rptAvances" runat="server" OnItemCommand="rptAvances_ItemCommand">
                            <ItemTemplate>
                                <div class="p-4 sm:p-5 rounded-2xl border border-surface-container-high hover:border-outline-variant/40 transition-colors bg-surface-container-lowest">
                                    <div class="flex items-start justify-between gap-4 mb-3">
                                        <div class="flex items-start gap-3.5">
                                            <div class="w-8 h-8 rounded-full bg-emerald-50 text-emerald-600 flex items-center justify-center shrink-0 mt-0.5">
                                                <span class="material-symbols-outlined text-[18px]">verified</span>
                                            </div>
                                            <div>
                                                <div class="flex items-center gap-2 mb-1">
                                                    <span class="text-xs font-bold text-on-surface">Avance #<%# Eval("Id") %></span>
                                                    <span class="text-[10px] text-on-surface-variant">•</span>
                                                    <span class="text-[11px] text-on-surface-variant font-medium flex items-center gap-1">
                                                        <span class="material-symbols-outlined text-[13px]">schedule</span>
                                                        <%# Eval("FechaEntrega", "{0:dd/MM/yyyy}") %>
                                                    </span>
                                                </div>
                                                <p class="text-xs text-on-surface leading-relaxed whitespace-pre-line"><%# Eval("Evidencia") %></p>
                                            </div>
                                        </div>
                                        <span class="shrink-0 px-2.5 py-1 rounded-full text-[10px] font-bold bg-emerald-100 text-emerald-800 uppercase tracking-wider">
                                            Entregado
                                        </span>
                                    </div>

                                    <!-- Observaciones registradas para este Avance -->
                                    <asp:Repeater ID="rptObservaciones" runat="server" DataSource='<%# Eval("ListaObservaciones") %>'>
                                        <ItemTemplate>
                                            <div class="mt-2 p-3 rounded-xl bg-surface-container-low/60 border border-outline-variant/20 flex items-start gap-2.5 text-xs ml-4 sm:ml-11">
                                                <span class="material-symbols-outlined text-primary text-sm mt-0.5">comment</span>
                                                <div class="flex-1">
                                                    <span class="font-bold text-primary"><%# Eval("NombreUsuario") %>:</span>
                                                    <span class="text-on-surface ml-1"><%# Eval("Descripcion") %></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <!-- Formulario para agregar observación -->
                                    <div class="mt-3 pt-3 border-t border-surface-container-high flex items-center gap-2 ml-4 sm:ml-11">
                                        <asp:TextBox ID="txtNuevaObservacion" runat="server" 
                                            CssClass="flex-1 bg-surface-container-low border border-outline-variant/30 rounded-full px-4 py-1.5 text-xs text-on-surface focus:ring-2 focus:ring-primary focus:outline-none" 
                                            placeholder="Escribir retroalimentación técnica u observación..." />
                                        <asp:Button ID="btnEnviarObs" runat="server" CommandName="AgregarObservacion" CommandArgument='<%# Eval("Id") %>' 
                                            Text="Comentar" 
                                            CssClass="px-4 py-1.5 bg-primary/10 hover:bg-primary text-primary hover:text-white rounded-full text-xs font-semibold transition cursor-pointer shrink-0" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Panel ID="pnlSinAvances" runat="server" Visible="false" CssClass="text-center py-10 text-on-surface-variant">
                            <span class="material-symbols-outlined text-4xl text-outline-variant mb-2">assignment_late</span>
                            <p class="text-xs font-semibold text-on-surface">Aún no se han reportado avances técnicos para este proyecto.</p>
                            <p class="text-[11px] text-on-surface-variant mt-1">Utilice el botón superior para registrar la primera evidencia o entregable.</p>
                        </asp:Panel>
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

        function toggleFormAvance() {
            var el = document.getElementById('formAvanceContainer');
            if (el.classList.contains('hidden')) {
                el.classList.remove('hidden');
            } else {
                el.classList.add('hidden');
            }
        }
    </script>
</body>
</html>
