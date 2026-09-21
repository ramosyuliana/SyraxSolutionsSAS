using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Datos
{
    public class UsuarioDatos
    {
        public Usuario IniciarSesion(string correo, string clave)
        {
            Usuario usuario = null;
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT u.Id, u.NumeroDocumento, u.Nombres, u.Apellidos, u.Correo, u.Telefono, 
                           u.Direccion, u.Clave, u.IdEmpresa, u.IdTipoDocumento, u.IdRol,
                           e.Nombre AS NombreEmpresa, td.Nombre AS NombreTipoDocumento, r.Nombre AS NombreRol
                    FROM [Usuario] u
                    INNER JOIN [Rol] r ON u.IdRol = r.Id
                    INNER JOIN [TipoDocumento] td ON u.IdTipoDocumento = td.Id
                    INNER JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE u.Correo = @Correo AND u.Clave = @Clave";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Correo", correo.Trim());
                    cmd.Parameters.AddWithValue("@Clave", clave.Trim());

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            usuario = MapearUsuario(reader);
                        }
                    }
                }
            }
            return usuario;
        }

        public List<Usuario> ListarUsuarios(int? idRol = null)
        {
            List<Usuario> lista = new List<Usuario>();
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT u.Id, u.NumeroDocumento, u.Nombres, u.Apellidos, u.Correo, u.Telefono, 
                           u.Direccion, u.Clave, u.IdEmpresa, u.IdTipoDocumento, u.IdRol,
                           e.Nombre AS NombreEmpresa, td.Nombre AS NombreTipoDocumento, r.Nombre AS NombreRol
                    FROM [Usuario] u
                    INNER JOIN [Rol] r ON u.IdRol = r.Id
                    INNER JOIN [TipoDocumento] td ON u.IdTipoDocumento = td.Id
                    INNER JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE (@IdRol IS NULL OR u.IdRol = @IdRol)
                    ORDER BY u.Id DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@IdRol", (object)idRol ?? DBNull.Value);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(MapearUsuario(reader));
                        }
                    }
                }
            }
            return lista;
        }

        public Usuario ObtenerPorId(int id)
        {
            Usuario usuario = null;
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT u.Id, u.NumeroDocumento, u.Nombres, u.Apellidos, u.Correo, u.Telefono, 
                           u.Direccion, u.Clave, u.IdEmpresa, u.IdTipoDocumento, u.IdRol,
                           e.Nombre AS NombreEmpresa, td.Nombre AS NombreTipoDocumento, r.Nombre AS NombreRol
                    FROM [Usuario] u
                    INNER JOIN [Rol] r ON u.IdRol = r.Id
                    INNER JOIN [TipoDocumento] td ON u.IdTipoDocumento = td.Id
                    INNER JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE u.Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            usuario = MapearUsuario(reader);
                        }
                    }
                }
            }
            return usuario;
        }

        public Usuario ObtenerPorCorreo(string correo)
        {
            Usuario usuario = null;
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT u.Id, u.NumeroDocumento, u.Nombres, u.Apellidos, u.Correo, u.Telefono, 
                           u.Direccion, u.Clave, u.IdEmpresa, u.IdTipoDocumento, u.IdRol,
                           e.Nombre AS NombreEmpresa, td.Nombre AS NombreTipoDocumento, r.Nombre AS NombreRol
                    FROM [Usuario] u
                    INNER JOIN [Rol] r ON u.IdRol = r.Id
                    INNER JOIN [TipoDocumento] td ON u.IdTipoDocumento = td.Id
                    INNER JOIN [Empresa] e ON u.IdEmpresa = e.Id
                    WHERE LOWER(LTRIM(RTRIM(u.Correo))) = LOWER(LTRIM(RTRIM(@Correo)))";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Correo", correo.Trim());

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            usuario = MapearUsuario(reader);
                        }
                    }
                }
            }
            return usuario;
        }

        public bool RegistrarUsuario(Usuario u)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    INSERT INTO [Usuario] 
                    (NumeroDocumento, Nombres, Apellidos, Correo, Telefono, Direccion, Clave, IdEmpresa, IdTipoDocumento, IdRol)
                    VALUES 
                    (@NumeroDocumento, @Nombres, @Apellidos, @Correo, @Telefono, @Direccion, @Clave, @IdEmpresa, @IdTipoDocumento, @IdRol)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@NumeroDocumento", u.NumeroDocumento);
                    cmd.Parameters.AddWithValue("@Nombres", u.Nombres);
                    cmd.Parameters.AddWithValue("@Apellidos", u.Apellidos);
                    cmd.Parameters.AddWithValue("@Correo", u.Correo.Trim());
                    cmd.Parameters.AddWithValue("@Telefono", u.Telefono);
                    cmd.Parameters.AddWithValue("@Direccion", u.Direccion);
                    cmd.Parameters.AddWithValue("@Clave", u.Clave);
                    cmd.Parameters.AddWithValue("@IdEmpresa", u.IdEmpresa);
                    cmd.Parameters.AddWithValue("@IdTipoDocumento", u.IdTipoDocumento);
                    cmd.Parameters.AddWithValue("@IdRol", u.IdRol);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool ModificarUsuario(Usuario u)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                    UPDATE [Usuario] SET 
                        NumeroDocumento = @NumeroDocumento,
                        Nombres = @Nombres,
                        Apellidos = @Apellidos,
                        Correo = @Correo,
                        Telefono = @Telefono,
                        Direccion = @Direccion,
                        Clave = CASE WHEN @Clave IS NOT NULL AND @Clave <> '' THEN @Clave ELSE Clave END,
                        IdEmpresa = @IdEmpresa,
                        IdTipoDocumento = @IdTipoDocumento,
                        IdRol = @IdRol
                    WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", u.Id);
                    cmd.Parameters.AddWithValue("@NumeroDocumento", u.NumeroDocumento);
                    cmd.Parameters.AddWithValue("@Nombres", u.Nombres);
                    cmd.Parameters.AddWithValue("@Apellidos", u.Apellidos);
                    cmd.Parameters.AddWithValue("@Correo", u.Correo.Trim());
                    cmd.Parameters.AddWithValue("@Telefono", u.Telefono);
                    cmd.Parameters.AddWithValue("@Direccion", u.Direccion);
                    cmd.Parameters.AddWithValue("@Clave", (object)u.Clave ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@IdEmpresa", u.IdEmpresa);
                    cmd.Parameters.AddWithValue("@IdTipoDocumento", u.IdTipoDocumento);
                    cmd.Parameters.AddWithValue("@IdRol", u.IdRol);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool ExisteCorreo(string correo)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(1) FROM [Usuario] WHERE LOWER(LTRIM(RTRIM(Correo))) = LOWER(LTRIM(RTRIM(@Correo)))";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Correo", correo.Trim());
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                }
            }
        }

        public bool ExisteDocumento(string doc)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(1) FROM [Usuario] WHERE LTRIM(RTRIM(NumeroDocumento)) = LTRIM(RTRIM(@Doc))";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Doc", doc.Trim());
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                }
            }
        }

        public bool EliminarUsuario(int id)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "DELETE FROM [Usuario] WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        private Usuario MapearUsuario(SqlDataReader reader)
        {
            return new Usuario
            {
                Id = Convert.ToInt32(reader["Id"]),
                NumeroDocumento = reader["NumeroDocumento"].ToString(),
                Nombres = reader["Nombres"].ToString(),
                Apellidos = reader["Apellidos"].ToString(),
                Correo = reader["Correo"].ToString(),
                Telefono = reader["Telefono"].ToString(),
                Direccion = reader["Direccion"].ToString(),
                Clave = reader["Clave"].ToString(),
                IdEmpresa = Convert.ToInt32(reader["IdEmpresa"]),
                IdTipoDocumento = Convert.ToInt32(reader["IdTipoDocumento"]),
                IdRol = Convert.ToInt32(reader["IdRol"]),
                NombreEmpresa = reader["NombreEmpresa"].ToString(),
                NombreTipoDocumento = reader["NombreTipoDocumento"].ToString(),
                NombreRol = reader["NombreRol"].ToString()
            };
        }
    }
}
