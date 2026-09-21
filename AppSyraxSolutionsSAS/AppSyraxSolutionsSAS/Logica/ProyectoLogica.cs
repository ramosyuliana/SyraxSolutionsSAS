using System;
using System.Collections.Generic;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Logica
{
    public class ProyectoLogica
    {
        private readonly ProyectoDatos _proyectoDatos = new ProyectoDatos();

        public List<Proyecto> ListarProyectos(int? idUsuario = null)
        {
            return _proyectoDatos.ListarProyectos(idUsuario);
        }

        public (int clientes, int proyectosActivos, int solicitudesPendientes) ObtenerResumenMetricas()
        {
            int clientes = _proyectoDatos.ContarTotalClientes();
            int activos = _proyectoDatos.ContarProyectosActivos();
            int pendientes = _proyectoDatos.ContarSolicitudesPendientes();

            return (clientes, activos, pendientes);
        }
    }
}
