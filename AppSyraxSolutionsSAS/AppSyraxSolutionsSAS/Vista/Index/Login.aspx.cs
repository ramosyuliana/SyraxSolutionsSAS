using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Index
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly UsuarioLogica _usuarioLogica = new UsuarioLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Si ya está autenticado, redirigir según su rol
                if (Session["Usuario"] != null && Session["RolId"] != null)
                {
                    RedirigirSegunRol(Convert.ToInt32(Session["RolId"]));
                    return;
                }

                if (Request.QueryString["registro"] == "exito")
                {
                    lblMensaje.Text = "¡Cuenta corporativa creada con éxito! Ingrese sus credenciales para acceder a su portal.";
                    pnlAlerta.CssClass = "p-4 rounded-xl flex items-center gap-3 text-sm bg-emerald-50 text-emerald-800 border border-emerald-200";
                    pnlAlerta.Visible = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            pnlAlerta.Visible = false;
            string correo = txtCorreo.Text.Trim();
            string clave = txtClave.Text.Trim();

            string mensajeError;
            Usuario usuario = _usuarioLogica.IniciarSesion(correo, clave, out mensajeError);

            if (usuario != null)
            {
                // Guardar en sesión
                Session["Usuario"] = usuario;
                Session["UsuarioId"] = usuario.Id;
                Session["RolId"] = usuario.IdRol;
                Session["RolNombre"] = usuario.NombreRol;
                Session["NombreCompleto"] = usuario.NombreCompleto;
                Session["EmpresaNombre"] = usuario.NombreEmpresa;

                RedirigirSegunRol(usuario.IdRol);
            }
            else
            {
                lblMensaje.Text = mensajeError;
                pnlAlerta.Visible = true;
            }
        }

        private void RedirigirSegunRol(int idRol)
        {
            switch (idRol)
            {
                case 1: // Administrador
                    Response.Redirect("~/Vista/Admin/Dashboard.aspx");
                    break;
                case 2: // Cliente
                    Response.Redirect("~/Vista/Cliente/Dashboard.aspx");
                    break;
                case 3: // Desarrollador
                    Response.Redirect("~/Vista/Desarrollador/Dashboard.aspx");
                    break;
                default:
                    Response.Redirect("~/index.aspx");
                    break;
            }
        }
    }
}