using System;
using System.Collections.Generic;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Logica
{
    public class UsuarioLogica
    {
        private readonly UsuarioDatos _usuarioDatos = new UsuarioDatos();

        public Usuario IniciarSesion(string correo, string clave, out string mensajeError)
        {
            mensajeError = string.Empty;

            if (string.IsNullOrWhiteSpace(correo))
            {
                mensajeError = "Por favor ingrese su correo electrónico.";
                return null;
            }

            if (string.IsNullOrWhiteSpace(clave))
            {
                mensajeError = "Por favor ingrese su contraseña.";
                return null;
            }

            Usuario usuario = _usuarioDatos.IniciarSesion(correo, clave);
            if (usuario == null)
            {
                mensajeError = "Credenciales incorrectas. Verifique su correo o contraseña.";
            }

            return usuario;
        }

        public List<Usuario> ListarUsuarios(int? idRol = null)
        {
            return _usuarioDatos.ListarUsuarios(idRol);
        }

        public List<Usuario> ListarClientes()
        {
            return _usuarioDatos.ListarUsuarios(2); // 2 = Cliente
        }

        public List<Usuario> ListarColaboradores()
        {
            // Roles 1 = Admin, 3 = Desarrollador
            List<Usuario> usuarios = new List<Usuario>();
            usuarios.AddRange(_usuarioDatos.ListarUsuarios(1));
            usuarios.AddRange(_usuarioDatos.ListarUsuarios(3));
            return usuarios;
        }

        public bool RegistrarUsuario(Usuario u, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrWhiteSpace(u.Nombres) || string.IsNullOrWhiteSpace(u.Apellidos))
            {
                mensaje = "Los nombres y apellidos son requeridos.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(u.Correo))
            {
                mensaje = "El correo electrónico es requerido.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(u.Clave))
            {
                mensaje = "La contraseña es requerida.";
                return false;
            }

            try
            {
                bool resultado = _usuarioDatos.RegistrarUsuario(u);
                if (!resultado)
                {
                    mensaje = "No se pudo registrar el usuario. Verifique los datos.";
                }
                return resultado;
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("IX_Usuario") || ex.Message.ToLower().Contains("duplicate"))
                {
                    mensaje = "Ya existe un usuario registrado con este correo electrónico.";
                }
                else
                {
                    mensaje = "Error al registrar el usuario: " + ex.Message;
                }
                return false;
            }
        }

        public bool ModificarUsuario(Usuario u, out string mensaje)
        {
            mensaje = string.Empty;
            try
            {
                return _usuarioDatos.ModificarUsuario(u);
            }
            catch (Exception ex)
            {
                mensaje = "Error al actualizar usuario: " + ex.Message;
                return false;
            }
        }

        public bool EliminarUsuario(int id, out string mensaje)
        {
            mensaje = string.Empty;
            try
            {
                return _usuarioDatos.EliminarUsuario(id);
            }
            catch (Exception)
            {
                mensaje = "No se puede eliminar el usuario porque tiene registros asociados.";
                return false;
            }
        }
    }
}
