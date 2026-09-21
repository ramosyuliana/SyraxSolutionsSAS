using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Admin
{
    public partial class Trabajadores : System.Web.UI.Page
    {
        private readonly UsuarioLogica _usuarioLogica = new UsuarioLogica();
        private readonly CatalogoLogica _catalogoLogica = new CatalogoLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 1)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string nombre = Session["NombreCompleto"]?.ToString() ?? "Administrador";
                litNombreUsuario.Text = nombre;
                litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "A";

                CargarCatalogos();
                CargarColaboradores();
            }
        }

        private void CargarCatalogos()
        {
            ddlTipoDocumento.DataSource = _catalogoLogica.ListarTiposDocumento();
            ddlTipoDocumento.DataTextField = "Nombre";
            ddlTipoDocumento.DataValueField = "Id";
            ddlTipoDocumento.DataBind();

            ddlEmpresa.DataSource = _catalogoLogica.ListarEmpresas();
            ddlEmpresa.DataTextField = "Nombre";
            ddlEmpresa.DataValueField = "Id";
            ddlEmpresa.DataBind();
        }

        private void CargarColaboradores()
        {
            var colaboradores = _usuarioLogica.ListarColaboradores();
            rptTrabajadores.DataSource = colaboradores;
            rptTrabajadores.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            Usuario nuevo = new Usuario
            {
                NumeroDocumento = txtNumeroDocumento.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                Apellidos = txtApellidos.Text.Trim(),
                Correo = txtCorreo.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Clave = txtClave.Text.Trim(),
                IdTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedValue),
                IdEmpresa = Convert.ToInt32(ddlEmpresa.SelectedValue),
                IdRol = Convert.ToInt32(ddlRol.SelectedValue)
            };

            string mensaje;
            bool ok = _usuarioLogica.RegistrarUsuario(nuevo, out mensaje);

            pnlMensaje.Visible = true;
            lblMensaje.Text = mensaje;

            if (ok)
            {
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";
                txtNumeroDocumento.Text = string.Empty;
                txtNombres.Text = string.Empty;
                txtApellidos.Text = string.Empty;
                txtCorreo.Text = string.Empty;
                txtTelefono.Text = string.Empty;
                txtDireccion.Text = string.Empty;
                txtClave.Text = string.Empty;

                CargarColaboradores();
            }
            else
            {
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-error-container text-on-error-container border border-error/20";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }
    }
}
