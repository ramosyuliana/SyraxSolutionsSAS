using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AppSyraxSolutionsSAS.Datos
{
    public static class Conexion
    {
        private static readonly string Cadena = ConfigurationManager.ConnectionStrings["CadenaConexionSyrax"]?.ConnectionString
            ?? @"Data Source=.\SQLEXPRESS;Initial Catalog=dbSyraxSolutionsSASLTDA;Integrated Security=True;";

        public static SqlConnection ObtenerConexion()
        {
            return new SqlConnection(Cadena);
        }
    }
}
