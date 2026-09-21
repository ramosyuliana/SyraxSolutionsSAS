<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proyectos.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.Proyectos" %>

<!DOCTYPE html>
<html class="light scroll-smooth" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Casos de Éxito &amp; Portafolio - Syrax Solutions S.A.S.</title>
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
                <a class="text-primary border-b-2 border-primary pb-0.5" href="Proyectos.aspx">Proyectos</a>
                <a class="hover:text-primary transition-colors" href="Contacto.aspx">Contacto</a>
            </nav>

            <div class="flex items-center gap-3">
                <a href="Login.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm px-5 py-2.5 rounded-full hover:shadow-lg hover:shadow-primary/20 active:scale-95 transition-all">
                    <span>Acceso Clientes</span>
                    <span class="material-symbols-outlined text-[18px]">lock</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Main Content Canvas -->
    <main class="flex-1 w-full max-w-7xl mx-auto px-4 sm:px-8 pt-32 pb-24 relative space-y-16">
        <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>

        <!-- Header Section -->
        <div class="text-center max-w-3xl mx-auto space-y-3 relative z-10">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary border border-primary/20">
                <span class="material-symbols-outlined text-[16px]">folder_special</span>
                <span>Portafolio de Entregas Exitosas</span>
            </div>
            <h1 class="font-display text-3xl sm:text-5xl font-extrabold text-slate-900 tracking-tight">
                Proyectos &amp; Casos de Estudio
            </h1>
            <p class="text-base text-slate-600 font-normal leading-relaxed">
                Descubre cómo hemos impulsado la modernización digital y la rentabilidad de nuestros clientes a través de soluciones de software robustas y escalables.
            </p>
        </div>

        <!-- Portfolio Bento Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 relative z-10">
            
            <!-- Project 1 -->
            <div class="lg:col-span-2 bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="flex items-center justify-between">
                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200">
                            <span class="w-2 h-2 rounded-full bg-emerald-500"></span> Desplegado en Producción
                        </span>
                        <span class="text-xs font-mono text-slate-400">AWS :: us-east-1</span>
                    </div>
                    <h2 class="font-display text-2xl font-bold text-slate-900 group-hover:text-primary transition-colors">
                        Cloud Infrastructure &amp; Kubernetes Migration
                    </h2>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Transición completa de infraestructura física on-premise hacia clústeres elásticos en Amazon Web Services (EKS 1.30), implementando NGINX Ingress, TLS automatizado y balanceo de carga multi-zona para alta concurrencia.
                    </p>
                    <div class="flex flex-wrap gap-2 pt-2">
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">AWS EKS</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Terraform</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Docker</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">CI/CD</span>
                    </div>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <span>Impacto: -42% en costos de servidores</span>
                    <span class="font-semibold text-primary">SLA 99.99%</span>
                </div>
            </div>

            <!-- Project 2 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="flex items-center justify-between">
                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-sky-50 text-sky-700 border border-sky-200">
                            <span class="w-2 h-2 rounded-full bg-sky-500"></span> Plataforma B2B
                        </span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900 group-hover:text-primary transition-colors">
                        Portal Empresarial de Autogestión
                    </h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Portal de pedidos y catálogo para clientes corporativos con autenticación segura JWT, panel de administración en tiempo real y sincronización contable.
                    </p>
                    <div class="flex flex-wrap gap-2 pt-2">
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">ASP.NET</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">SQL Server</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">REST API</span>
                    </div>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <span>Clientes: Acme Corp</span>
                    <span class="font-semibold text-primary">+25% Conversión</span>
                </div>
            </div>

            <!-- Project 3 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="flex items-center justify-between">
                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-indigo-50 text-indigo-700 border border-indigo-200">
                            <span class="w-2 h-2 rounded-full bg-indigo-500"></span> Móvil &amp; GPS
                        </span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900 group-hover:text-primary transition-colors">
                        App Móvil Corporativa &amp; Logística
                    </h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Solución móvil con trazabilidad en vivo, mapas interactivos, geocercas y modo offline para supervisores de campo y distribución.
                    </p>
                    <div class="flex flex-wrap gap-2 pt-2">
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Flutter</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">GPS Tracking</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Push Notifs</span>
                    </div>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <span>Trazabilidad 100% en tiempo real</span>
                </div>
            </div>

            <!-- Project 4 -->
            <div class="lg:col-span-2 bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="flex items-center justify-between">
                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200">
                            <span class="w-2 h-2 rounded-full bg-emerald-500"></span> Auditoría &amp; SecDevOps
                        </span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900 group-hover:text-primary transition-colors">
                        Auditoría de Ciberseguridad &amp; Hardening
                    </h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Implementación de políticas Zero Trust, análisis de vulnerabilidades estáticas y dinámicas en pipelines CI/CD, cifrado de bases de datos y hardening integral de servidores Linux.
                    </p>
                    <div class="flex flex-wrap gap-2 pt-2">
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">OWASP Top 10</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Zero Trust</span>
                        <span class="px-3 py-1 bg-slate-100 text-slate-700 rounded-full text-xs font-medium">Hardening</span>
                    </div>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
                    <span>Zero incidentes en producción</span>
                    <span class="font-semibold text-emerald-600">Certificación de seguridad</span>
                </div>
            </div>

        </div>

        <!-- CTA Section -->
        <div class="bg-slate-950 text-white rounded-3xl p-8 sm:p-12 text-center relative overflow-hidden">
            <div class="absolute inset-0 bg-gradient-to-r from-primary/30 to-accent/20 pointer-events-none"></div>
            <div class="relative z-10 max-w-2xl mx-auto space-y-4">
                <h3 class="font-display text-2xl sm:text-3xl font-extrabold text-white">¿Listo para construir tu caso de éxito?</h3>
                <p class="text-slate-300 text-sm sm:text-base leading-relaxed">
                    Conversemos sobre cómo Syrax Solutions puede diseñar e implementar la arquitectura ideal para los desafíos de tu negocio.
                </p>
                <div class="pt-2">
                    <a href="Contacto.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-primary to-accent hover:opacity-95 text-white font-bold text-sm px-8 py-3.5 rounded-full shadow-lg shadow-sky-500/25 transition-all">
                        <span>Iniciar Proyecto</span>
                        <span class="material-symbols-outlined text-[18px]">rocket_launch</span>
                    </a>
                </div>
            </div>
        </div>

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
