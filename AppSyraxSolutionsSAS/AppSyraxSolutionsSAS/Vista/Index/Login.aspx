<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.Login" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Solutions - Iniciar Sesión</title>
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
                        glow: "0 0 50px -10px rgba(14, 165, 233, 0.25)",
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
<body class="bg-surface text-on-surface font-sans antialiased min-h-screen flex items-center justify-center p-4 relative selection:bg-primary-container/20 selection:text-primary">

    <!-- Background Decor -->
    <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>
    <div class="absolute top-1/4 left-1/2 -translate-x-1/2 w-[500px] h-[300px] bg-sky-200/40 rounded-full blur-3xl pointer-events-none z-0"></div>

    <div class="relative z-10 w-full max-w-[460px]">

        <!-- Back to Home Link -->
        <div class="mb-5 text-center sm:text-left">
            <a href="../../index.aspx" class="inline-flex items-center gap-1.5 text-xs font-semibold text-slate-500 hover:text-primary transition-colors">
                <span class="material-symbols-outlined text-[18px]">arrow_back</span>
                <span>Volver al portal principal</span>
            </a>
        </div>

        <!-- Login Card -->
        <div class="bg-white rounded-3xl p-8 sm:p-10 shadow-card border border-border-subtle relative backdrop-blur-sm">

            <!-- Logo Section -->
            <div class="flex flex-col items-center mb-8">
                <div class="w-14 h-14 rounded-2xl from-primary to-accent flex items-center justify-center text-white font-display font-bold text-2xl shadow-md mb-4">

                    <img src="../Assets/Img/logo.png" alt="Logo Syrax Solutions" class="w-10 h-10" />
                </div>
                <h1 class="font-display text-2xl sm:text-3xl font-extrabold text-slate-900 text-center tracking-tight">Bienvenido de Nuevo</h1>
                <p class="text-xs sm:text-sm text-slate-500 mt-2 text-center max-w-xs leading-relaxed">
                    Ingresa a tu cuenta corporativa para gestionar proyectos, avances y solicitudes.
                                  
                </p>
            </div>

            <form id="form1" runat="server" class="flex flex-col gap-4">

                <!-- Mensaje de Error / Alerta -->
                <asp:Panel ID="pnlAlerta" runat="server" Visible="false" CssClass="p-4 rounded-2xl flex items-center gap-3 text-xs bg-error-container text-on-error-container border border-error/20">
                    <span class="material-symbols-outlined text-error text-[20px]">error</span>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="font-medium" />
                </asp:Panel>

                <!-- Campo Correo -->
                <div class="flex flex-col gap-1.5">
                    <label class="text-xs font-bold uppercase tracking-wider text-slate-700" for="txtCorreo">
                        Correo Corporativo
                   
                    </label>
                    <div class="relative">
                        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-[20px]">mail</span>
                        <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email"
                            CssClass="w-full bg-slate-50 border border-slate-200 py-3 pl-12 pr-4 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition rounded-xl"
                            placeholder="ejemplo@syrax.com" required="required" />
                    </div>
                </div>

                <!-- Campo Contraseña -->
                <div class="flex flex-col gap-1.5">
                    <label class="text-xs font-bold uppercase tracking-wider text-slate-700" for="txtClave">
                        Contraseña
                   
                    </label>
                    <div class="relative">
                        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-[20px]">lock</span>
                        <asp:TextBox ID="txtClave" runat="server" TextMode="Password"
                            CssClass="w-full bg-slate-50 border border-slate-200 py-3 pl-12 pr-4 text-sm text-slate-900 focus:bg-white focus:border-primary focus:ring-2 focus:ring-primary/20 focus:outline-none transition rounded-xl"
                            placeholder="••••••••" required="required" />
                    </div>
                </div>

                <!-- Recordar & Recuperar -->
                <div class="flex items-center justify-between text-xs pt-1">
                    <label class="flex items-center gap-2 cursor-pointer group">
                        <input type="checkbox" class="w-4 h-4 rounded text-primary focus:ring-primary border-slate-300" />
                        <span class="text-slate-600 font-medium">Recordarme</span>
                    </label>
                    <a class="text-primary font-semibold hover:underline" href="#">¿Olvidó su clave?</a>
                </div>

                <!-- Botón Submit -->
                <asp:Button ID="btnLogin" runat="server" Text="Ingresar a la Plataforma" OnClick="btnLogin_Click"
                    CssClass="w-full bg-primary hover:bg-primary-hover text-white font-semibold text-sm py-3.5 px-6 rounded-xl shadow-md shadow-primary/25 hover:shadow-lg active:scale-[0.99] transition-all cursor-pointer mt-2" />

                <!-- Accesos Rápidos de Prueba -->
                <div class="mt-4 pt-5 border-t border-slate-100 text-center">
                    <p class="text-[11px] font-bold text-slate-400 uppercase tracking-wider mb-2.5">Acceso rápido para demostración:</p>
                    <div class="flex flex-wrap gap-2 justify-center">
                        <button type="button" onclick="cargarCredenciales('admin@syrax.com', 'Admin123*')"
                            class="text-xs font-semibold bg-primary/10 text-primary hover:bg-primary hover:text-white px-3.5 py-1.5 rounded-full transition-all">
                            Admin
                       
                        </button>
                        <button type="button" onclick="cargarCredenciales('cliente@acme.com', 'Cliente123*')"
                            class="text-xs font-semibold bg-secondary/10 text-secondary hover:bg-secondary hover:text-white px-3.5 py-1.5 rounded-full transition-all">
                            Cliente (Acme)
                       
                        </button>
                        <button type="button" onclick="cargarCredenciales('diana@fintechinnovate.co', 'Cliente123*')"
                            class="text-xs font-semibold bg-sky-100 text-sky-800 hover:bg-sky-600 hover:text-white px-3.5 py-1.5 rounded-full transition-all">
                            Cliente 2 (FinTech)
                       
                        </button>
                        <button type="button" onclick="cargarCredenciales('dev@syrax.com', 'Dev123*')"
                            class="text-xs font-semibold bg-slate-100 text-slate-700 hover:bg-slate-700 hover:text-white px-3.5 py-1.5 rounded-full transition-all">
                            Desarrollador
                       
                        </button>
                    </div>
                </div>

                <div class="text-center mt-3 pt-2 space-y-1.5 text-xs text-slate-500">
                    <p>
                        ¿No tienes una cuenta corporativa? 
                       
                        <a href="Registro.aspx" class="font-bold text-primary hover:underline">Regístrate aquí</a>
                    </p>
                    <p>
                        ¿Requieres consultoría o cotización? 
                       
                        <a href="Contacto.aspx" class="font-semibold text-secondary hover:underline">Contáctanos</a>
                    </p>
                </div>
            </form>
        </div>

        <p class="text-center text-[11px] text-slate-400 mt-6">
            © 2026 Syrax Solutions S.A.S. Plataforma segura con cifrado TLS.
       
        </p>

    </div>

    <script>
        function cargarCredenciales(correo, clave) {
            document.getElementById('<%= txtCorreo.ClientID %>').value = correo;
            document.getElementById('<%= txtClave.ClientID %>').value = clave;
        }
    </script>
</body>
</html>
