using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Datos
{
    public class EmpresaDatos
    {
        public List<Empresa> ListarEmpresas()
        {
            List<Empresa> lista = new List<Empresa>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT Id, Nit, Nombre, Direccion, Telefono, Descripcion FROM [Empresa] ORDER BY Nombre";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Empresa
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                Nit = reader["Nit"].ToString(),
                                Nombre = reader["Nombre"].ToString(),
                                Direccion = reader["Direccion"].ToString(),
                                Telefono = reader["Telefono"].ToString(),
                                Descripcion = reader["Descripcion"].ToString()
                            });
                        }
                    }
                }
            }
            return lista;
        }

        public int RegistrarEmpresaRetornandoId(Empresa e)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    INSERT INTO [Empresa] (Nit, Nombre, Direccion, Telefono, Descripcion)
                    VALUES (@Nit, @Nombre, @Direccion, @Telefono, @Descripcion);
                    SELECT CAST(SCOPE_IDENTITY() AS INT);";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Nit", e.Nit);
                    cmd.Parameters.AddWithValue("@Nombre", e.Nombre);
                    cmd.Parameters.AddWithValue("@Direccion", (object)e.Direccion ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Telefono", (object)e.Telefono ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Descripcion", (object)e.Descripcion ?? DBNull.Value);

                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return result != null ? Convert.ToInt32(result) : 0;
                }
            }
        }

        public int ObtenerOCrearEmpresa(string nombre, string nit, string direccion, string telefono, string descripcion)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                conn.Open();
                string checkQuery = "SELECT TOP 1 Id FROM [Empresa] WHERE Nit = @Nit OR Nombre = @Nombre";
                using (SqlCommand cmdCheck = new SqlCommand(checkQuery, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@Nit", nit.Trim());
                    cmdCheck.Parameters.AddWithValue("@Nombre", nombre.Trim());
                    object existing = cmdCheck.ExecuteScalar();
                    if (existing != null && existing != DBNull.Value)
                    {
                        return Convert.ToInt32(existing);
                    }
                }

                string insertQuery = @"
                    INSERT INTO [Empresa] (Nit, Nombre, Direccion, Telefono, Descripcion)
                    VALUES (@Nit, @Nombre, @Direccion, @Telefono, @Descripcion);
                    SELECT CAST(SCOPE_IDENTITY() AS INT);";
                using (SqlCommand cmdInsert = new SqlCommand(insertQuery, conn))
                {
                    cmdInsert.Parameters.AddWithValue("@Nit", nit.Trim());
                    cmdInsert.Parameters.AddWithValue("@Nombre", nombre.Trim());
                    cmdInsert.Parameters.AddWithValue("@Direccion", (object)direccion ?? DBNull.Value);
                    cmdInsert.Parameters.AddWithValue("@Telefono", (object)telefono ?? DBNull.Value);
                    cmdInsert.Parameters.AddWithValue("@Descripcion", (object)descripcion ?? DBNull.Value);
                    return Convert.ToInt32(cmdInsert.ExecuteScalar());
                }
            }
        }
    }
}
