using System;
using System.Collections.Generic;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Logica
{
    public class AvanceLogica
    {
        private readonly AvanceDatos _avanceDatos = new AvanceDatos();
        private readonly ProyectoDatos _proyectoDatos = new ProyectoDatos();

        public List<Avance> ListarAvances(int? idProyecto = null)
        {
            return _avanceDatos.ListarAvances(idProyecto);
        }

        public bool RegistrarAvance(int idProyecto, string evidencia, DateTime? fechaEntrega, string nuevoEstado, out string mensaje)
        {
            mensaje = string.Empty;

            if (idProyecto <= 0)
            {
                mensaje = "Debe seleccionar un proyecto válido.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(evidencia))
            {
                mensaje = "Por favor ingrese la descripción o evidencia del avance técnico.";
                return false;
            }

            Avance avance = new Avance
            {
                IdProyecto = idProyecto,
                Evidencia = evidencia.Trim(),
                FechaEntrega = fechaEntrega ?? DateTime.Now
            };

            bool registrado = _avanceDatos.RegistrarAvance(avance);
            if (registrado)
            {
                // Si el desarrollador seleccionó un nuevo estado, actualizar el proyecto
                if (!string.IsNullOrEmpty(nuevoEstado))
                {
                    _proyectoDatos.ActualizarEstado(idProyecto, nuevoEstado);
                }
                mensaje = "Avance registrado exitosamente.";
                return true;
            }
            else
            {
                mensaje = "No se pudo guardar el avance. Intente nuevamente.";
                return false;
            }
        }

        public List<Observaciones> ListarObservacionesPorAvance(int idAvance)
        {
            return _avanceDatos.ListarObservacionesPorAvance(idAvance);
        }

        public bool AgregarObservacion(int idAvance, int? idUsuario, string descripcion, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrWhiteSpace(descripcion))
            {
                mensaje = "La observación no puede estar vacía.";
                return false;
            }

            Observaciones obs = new Observaciones
            {
                IdAvance = idAvance,
                IdUsuario = idUsuario,
                Descripcion = descripcion.Trim()
            };

            bool guardado = _avanceDatos.RegistrarObservacion(obs);
            if (guardado)
            {
                mensaje = "Observación agregada exitosamente.";
                return true;
            }
            else
            {
                mensaje = "No se pudo registrar la observación.";
                return false;
            }
        }

        public (int totalAvances, int proyectosActivos) ObtenerResumenDev()
        {
            int avances = _avanceDatos.ContarTotalAvances();
            int proyectos = _proyectoDatos.ContarProyectosActivos();
            return (avances, proyectos);
        }
    }
}
