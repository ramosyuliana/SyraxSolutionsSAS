using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Datos
{
    public class CatalogoDatos
    {
        public List<Rol> ListarRoles()
        {
            List<Rol> lista = new List<Rol>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT Id, Nombre FROM [Rol] ORDER BY Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Rol
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Nombre = reader["Nombre"].ToString()
                            });
                        }
                    }
                }
            }
            return lista;
        }

        public List<TipoDocumento> ListarTiposDocumento()
        {
            List<TipoDocumento> lista = new List<TipoDocumento>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT Id, Nombre FROM [TipoDocumento] ORDER BY Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new TipoDocumento
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Nombre = reader["Nombre"].ToString()
                            });
                        }
                    }
                }
            }
            return lista;
        }

        public List<Plan> ListarPlanes()
        {
            List<Plan> lista = new List<Plan>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT p.Id, p.Nombre, p.Descripcion, p.PrecioEstimado, p.DuracionEstimada, p.Estado, p.IdTipoPlan, tp.Nombre AS NombreTipoPlan
                    FROM [Plan] p
                    LEFT JOIN [TipoPlan] tp ON p.IdTipoPlan = tp.Id
                    ORDER BY p.Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Plan
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Nombre = reader["Nombre"].ToString(),
                                Descripcion = reader["Descripcion"].ToString(),
                                PrecioEstimado = reader["PrecioEstimado"] != DBNull.Value ? Convert.ToDecimal(reader["PrecioEstimado"]) : (decimal?)null,
                                DuracionEstimada = reader["DuracionEstimada"] != DBNull.Value ? Convert.ToInt32(reader["DuracionEstimada"]) : (int?)null,
                                Estado = reader["Estado"].ToString(),
                                IdTipoPlan = reader["IdTipoPlan"] != DBNull.Value ? Convert.ToInt32(reader["IdTipoPlan"]) : (int?)null,
                                NombreTipoPlan = reader["NombreTipoPlan"]?.ToString()
                            });
                        }
                    }
                }
            }
            return lista;
        }
    }
}
