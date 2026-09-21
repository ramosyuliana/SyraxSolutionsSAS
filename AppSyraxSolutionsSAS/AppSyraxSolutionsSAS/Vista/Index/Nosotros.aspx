<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="AppSyraxSolutionsSAS.Vista.Index.Nosotros" %>

<!DOCTYPE html>
<html class="light scroll-smooth" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Nosotros - Syrax Solutions S.A.S.</title>
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
                <a class="text-primary border-b-2 border-primary pb-0.5" href="Nosotros.aspx">Nosotros</a>
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
    <main class="flex-1 w-full max-w-7xl mx-auto px-4 sm:px-8 pt-32 pb-24 relative space-y-20">
        <div class="absolute inset-0 hero-pattern z-0 pointer-events-none"></div>

        <!-- Hero Section -->
        <section class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center relative z-10">
            <div class="lg:col-span-7 space-y-6">
                <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary border border-primary/20">
                    <span class="material-symbols-outlined text-[16px]">corporate_fare</span>
                    <span>Quiénes Somos</span>
                </div>
                <h1 class="font-display text-4xl sm:text-5xl font-extrabold text-slate-900 tracking-tight leading-tight">
                    Pioneros en <br/><span class="bg-gradient-to-r from-primary to-accent bg-clip-text text-transparent">Excelencia Digital &amp; Cloud</span>
                </h1>
                <p class="text-base sm:text-lg text-slate-600 font-normal leading-relaxed max-w-2xl">
                    En Syrax Solutions S.A.S., transformamos la complejidad tecnológica en soluciones empresariales elegantes, seguras y altamente escalables. Acompañamos a PYMES y grandes empresas en Colombia en cada etapa de su modernización digital.
                </p>
                <div class="pt-2 flex items-center gap-4">
                    <a href="Contacto.aspx" class="inline-flex items-center gap-2 bg-primary hover:bg-primary-hover text-white font-semibold text-sm px-6 py-3 rounded-full shadow-md shadow-primary/25 transition-all">
                        <span>Trabajar con Nosotros</span>
                        <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                    </a>
                </div>
            </div>

            <div class="lg:col-span-5 relative">
                <div class="relative bg-slate-900 text-white rounded-3xl p-8 border border-slate-800 shadow-2xl space-y-6">
                    <div class="flex items-center justify-between border-b border-slate-800 pb-4">
                        <span class="text-xs font-mono text-slate-400">syrax::manifesto</span>
                        <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                    </div>
                    <blockquote class="text-sm font-medium italic text-slate-300 leading-relaxed">
                        "La tecnología no debe ser un costo incomprensible, sino el motor de rentabilidad más potente de una organización moderna."
                    </blockquote>
                    <div class="border-t border-slate-800 pt-4 flex items-center justify-between text-xs text-slate-400">
                        <span>Fundada en Bogotá D.C.</span>
                        <span class="text-sky-400 font-semibold">100% Capital Colombiano</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Misión y Visión -->
        <section class="grid grid-cols-1 md:grid-cols-2 gap-8 relative z-10">
            
            <div class="bg-white rounded-3xl p-8 sm:p-10 border border-border-subtle shadow-card hover:-translate-y-1 transition-transform space-y-4">
                <div class="w-12 h-12 rounded-2xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                    <span class="material-symbols-outlined text-2xl">rocket_launch</span>
                </div>
                <h2 class="font-display text-2xl font-bold text-slate-900">Nuestra Misión</h2>
                <p class="text-sm text-slate-600 leading-relaxed font-normal">
                    Proveer servicios de ingeniería de software premium, arquitectura cloud resiliente y ciberseguridad avanzada que empoderen a las organizaciones para alcanzar su máximo potencial operativo con transparencia absoluta y entregables verificables.
                </p>
            </div>

            <div class="bg-white rounded-3xl p-8 sm:p-10 border border-border-subtle shadow-card hover:-translate-y-1 transition-transform space-y-4">
                <div class="w-12 h-12 rounded-2xl bg-sky-50 text-secondary flex items-center justify-center font-bold">
                    <span class="material-symbols-outlined text-2xl">visibility</span>
                </div>
                <h2 class="font-display text-2xl font-bold text-slate-900">Nuestra Visión</h2>
                <p class="text-sm text-slate-600 leading-relaxed font-normal">
                    Consolidarnos como el referente más confiable en consultoría de transformación digital y cloud computing en la región, reconocidos por nuestra capacidad de unir metodologías ágiles rigurosas con la estabilidad de infraestructuras de misión crítica.
                </p>
            </div>

        </section>

        <!-- Valores Corporativos -->
        <section class="bg-white rounded-3xl p-8 sm:p-12 border border-border-subtle shadow-card relative z-10 space-y-8">
            <div class="text-center max-w-2xl mx-auto space-y-2">
                <span class="text-xs font-bold uppercase tracking-widest text-primary">Nuestros Principios</span>
                <h2 class="font-display text-2xl sm:text-3xl font-extrabold text-slate-900">Valores que guían cada línea de código</h2>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="space-y-2.5">
                    <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                        <span class="material-symbols-outlined text-xl">verified</span>
                    </div>
                    <h3 class="font-display font-bold text-base text-slate-900">Transparencia Radical</h3>
                    <p class="text-xs text-slate-500 leading-relaxed">El cliente tiene visibilidad total del progreso, métricas de calidad y costos sin sorpresas.</p>
                </div>

                <div class="space-y-2.5">
                    <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                        <span class="material-symbols-outlined text-xl">speed</span>
                    </div>
                    <h3 class="font-display font-bold text-base text-slate-900">Agilidad Operativa</h3>
                    <p class="text-xs text-slate-500 leading-relaxed">Sprints de 15 días con demostraciones funcionales continuas y ajuste rápido a prioridades de negocio.</p>
                </div>

                <div class="space-y-2.5">
                    <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                        <span class="material-symbols-outlined text-xl">shield</span>
                    </div>
                    <h3 class="font-display font-bold text-base text-slate-900">Seguridad por Diseño</h3>
                    <p class="text-xs text-slate-500 leading-relaxed">Ciberseguridad y buenas prácticas OWASP integradas desde el primer boceto arquitectónico.</p>
                </div>

                <div class="space-y-2.5">
                    <div class="w-10 h-10 rounded-xl bg-sky-50 text-primary flex items-center justify-center font-bold">
                        <span class="material-symbols-outlined text-xl">handshake</span>
                    </div>
                    <h3 class="font-display font-bold text-base text-slate-900">Compromiso a Largo Plazo</h3>
                    <p class="text-xs text-slate-500 leading-relaxed">No entregamos y nos vamos: acompañamos a tu equipo en la evolución y soporte continuo del sistema.</p>
                </div>
            </div>
        </section>

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