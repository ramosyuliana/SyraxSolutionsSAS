using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private readonly ProyectoLogica _proyectoLogica = new ProyectoLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validar sesión de Administrador (RolId == 1)
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 1)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
                CargarMetricasYProyectos();
            }
        }

        private void CargarDatosUsuario()
        {
            string nombre = Session["NombreCompleto"]?.ToString() ?? "Administrador";
            litNombreUsuario.Text = nombre;
            litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "A";
        }

        private void CargarMetricasYProyectos()
        {
            var metricas = _proyectoLogica.ObtenerResumenMetricas();
            litTotalClientes.Text = metricas.clientes.ToString();
            litProyectosActivos.Text = metricas.proyectosActivos.ToString();
            litSolicitudesPendientes.Text = metricas.solicitudesPendientes.ToString();

            var proyectos = _proyectoLogica.ListarProyectos();
            rptProyectos.DataSource = proyectos;
            rptProyectos.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }
    }
}
