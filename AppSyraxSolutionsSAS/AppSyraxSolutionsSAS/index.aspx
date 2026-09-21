<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AppSyraxSolutionsSAS.index" %>

<!DOCTYPE html>
<html class="light scroll-smooth" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Syrax Solutions S.A.S. - Transformación Digital & Cloud Architecture</title>
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
                        "secondary-dark": "#004e5a",
                        accent: "#0284c7",
                        surface: "#f7f9fb",
                        "surface-card": "#ffffff",
                        "surface-muted": "#f1f5f9",
                        "on-surface": "#0f172a",
                        "on-surface-variant": "#475569",
                        "border-subtle": "#e2e8f0"
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

        .glass-panel {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
        }
    </style>
</head>
<body class="bg-surface text-on-surface font-sans antialiased selection:bg-primary-container/20 selection:text-primary">

    <!-- TopNavBar -->
    <header class="fixed top-0 w-full z-50 glass-panel border-b border-border-subtle transition-all duration-300" id="main-header">
        <div class="flex justify-between items-center w-full px-4 sm:px-8 py-3.5 max-w-7xl mx-auto">
            <a href="index.aspx" class="flex items-center gap-3 group">
                <div class="w-10 h-10 rounded-xl  from-primary to-accent flex items-center justify-center text-white font-display font-bold text-xl shadow-md group-hover:scale-105 transition-transform">
                    <img src="Vista/Assets/Img/logo.png" alt="Syrax Solutions Logo" class="w-6 h-6" />
                </div>
                <div class="flex flex-col">
                    <span class="font-display text-lg font-bold text-primary tracking-tight leading-tight">Syrax Solutions</span>
                    <span class="text-[10px] uppercase tracking-widest font-semibold text-slate-500">Tecnología S.A.S.</span>
                </div>
            </a>

            <nav class="hidden md:flex items-center gap-8 text-sm font-semibold text-slate-600">
                <a class="text-primary border-b-2 border-primary pb-0.5" href="index.aspx">Inicio</a>
                <a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">Servicios</a>
                <a class="hover:text-primary transition-colors" href="Vista/Index/Nosotros.aspx">Nosotros</a>
                <a class="hover:text-primary transition-colors" href="Vista/Index/Proyectos.aspx">Proyectos</a>
                <a class="hover:text-primary transition-colors" href="Vista/Index/Contacto.aspx">Contacto</a>
            </nav>

            <div class="flex items-center gap-3">
                <a href="Vista/Index/Login.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm px-5 py-2.5 rounded-full hover:shadow-lg hover:shadow-primary/20 active:scale-95 transition-all">
                    <span>Acceso Clientes</span>
                    <span class="material-symbols-outlined text-[18px]">lock</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="relative pt-32 pb-20 md:pt-40 md:pb-28 overflow-hidden">
        <div class="absolute inset-0 hero-pattern z-0"></div>
        <div class="absolute top-1/4 left-1/2 -translate-x-1/2 w-[600px] h-[350px] bg-sky-200/40 rounded-full blur-3xl pointer-events-none z-0"></div>

        <div class="max-w-7xl mx-auto px-4 sm:px-8 relative z-10">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">

                <!-- Left text column -->
                <div class="lg:col-span-7 text-center lg:text-left space-y-6">
                    <div class="inline-flex items-center gap-2.5 px-4 py-1.5 rounded-full text-xs font-semibold bg-primary/10 text-primary border border-primary/20 backdrop-blur-sm">
                        <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                        Ingeniería de Software &amp; Cloud Empresarial
                   
                    </div>

                    <h1 class="font-display text-4xl sm:text-5xl lg:text-6xl font-extrabold text-slate-900 tracking-tight leading-[1.12]">Transformamos tu empresa con 
                       
                        <span class="bg-gradient-to-r from-primary via-accent to-sky-500 bg-clip-text text-transparent">tecnología de vanguardia.</span>
                    </h1>

                    <p class="text-base sm:text-lg text-slate-600 max-w-2xl mx-auto lg:mx-0 font-normal leading-relaxed">
                        Diseñamos, construimos y modernizamos plataformas web, arquitecturas cloud resilientes en AWS y Azure, y brindamos soporte técnico corporativo 24/7 con trazabilidad en tiempo real.
                   
                    </p>

                    <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start pt-2">
                        <a href="Vista/Index/Contacto.aspx" class="inline-flex items-center justify-center gap-2 bg-primary hover:bg-primary-hover text-white font-semibold text-base px-8 py-3.5 rounded-full shadow-lg shadow-primary/25 hover:-translate-y-0.5 transition-all">
                            <span>Solicitar Asesoría Técnica</span>
                            <span class="material-symbols-outlined text-[20px]">arrow_forward</span>
                        </a>
                        <a href="Vista/Index/servicios.aspx" class="inline-flex items-center justify-center gap-2 bg-white hover:bg-slate-50 text-slate-700 font-semibold text-base px-7 py-3.5 rounded-full border border-slate-200 shadow-sm hover:border-slate-300 transition-all">
                            <span class="material-symbols-outlined text-primary text-[20px]">widgets</span>
                            <span>Explorar Soluciones</span>
                        </a>
                    </div>

                    <!-- Client Trust Badges -->
                    <div class="pt-6 border-t border-slate-200/80 flex flex-wrap items-center justify-center lg:justify-start gap-6 text-xs text-slate-500 font-medium">
                        <div class="flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-emerald-600 text-[18px]">verified</span>
                            <span>SLA 99.98% Garantizado</span>
                        </div>
                        <div class="flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-emerald-600 text-[18px]">cloud_done</span>
                            <span>Partners AWS &amp; Azure</span>
                        </div>
                        <div class="flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-emerald-600 text-[18px]">shield</span>
                            <span>Estándares ISO / Ciberseguridad</span>
                        </div>
                    </div>
                </div>

                <!-- Right visual column: Dynamic Tech Mockup -->
                <div class="lg:col-span-5 relative">
                    <div class="relative mx-auto max-w-md lg:max-w-none">
                        <!-- Glow effect -->
                        <div class="absolute -inset-1.5 bg-gradient-to-r from-primary to-accent rounded-3xl blur-xl opacity-30"></div>

                        <!-- Main Card -->
                        <div class="relative bg-slate-900 text-white rounded-3xl p-6 sm:p-7 shadow-2xl border border-slate-800 space-y-5">

                            <!-- Card Header -->
                            <div class="flex items-center justify-between border-b border-slate-800 pb-4">
                                <div class="flex items-center gap-3">
                                    <div class="w-3 h-3 rounded-full bg-rose-500"></div>
                                    <div class="w-3 h-3 rounded-full bg-amber-500"></div>
                                    <div class="w-3 h-3 rounded-full bg-emerald-500"></div>
                                    <span class="text-xs font-mono text-slate-400 ml-2">syrax-core-engine::v3.4</span>
                                </div>
                                <span class="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[10px] font-semibold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">
                                    <span class="w-1.5 h-1.5 rounded-full bg-emerald-400"></span>Operativo
                                </span>
                            </div>

                            <!-- Live Project Metric Tile -->
                            <div class="bg-slate-800/80 rounded-2xl p-4 border border-slate-700/60">
                                <div class="flex justify-between items-start mb-2">
                                    <div>
                                        <p class="text-[11px] font-medium text-slate-400 uppercase tracking-wider">Proyecto Activo</p>
                                        <h4 class="text-sm font-semibold text-white">Cloud Infrastructure Migration</h4>
                                    </div>
                                    <span class="text-xs font-bold text-sky-400 font-mono">Sprint 4 / 6</span>
                                </div>
                                <div class="w-full bg-slate-700 h-2 rounded-full overflow-hidden mb-2">
                                    <div class="bg-gradient-to-r from-sky-400 to-primary h-full w-[78%] rounded-full"></div>
                                </div>
                                <div class="flex justify-between text-[11px] text-slate-400">
                                    <span>Clúster EKS Kubernetes 1.30</span>
                                    <span class="text-emerald-400 font-semibold">78% Completado</span>
                                </div>
                            </div>

                            <!-- Two Stat mini-cards -->
                            <div class="grid grid-cols-2 gap-3">
                                <div class="bg-slate-800/60 rounded-xl p-3.5 border border-slate-700/40">
                                    <span class="material-symbols-outlined text-sky-400 text-xl mb-1">speed</span>
                                    <p class="text-[11px] text-slate-400">Latencia API Backend</p>
                                    <p class="text-lg font-bold text-white font-mono">18ms <span class="text-[10px] text-emerald-400 font-normal">↓ óptimo</span></p>
                                </div>
                                <div class="bg-slate-800/60 rounded-xl p-3.5 border border-slate-700/40">
                                    <span class="material-symbols-outlined text-emerald-400 text-xl mb-1">verified_user</span>
                                    <p class="text-[11px] text-slate-400">Pipeline CI/CD</p>
                                    <p class="text-lg font-bold text-white font-mono">Pass <span class="text-[10px] text-emerald-400 font-normal">100% tests</span></p>
                                </div>
                            </div>

                            <!-- Portal Floating Pill -->
                            <div class="bg-primary/20 border border-primary/40 rounded-xl p-3 flex items-center justify-between">
                                <div class="flex items-center gap-2.5">
                                    <span class="material-symbols-outlined text-sky-400 text-lg">portal</span>
                                    <span class="text-xs font-semibold text-sky-200">Portal Clientes Syrax</span>
                                </div>
                                <a href="Vista/Index/Login.aspx" class="text-xs font-bold text-white bg-primary hover:bg-accent px-3 py-1.5 rounded-lg transition-colors">Ingresar →
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Social Proof & Impact Strip -->
    <section class="bg-white border-y border-slate-200 py-12 shadow-sm">
        <div class="max-w-7xl mx-auto px-4 sm:px-8">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center divide-y md:divide-y-0 md:divide-x divide-slate-100">
                <div class="pt-4 md:pt-0">
                    <p class="font-display text-3xl sm:text-4xl font-extrabold text-primary">+50</p>
                    <p class="text-sm font-semibold text-slate-800 mt-1">Proyectos Desplegados</p>
                    <p class="text-xs text-slate-500">SaaS, Cloud y Portales Web</p>
                </div>
                <div class="pt-4 md:pt-0">
                    <p class="font-display text-3xl sm:text-4xl font-extrabold text-primary">99.98%</p>
                    <p class="text-sm font-semibold text-slate-800 mt-1">Disponibilidad en la Nube</p>
                    <p class="text-xs text-slate-500">AWS, Azure &amp; Kubernetes</p>
                </div>
                <div class="pt-4 md:pt-0">
                    <p class="font-display text-3xl sm:text-4xl font-extrabold text-primary">+30</p>
                    <p class="text-sm font-semibold text-slate-800 mt-1">Empresas Aliadas</p>
                    <p class="text-xs text-slate-500">En Bogotá D.C. y Colombia</p>
                </div>
                <div class="pt-4 md:pt-0">
                    <p class="font-display text-3xl sm:text-4xl font-extrabold text-primary">&lt; 15 min</p>
                    <p class="text-sm font-semibold text-slate-800 mt-1">Tiempo de Respuesta</p>
                    <p class="text-xs text-slate-500">Soporte técnico preferencial</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Services Grid -->
    <section class="py-24 bg-surface">
        <div class="max-w-7xl mx-auto px-4 sm:px-8">
            <div class="text-center max-w-3xl mx-auto mb-16 space-y-3">
                <span class="text-xs font-bold uppercase tracking-widest text-primary">Nuestros Servicios de Excelencia</span>
                <h2 class="font-display text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">Soluciones tecnológicas diseñadas para escalar tu negocio
                </h2>
                <p class="text-base text-slate-600">
                    Acompañamos todo el ciclo de vida del software, desde la conceptualización de arquitecturas hasta el soporte preventivo 24/7.
               
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

                <!-- Service Card 1 -->
                <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                    <div class="space-y-4">
                        <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                            <span class="material-symbols-outlined text-3xl">code_blocks</span>
                        </div>
                        <h3 class="font-display text-xl font-bold text-slate-900">Desarrollo Web &amp; Plataformas SaaS</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">
                            Construcción de portales corporativos, software de autogestión B2B/B2C, APIs RESTful y arquitecturas modulares de alto desempeño.
                       
                        </p>
                        <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> ASP.NET Core &amp; Framework</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> React / Vue / Tailwind CSS</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Integración pasarelas PSE y tarjetas</li>
                        </ul>
                    </div>
                    <div class="pt-6 mt-6 border-t border-slate-100">
                        <a href="Vista/Index/servicios.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">Conocer detalles <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <!-- Service Card 2 (Featured) -->
                <div class="bg-white rounded-3xl p-8 border-2 border-primary shadow-glow hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative">
                    <div class="absolute -top-3.5 right-6 bg-gradient-to-r from-primary to-accent text-white text-[11px] font-bold uppercase tracking-wider px-3.5 py-1 rounded-full shadow-sm">
                        Especialidad Core
                   
                    </div>
                    <div class="space-y-4">
                        <div class="w-14 h-14 rounded-2xl bg-primary text-white flex items-center justify-center">
                            <span class="material-symbols-outlined text-3xl">cloud_sync</span>
                        </div>
                        <h3 class="font-display text-xl font-bold text-slate-900">Arquitectura &amp; Modernización Cloud</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">
                            Migración integral de servidores locales a AWS y Azure. Implementación de microservicios, Kubernetes (EKS/AKS) y optimización de costos.
                       
                        </p>
                        <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Clústeres Kubernetes 1.30</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Redes VPC, VPN y TLS automatizado</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Reducción hasta 40% en facturación cloud</li>
                        </ul>
                    </div>
                    <div class="pt-6 mt-6 border-t border-slate-100">
                        <a href="Vista/Index/servicios.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 hover:gap-2 transition-all">Conocer detalles <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <!-- Service Card 3 -->
                <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                    <div class="space-y-4">
                        <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                            <span class="material-symbols-outlined text-3xl">security</span>
                        </div>
                        <h3 class="font-display text-xl font-bold text-slate-900">Ciberseguridad &amp; Soporte 24/7</h3>
                        <p class="text-sm text-slate-600 leading-relaxed">
                            Monitoreo preventivo continuo, planes de respuesta ante desastres, auditoría de vulnerabilidades y mesa de ayuda con trazabilidad de tickets.
                       
                        </p>
                        <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Monitoreo en tiempo real Prometheus / Grafana</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Backups automáticos y geo-redundantes</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Atención dedicada según SLA empresarial</li>
                        </ul>
                    </div>
                    <div class="pt-6 mt-6 border-t border-slate-100">
                        <a href="Vista/Index/servicios.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">Conocer detalles <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Pricing / Subscription Plans Preview -->
    <section class="py-24 bg-white border-t border-slate-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-8">
            <div class="text-center max-w-3xl mx-auto mb-16 space-y-3">
                <span class="text-xs font-bold uppercase tracking-widest text-primary">Planes Corporativos Syrax</span>
                <h2 class="font-display text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight">Planes transparentes adaptados a cada etapa
                </h2>
                <p class="text-base text-slate-600">
                    Invierte con certeza en tecnología de alta rentabilidad con entregables verificables en nuestro portal de clientes.
               
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 items-stretch">

                <!-- Plan 1 -->
                <div class="bg-surface rounded-3xl p-8 border border-slate-200 flex flex-col justify-between">
                    <div class="space-y-4">
                        <div class="text-xs font-bold uppercase tracking-wider text-slate-500">Mantenimiento &amp; Infraestructura</div>
                        <h3 class="font-display text-xl font-bold text-slate-900">Soporte Premium 24/7</h3>
                        <p class="text-xs text-slate-500">Monitoreo proactivo, resolución de tickets de soporte y optimización mensual recurrente.</p>
                        <div class="pt-4 border-t border-slate-200">
                            <span class="text-3xl font-extrabold font-display text-slate-900">$1.500.000</span>
                            <span class="text-xs text-slate-500 font-medium">COP / mes</span>
                        </div>
                        <ul class="text-xs text-slate-600 space-y-3 pt-4">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Monitoreo 24/7 de servicios</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Hasta 10 tickets mensuales prioritarios</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Parches de seguridad y copias de seguridad</li>
                        </ul>
                    </div>
                    <div class="pt-8 mt-6">
                        <a href="Vista/Index/Contacto.aspx" class="w-full inline-flex items-center justify-center font-semibold text-sm py-3 rounded-full bg-white text-slate-800 border border-slate-300 hover:border-primary hover:text-primary transition-all shadow-sm">Contratar Plan
                        </a>
                    </div>
                </div>

                <!-- Plan 2 (Popular) -->
                <div class="bg-slate-900 text-white rounded-3xl p-8 border-2 border-accent shadow-glow flex flex-col justify-between relative transform lg:-translate-y-2">
                    <div class="absolute -top-3.5 left-1/2 -translate-x-1/2 bg-gradient-to-r from-accent to-sky-400 text-slate-950 text-[11px] font-extrabold uppercase tracking-wider px-4 py-1 rounded-full shadow-md">
                        Más Solicitado
                   
                    </div>
                    <div class="space-y-4">
                        <div class="text-xs font-bold uppercase tracking-wider text-sky-400">Desarrollo a la Medida</div>
                        <h3 class="font-display text-xl font-bold text-white">Plataforma Web / SaaS</h3>
                        <p class="text-xs text-slate-300">Diseño y construcción completa de portal web interactivo, backend y pasarela de recaudos.</p>
                        <div class="pt-4 border-t border-slate-800">
                            <span class="text-3xl font-extrabold font-display text-white">$6.800.000</span>
                            <span class="text-xs text-slate-400 font-medium">COP estimado</span>
                        </div>
                        <ul class="text-xs text-slate-300 space-y-3 pt-4">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sky-400 text-[18px]">check</span> Arquitectura escalable y base de datos SQL</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sky-400 text-[18px]">check</span> Panel de administración y portal de cliente</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sky-400 text-[18px]">check</span> Integración pagos PSE y facturación</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sky-400 text-[18px]">check</span> 90 días de garantía técnica post-entrega</li>
                        </ul>
                    </div>
                    <div class="pt-8 mt-6">
                        <a href="Vista/Index/Contacto.aspx" class="w-full inline-flex items-center justify-center font-bold text-sm py-3 rounded-full bg-gradient-to-r from-sky-400 to-primary text-white hover:opacity-95 shadow-md shadow-sky-500/20 transition-all">Comenzar Proyecto
                        </a>
                    </div>
                </div>

                <!-- Plan 3 -->
                <div class="bg-surface rounded-3xl p-8 border border-slate-200 flex flex-col justify-between">
                    <div class="space-y-4">
                        <div class="text-xs font-bold uppercase tracking-wider text-slate-500">Cloud &amp; DevOps</div>
                        <h3 class="font-display text-xl font-bold text-slate-900">Arquitectura Cloud AWS / Azure</h3>
                        <p class="text-xs text-slate-500">Migración integral, VPCs redundantes, clústeres Kubernetes y políticas de alta disponibilidad.</p>
                        <div class="pt-4 border-t border-slate-200">
                            <span class="text-3xl font-extrabold font-display text-slate-900">$4.500.000</span>
                            <span class="text-xs text-slate-500 font-medium">COP estimado</span>
                        </div>
                        <ul class="text-xs text-slate-600 space-y-3 pt-4">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Arquitectura multi-zona AWS o Azure</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Pipelines CI/CD automatizados</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-primary text-[18px]">check</span> Certificados TLS y Hardening de seguridad</li>
                        </ul>
                    </div>
                    <div class="pt-8 mt-6">
                        <a href="Vista/Index/Contacto.aspx" class="w-full inline-flex items-center justify-center font-semibold text-sm py-3 rounded-full bg-white text-slate-800 border border-slate-300 hover:border-primary hover:text-primary transition-all shadow-sm">Solicitar Cotización
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Why Syrax Pillars -->
    <section class="py-24 bg-surface">
        <div class="max-w-7xl mx-auto px-4 sm:px-8">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
                <div class="lg:col-span-5 space-y-6">
                    <span class="text-xs font-bold uppercase tracking-widest text-primary">Diferenciales Competitivos</span>
                    <h2 class="font-display text-3xl sm:text-4xl font-extrabold text-slate-900 tracking-tight leading-tight">¿Por qué las empresas líderes eligen a Syrax Solutions?
                    </h2>
                    <p class="text-slate-600 text-sm sm:text-base leading-relaxed">
                        No somos solo proveedores de código; somos tus aliados estratégicos en tecnología, ofreciendo transparencia absoluta en cada entrega y soporte directo sin intermediarios.
                   
                    </p>
                    <div class="pt-2">
                        <a href="Vista/Index/Nosotros.aspx" class="inline-flex items-center gap-2 text-primary font-bold text-sm hover:underline">Conoce nuestra historia y valores empresariales →
                        </a>
                    </div>
                </div>

                <div class="lg:col-span-7 grid grid-cols-1 sm:grid-cols-2 gap-6">
                    <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-3">
                        <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                            <span class="material-symbols-outlined">visibility</span>
                        </div>
                        <h4 class="font-display font-bold text-slate-900 text-base">Portal de Seguimiento 24/7</h4>
                        <p class="text-xs text-slate-500 leading-relaxed">Cada cliente cuenta con acceso privado a su panel para revisar entregables, evidencias técnicas y aprobar avances.</p>
                    </div>

                    <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-3">
                        <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                            <span class="material-symbols-outlined">rocket</span>
                        </div>
                        <h4 class="font-display font-bold text-slate-900 text-base">Metodología Ágil Real</h4>
                        <p class="text-xs text-slate-500 leading-relaxed">Entregas incrementales cada 15 días con demostraciones en vivo para validar que el producto cumpla tus expectativas.</p>
                    </div>

                    <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-3">
                        <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                            <span class="material-symbols-outlined">lock</span>
                        </div>
                        <h4 class="font-display font-bold text-slate-900 text-base">Propiedad Intelectual Total</h4>
                        <p class="text-xs text-slate-500 leading-relaxed">Código fuente 100% de tu empresa, sin licencias ocultas ni ataduras propietarias restrictivas.</p>
                    </div>

                    <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-3">
                        <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                            <span class="material-symbols-outlined">support_agent</span>
                        </div>
                        <h4 class="font-display font-bold text-slate-900 text-base">Soporte Técnico de Nivel 3</h4>
                        <p class="text-xs text-slate-500 leading-relaxed">Hablas directamente con arquitectos y desarrolladores senior encargados del sistema, no con chatbots genéricos.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Banner -->
    <section class="py-20 bg-slate-950 text-white relative overflow-hidden">
        <div class="absolute inset-0 bg-gradient-to-r from-primary/30 via-accent/20 to-transparent pointer-events-none"></div>
        <div class="max-w-5xl mx-auto px-4 sm:px-8 relative z-10 text-center space-y-6">
            <span class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-white/10 text-sky-300 border border-white/10 backdrop-blur-sm">Inicia Hoy Tu Proyecto
            </span>
            <h2 class="font-display text-3xl sm:text-5xl font-extrabold tracking-tight">¿Listo para modernizar la tecnología de tu empresa?
            </h2>
            <p class="text-slate-300 text-base sm:text-lg max-w-2xl mx-auto font-normal leading-relaxed">
                Agenda una sesión de consultoría técnica sin costo. Nuestro equipo de arquitectura evaluará tu requerimiento y te presentará una propuesta a medida.
           
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center pt-4">
                <a href="Vista/Index/Contacto.aspx" class="inline-flex items-center justify-center gap-2 bg-gradient-to-r from-primary to-accent hover:opacity-95 text-white font-bold text-base px-8 py-3.5 rounded-full shadow-lg shadow-sky-500/25 transition-all">
                    <span>Contactar con un Especialista</span>
                    <span class="material-symbols-outlined text-[20px]">send</span>
                </a>
                <a href="Vista/Index/Login.aspx" class="inline-flex items-center justify-center gap-2 bg-slate-800 hover:bg-slate-700 text-white font-semibold text-base px-8 py-3.5 rounded-full border border-slate-700 transition-all">
                    <span>Ingresar a Mi Portal</span>
                    <span class="material-symbols-outlined text-[20px]">login</span>
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white border-t border-slate-200 py-16 text-slate-600 font-sans text-sm">
        <div class="max-w-7xl mx-auto px-4 sm:px-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-10">

            <div class="lg:col-span-2 space-y-4">
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-xl bg-primary flex items-center justify-center text-white font-display font-bold text-lg">
                        S
                   
                    </div>
                    <span class="font-display text-lg font-bold text-slate-900">Syrax Solutions S.A.S.</span>
                </div>
                <p class="text-xs text-slate-500 leading-relaxed max-w-sm">
                    Soluciones tecnológicas empresariales de alto impacto, desarrollo de software a medida, arquitectura cloud y ciberseguridad en Colombia.
               
                </p>
                <div class="text-xs text-slate-500 space-y-1 pt-1">
                    <p>📍 Calle 100 # 15-20 Oficina 501, Bogotá D.C.</p>
                    <p>📞 +57 (601) 300-1234 | 📱 +57 300 123 4567</p>
                    <p>✉️ contacto@syraxsolutions.com</p>
                </div>
            </div>

            <div class="space-y-3">
                <h4 class="font-display text-xs font-bold uppercase tracking-wider text-slate-900">Navegación</h4>
                <ul class="text-xs space-y-2.5">
                    <li><a class="hover:text-primary transition-colors" href="index.aspx">Inicio</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">Servicios</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/Nosotros.aspx">Nosotros</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/Proyectos.aspx">Proyectos</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/Contacto.aspx">Contacto</a></li>
                </ul>
            </div>

            <div class="space-y-3">
                <h4 class="font-display text-xs font-bold uppercase tracking-wider text-slate-900">Servicios</h4>
                <ul class="text-xs space-y-2.5">
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">Desarrollo Web &amp; SaaS</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">Arquitectura Cloud AWS / Azure</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">DevOps &amp; Clústeres Kubernetes</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/servicios.aspx">Soporte Técnico 24/7</a></li>
                </ul>
            </div>

            <div class="space-y-3">
                <h4 class="font-display text-xs font-bold uppercase tracking-wider text-slate-900">Acceso</h4>
                <ul class="text-xs space-y-2.5">
                    <li><a class="hover:text-primary font-semibold transition-colors flex items-center gap-1.5" href="Vista/Index/Login.aspx">
                        <span class="material-symbols-outlined text-[16px] text-primary">lock</span> Portal de Clientes
                    </a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/Registro.aspx">Registro de Usuario</a></li>
                    <li><a class="hover:text-primary transition-colors" href="Vista/Index/Contacto.aspx">Mesa de Ayuda</a></li>
                </ul>
            </div>

        </div>

        <div class="max-w-7xl mx-auto px-4 sm:px-8 pt-8 mt-10 border-t border-slate-200 flex flex-col sm:flex-row items-center justify-between text-xs text-slate-400 gap-4">
            <p>© 2026 Syrax Solutions S.A.S. Todos los derechos reservados. NIT 901.884.231-5.</p>
            <div class="flex items-center gap-6">
                <a href="#" class="hover:text-primary transition-colors">Términos del Servicio</a>
                <a href="#" class="hover:text-primary transition-colors">Privacidad y Tratamiento de Datos</a>
            </div>
        </div>
    </footer>

    <script>
        // Header shadow on scroll
        window.addEventListener('scroll', () => {
            const header = document.getElementById('main-header');
            if (window.scrollY > 20) {
                header.classList.add('shadow-md');
            } else {
                header.classList.remove('shadow-md');
            }
        });
    </script>
</body>
</html>
