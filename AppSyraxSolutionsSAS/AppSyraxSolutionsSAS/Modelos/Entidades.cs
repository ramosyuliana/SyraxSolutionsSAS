using System;
using System.Collections.Generic;

namespace AppSyraxSolutionsSAS.Modelos
{
    public class Rol
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
    }

    public class TipoDocumento
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
    }

    public class Empresa
    {
        public int Id { get; set; }
        public string Nit { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Descripcion { get; set; }
    }

    public class Usuario
    {
        public int Id { get; set; }
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Clave { get; set; }
        public int IdEmpresa { get; set; }
        public int IdTipoDocumento { get; set; }
        public int IdRol { get; set; }

        // Propiedades de navegación / visualización
        public string NombreEmpresa { get; set; }
        public string NombreTipoDocumento { get; set; }
        public string NombreRol { get; set; }

        public string NombreCompleto
        {
            get { return $"{Nombres} {Apellidos}".Trim(); }
        }
    }

    public class TipoPlan
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
    }

    public class Plan
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal? PrecioEstimado { get; set; }
        public int? DuracionEstimada { get; set; }
        public string Estado { get; set; }
        public int? IdTipoPlan { get; set; }
        public string NombreTipoPlan { get; set; }
    }

    public class Suscripcion
    {
        public int Id { get; set; }
        public int? IdUsuario { get; set; }
        public int? IdPlan { get; set; }

        public string NombreUsuario { get; set; }
        public string NombrePlan { get; set; }
    }

    public class MetodoPago
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
    }

    public class Historial
    {
        public int Id { get; set; }
        public int? IdSuscripcion { get; set; }
        public int? IdMetodoPago { get; set; }
        public decimal? Valor { get; set; }
        public DateTime? FechaPago { get; set; }
        public string Estado { get; set; }

        public string NombreMetodoPago { get; set; }
    }

    public class Proyecto
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaEntrega { get; set; }
        public string Estado { get; set; }
        public decimal? Precio { get; set; }
        public int? IdSuscripcion { get; set; }

        // Propiedades auxiliares
        public string NombreCliente { get; set; }
        public string NombreEmpresa { get; set; }
        public string CorreoCliente { get; set; }
        public int PorcentajeAvance { get; set; }
        public List<Avance> ListaAvances { get; set; } = new List<Avance>();
    }

    public class Avance
    {
        public int Id { get; set; }
        public int? IdProyecto { get; set; }
        public string Evidencia { get; set; }
        public DateTime? FechaEntrega { get; set; }
        public string TituloProyecto { get; set; }
        public List<Observaciones> ListaObservaciones { get; set; } = new List<Observaciones>();
    }

    public class Observaciones
    {
        public int Id { get; set; }
        public int? IdAvance { get; set; }
        public int? IdUsuario { get; set; }
        public string Descripcion { get; set; }

        public string NombreUsuario { get; set; }
    }

    public class Notificaciones
    {
        public int Id { get; set; }
        public int? IdProyecto { get; set; }
        public int? IdCliente { get; set; }
        public string Titulo { get; set; }
        public string Mensaje { get; set; }
        public DateTime? FechaEnvio { get; set; }
        public string Canal { get; set; }

        public string TituloProyecto { get; set; }
        public string NombreCliente { get; set; }
    }
}
