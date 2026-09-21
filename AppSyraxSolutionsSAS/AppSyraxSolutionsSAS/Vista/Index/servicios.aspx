<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servicios.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.servicios" %>

<!DOCTYPE html>
<html class="light scroll-smooth" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Servicios Corporativos - Syrax Solutions S.A.S.</title>
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
                <a class="text-primary border-b-2 border-primary pb-0.5" href="servicios.aspx">Servicios</a>
                <a class="hover:text-primary transition-colors" href="Nosotros.aspx">Nosotros</a>
                <a class="hover:text-primary transition-colors" href="Proyectos.aspx">Proyectos</a>
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

    <!-- Main Content -->
    <main class="flex-1 w-full max-w-7xl mx-auto px-4 sm:px-8 pt-32 pb-24 relative">
        <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>

        <!-- Header Section -->
        <div class="text-center max-w-3xl mx-auto mb-16 space-y-3 relative z-10">
            <div class="inline-flex items-center gap-2 px-3.5 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary border border-primary/20">
                <span class="material-symbols-outlined text-[16px]">widgets</span>
                <span>Portafolio de Soluciones Empresariales</span>
            </div>
            <h1 class="font-display text-3xl sm:text-5xl font-extrabold text-slate-900 tracking-tight">
                Ingeniería &amp; Transformación Cloud
            </h1>
            <p class="text-base text-slate-600 font-normal leading-relaxed">
                Diseñamos y ejecutamos estrategias de ingeniería de software a medida, arquitectura cloud segura en AWS y soporte técnico continuo para organizaciones en Colombia.
            </p>
        </div>

        <!-- Services Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 relative z-10 mb-16">
            
            <!-- Service 1 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                        <span class="material-symbols-outlined text-3xl">code_blocks</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">Desarrollo de Software &amp; SaaS</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Construcción de aplicaciones empresariales robustas, portales B2B, integración con APIs contables y pasarelas de pago seguras.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> .NET Core, C# y APIs RESTful</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Integración PSE, Wompi y Pasarelas</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Arquitectura limpia y escalable</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <!-- Service 2 (Featured) -->
            <div class="bg-white rounded-3xl p-8 border-2 border-primary shadow-glow hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative group">
                <div class="absolute -top-3.5 right-6 bg-gradient-to-r from-primary to-accent text-white text-[11px] font-bold uppercase tracking-wider px-3.5 py-1 rounded-full shadow-sm">
                    Núcleo Estratégico
                </div>
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-primary text-white flex items-center justify-center">
                        <span class="material-symbols-outlined text-3xl">cloud_sync</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">Arquitectura Cloud AWS / Azure</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Migración integral hacia la nube con arquitectura de alta disponibilidad, clústeres Kubernetes 1.30, VPCs privadas y optimización de costos.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Amazon EKS &amp; Azure Kubernetes (AKS)</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Redundancia multi-zona y failover automático</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Auditoría de facturación y finanzas cloud</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <!-- Service 3 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                        <span class="material-symbols-outlined text-3xl">support_agent</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">Soporte &amp; Continuidad 24/7</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Mesa de ayuda especializada con monitoreo proactivo en tiempo real, resolución de incidencias con SLAs garantizados y parches de seguridad.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Monitoreo Grafana / Prometheus</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Respaldos automáticos geo-redundantes</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Trazabilidad de tickets en portal</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <!-- Service 4 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                        <span class="material-symbols-outlined text-3xl">terminal</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">DevOps &amp; CI/CD Pipelines</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Automatización completa del ciclo de despliegue con GitHub Actions, GitLab CI y Docker para reducir los tiempos de salida a producción.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Despliegues automatizados cero caída (Zero-downtime)</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Contenerización Docker &amp; Helm Charts</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <!-- Service 5 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                        <span class="material-symbols-outlined text-3xl">security</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">Ciberseguridad &amp; Auditoría</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Análisis de vulnerabilidades estáticas y dinámicas, endurecimiento de servidores (hardening), certificados TLS y cifrado de datos.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Pruebas de penetración y escaneo OWASP</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Cumplimiento normativo y protección de datos</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <!-- Service 6 -->
            <div class="bg-white rounded-3xl p-8 border border-border-subtle shadow-card hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between group">
                <div class="space-y-4">
                    <div class="w-14 h-14 rounded-2xl bg-sky-50 text-primary flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                        <span class="material-symbols-outlined text-3xl">sync_saved_locally</span>
                    </div>
                    <h3 class="font-display text-xl font-bold text-slate-900">Modernización de Sistemas Legados</h3>
                    <p class="text-sm text-slate-600 leading-relaxed">
                        Refactorización y migración de sistemas antiguos hacia arquitecturas web modernas con bases de datos relacionales optimizadas.
                    </p>
                    <ul class="text-xs font-medium text-slate-500 space-y-2 pt-2">
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Migración de datos sin pérdida de integridad</li>
                        <li class="flex items-center gap-2"><span class="material-symbols-outlined text-emerald-500 text-[16px]">check_circle</span> Interfaces responsivas para móviles y escritorio</li>
                    </ul>
                </div>
                <div class="pt-6 mt-6 border-t border-slate-100">
                    <a href="Contacto.aspx" class="text-sm font-semibold text-primary inline-flex items-center gap-1 group-hover:gap-2 transition-all">
                        Solicitar propuesta <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                    </a>
                </div>
            </div>

        </div>

        <!-- CTA Banner -->
        <div class="bg-slate-950 text-white rounded-3xl p-8 sm:p-12 text-center relative overflow-hidden">
            <div class="absolute inset-0 bg-gradient-to-r from-primary/30 to-accent/20 pointer-events-none"></div>
            <div class="relative z-10 max-w-2xl mx-auto space-y-4">
                <h3 class="font-display text-2xl sm:text-3xl font-extrabold text-white">¿Listo para estructurar tu próximo proyecto?</h3>
                <p class="text-slate-300 text-sm sm:text-base leading-relaxed">
                    Nuestro equipo técnico evaluará tu arquitectura y te presentará un plan de trabajo con entregables claros y cronograma definido.
                </p>
                <div class="pt-2">
                    <a href="Contacto.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-primary to-accent hover:opacity-95 text-white font-bold text-sm px-8 py-3.5 rounded-full shadow-lg shadow-sky-500/25 transition-all">
                        <span>Hablar con un Especialista</span>
                        <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
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