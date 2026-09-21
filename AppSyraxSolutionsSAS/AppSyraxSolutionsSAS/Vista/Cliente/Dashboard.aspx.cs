using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Cliente
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private readonly ProyectoLogica _proyectoLogica = new ProyectoLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validar sesión de Cliente (RolId == 2)
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 2)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosCliente();
                CargarProyectos();
            }
        }

        private void CargarDatosCliente()
        {
            string nombreCompleto = Session["NombreCompleto"]?.ToString() ?? "Cliente";
            litNombreCliente.Text = nombreCompleto;
            litEmpresaCliente.Text = Session["EmpresaNombre"]?.ToString() ?? "Empresa";
            litInicial.Text = !string.IsNullOrEmpty(nombreCompleto) ? nombreCompleto.Substring(0, 1).ToUpper() : "C";

            string[] partes = nombreCompleto.Split(' ');
            litPrimerNombre.Text = partes.Length > 0 ? partes[0] : nombreCompleto;
        }

        private void CargarProyectos()
        {
            int idUsuario = Convert.ToInt32(Session["UsuarioId"]);
            var proyectos = _proyectoLogica.ListarProyectos(idUsuario);
            rptMisProyectos.DataSource = proyectos;
            rptMisProyectos.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }
    }
}
