using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Datos
{
    public class ProyectoDatos
    {
        public List<Proyecto> ListarProyectos(int? idUsuario = null)
        {
            List<Proyecto> lista = new List<Proyecto>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT p.Id, p.Titulo, p.Descripcion, p.FechaCreacion, p.FechaEntrega, p.Estado, p.Precio, p.IdSuscripcion,
                           u.Nombres + ' ' + u.Apellidos AS NombreCliente, u.Correo AS CorreoCliente, e.Nombre AS NombreEmpresa
                    FROM [Proyecto] p
                    LEFT JOIN [Suscripcion] s ON p.IdSuscripcion = s.Id
                    LEFT JOIN [Usuario] u ON s.IdUsuario = u.Id
                    LEFT JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE (@IdUsuario IS NULL OR s.IdUsuario = @IdUsuario)
                    ORDER BY p.Id DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdUsuario", (object)idUsuario ?? DBNull.Value);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Proyecto
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Titulo = reader["Titulo"].ToString(),
                                Descripcion = reader["Descripcion"].ToString(),
                                FechaCreacion = reader["FechaCreacion"] != DBNull.Value ? Convert.ToDateTime(reader["FechaCreacion"]) : (DateTime?)null,
                                FechaEntrega = reader["FechaEntrega"] != DBNull.Value ? Convert.ToDateTime(reader["FechaEntrega"]) : (DateTime?)null,
                                Estado = reader["Estado"].ToString(),
                                Precio = reader["Precio"] != DBNull.Value ? Convert.ToDecimal(reader["Precio"]) : (decimal?)null,
                                IdSuscripcion = reader["IdSuscripcion"] != DBNull.Value ? Convert.ToInt32(reader["IdSuscripcion"]) : (int?)null,
                                NombreCliente = reader["NombreCliente"]?.ToString(),
                                CorreoCliente = reader["CorreoCliente"]?.ToString(),
                                NombreEmpresa = reader["NombreEmpresa"]?.ToString(),
                                PorcentajeAvance = reader["Estado"].ToString() == "Finalizado" ? 100 : 
                                                   reader["Estado"].ToString() == "En Desarrollo" ? 65 : 15
                            });
                        }
                    }
                }
            }
            return lista;
        }

        public int ContarTotalClientes()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM [Usuario] WHERE IdRol = 2";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int ContarProyectosActivos()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM [Proyecto] WHERE Estado <> 'Finalizado' AND Estado <> 'Cancelado'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public Proyecto ObtenerProyectoPorId(int id)
        {
            Proyecto proyecto = null;
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT p.Id, p.Titulo, p.Descripcion, p.FechaCreacion, p.FechaEntrega, p.Estado, p.Precio, p.IdSuscripcion,
                           u.Nombres + ' ' + u.Apellidos AS NombreCliente, u.Correo AS CorreoCliente, e.Nombre AS NombreEmpresa
                    FROM [Proyecto] p
                    LEFT JOIN [Suscripcion] s ON p.IdSuscripcion = s.Id
                    LEFT JOIN [Usuario] u ON s.IdUsuario = u.Id
                    LEFT JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE p.Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            proyecto = new Proyecto
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Titulo = reader["Titulo"].ToString(),
                                Descripcion = reader["Descripcion"].ToString(),
                                FechaCreacion = reader["FechaCreacion"] != DBNull.Value ? Convert.ToDateTime(reader["FechaCreacion"]) : (DateTime?)null,
                                FechaEntrega = reader["FechaEntrega"] != DBNull.Value ? Convert.ToDateTime(reader["FechaEntrega"]) : (DateTime?)null,
                                Estado = reader["Estado"].ToString(),
                                Precio = reader["Precio"] != DBNull.Value ? Convert.ToDecimal(reader["Precio"]) : (decimal?)null,
                                IdSuscripcion = reader["IdSuscripcion"] != DBNull.Value ? Convert.ToInt32(reader["IdSuscripcion"]) : (int?)null,
                                NombreCliente = reader["NombreCliente"]?.ToString(),
                                CorreoCliente = reader["CorreoCliente"]?.ToString(),
                                NombreEmpresa = reader["NombreEmpresa"]?.ToString(),
                                PorcentajeAvance = reader["Estado"].ToString() == "Finalizado" ? 100 : 
                                                   reader["Estado"].ToString() == "En Desarrollo" ? 65 : 15
                            };
                        }
                    }
                }
            }
            return proyecto;
        }

        public bool ActualizarEstado(int idProyecto, string nuevoEstado)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "UPDATE [Proyecto] SET Estado = @Estado WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Estado", nuevoEstado);
                    cmd.Parameters.AddWithValue("@Id", idProyecto);
                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool RegistrarProyecto(Proyecto p)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    INSERT INTO [Proyecto] (Titulo, Descripcion, FechaCreacion, FechaEntrega, Estado, Precio, IdSuscripcion)
                    VALUES (@Titulo, @Descripcion, @FechaCreacion, @FechaEntrega, @Estado, @Precio, @IdSuscripcion)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Titulo", p.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", p.Descripcion);
                    cmd.Parameters.AddWithValue("@FechaCreacion", (object)p.FechaCreacion ?? DateTime.Now);
                    cmd.Parameters.AddWithValue("@FechaEntrega", (object)p.FechaEntrega ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Estado", string.IsNullOrEmpty(p.Estado) ? "Pendiente" : p.Estado);
                    cmd.Parameters.AddWithValue("@Precio", (object)p.Precio ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@IdSuscripcion", (object)p.IdSuscripcion ?? DBNull.Value);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public int ObtenerOCrearSuscripcionPorUsuario(int idUsuario)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                conn.Open();
                string querySelect = "SELECT TOP 1 Id FROM [Suscripcion] WHERE IdUsuario = @IdUsuario ORDER BY Id DESC";
                using (SqlCommand cmd = new SqlCommand(querySelect, conn))
                {
                    cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToInt32(result);
                    }
                }

                // Si no tiene, crear una vinculada al Plan 1
                string queryInsert = "INSERT INTO [Suscripcion] (IdUsuario, IdPlan) VALUES (@IdUsuario, 1); SELECT SCOPE_IDENTITY();";
                using (SqlCommand cmd = new SqlCommand(queryInsert, conn))
                {
                    cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int ContarSolicitudesPendientes()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM [Proyecto] WHERE Estado = 'Pendiente'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}
