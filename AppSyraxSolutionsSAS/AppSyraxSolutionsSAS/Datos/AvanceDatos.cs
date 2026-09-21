using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Datos
{
    public class AvanceDatos
    {
        public List<Avance> ListarAvances(int? idProyecto = null)
        {
            List<Avance> lista = new List<Avance>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT a.Id, a.IdProyecto, a.Evidencia, a.FechaEntrega,
                           p.Titulo AS TituloProyecto
                    FROM [Avance] a
                    INNER JOIN [Proyecto] p ON a.IdProyecto = p.Id
                    WHERE (@IdProyecto IS NULL OR a.IdProyecto = @IdProyecto)
                    ORDER BY a.Id DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdProyecto", (object)idProyecto ?? DBNull.Value);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Avance
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                IdProyecto = reader["IdProyecto"] != DBNull.Value ? Convert.ToInt32(reader["IdProyecto"]) : (int?)null,
                                Evidencia = reader["Evidencia"].ToString(),
                                FechaEntrega = reader["FechaEntrega"] != DBNull.Value ? Convert.ToDateTime(reader["FechaEntrega"]) : (DateTime?)null,
                                TituloProyecto = reader["TituloProyecto"].ToString()
                            });
                        }
                    }
                }
            }

            foreach (var av in lista)
            {
                av.ListaObservaciones = ListarObservacionesPorAvance(av.Id);
            }

            return lista;
        }

        public bool RegistrarAvance(Avance avance)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    INSERT INTO [Avance] (IdProyecto, Evidencia, FechaEntrega)
                    VALUES (@IdProyecto, @Evidencia, @FechaEntrega)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdProyecto", avance.IdProyecto);
                    cmd.Parameters.AddWithValue("@Evidencia", avance.Evidencia);
                    cmd.Parameters.AddWithValue("@FechaEntrega", (object)avance.FechaEntrega ?? DateTime.Now);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public List<Observaciones> ListarObservacionesPorAvance(int idAvance)
        {
            List<Observaciones> lista = new List<Observaciones>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT o.Id, o.IdAvance, o.IdUsuario, o.Descripcion,
                           u.Nombres + ' ' + u.Apellidos AS NombreUsuario
                    FROM [Observaciones] o
                    LEFT JOIN [Usuario] u ON o.IdUsuario = u.Id
                    WHERE o.IdAvance = @IdAvance
                    ORDER BY o.Id ASC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdAvance", idAvance);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Observaciones
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                IdAvance = Convert.ToInt32(reader["IdAvance"]),
                                IdUsuario = reader["IdUsuario"] != DBNull.Value ? Convert.ToInt32(reader["IdUsuario"]) : (int?)null,
                                Descripcion = reader["Descripcion"].ToString(),
                                NombreUsuario = reader["NombreUsuario"]?.ToString() ?? "Usuario"
                            });
                        }
                    }
                }
            }
            return lista;
        }

        public bool RegistrarObservacion(Observaciones obs)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    INSERT INTO [Observaciones] (IdAvance, IdUsuario, Descripcion)
                    VALUES (@IdAvance, @IdUsuario, @Descripcion)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdAvance", obs.IdAvance);
                    cmd.Parameters.AddWithValue("@IdUsuario", (object)obs.IdUsuario ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Descripcion", obs.Descripcion);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public int ContarTotalAvances()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM [Avance]";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}
