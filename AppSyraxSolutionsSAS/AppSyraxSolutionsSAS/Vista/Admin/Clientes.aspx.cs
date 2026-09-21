using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Logica;

namespace AppSyraxSolutionsSAS.Vista.Admin
{
    public partial class Clientes : System.Web.UI.Page
    {
        private readonly UsuarioLogica _usuarioLogica = new UsuarioLogica();

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

                CargarClientes();
            }
        }

        private void CargarClientes()
        {
            var clientes = _usuarioLogica.ListarClientes();
            rptClientes.DataSource = clientes;
            rptClientes.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }
    }
}
