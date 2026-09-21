using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Desarrollador
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private readonly ProyectoLogica _proyectoLogica = new ProyectoLogica();
        private readonly AvanceLogica _avanceLogica = new AvanceLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validar sesión de Desarrollador (RolId == 3)
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 3)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosPerfil();
                CargarMetricas();
                CargarProyectosDropdown();
                CargarHistorialAvances();
                txtFechaEntrega.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        private void CargarDatosPerfil()
        {
            string nombre = Session["NombreCompleto"]?.ToString() ?? "Desarrollador";
            litNombre.Text = nombre;
            litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "D";
            litFechaActual.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        private void CargarMetricas()
        {
            //var resumen = _avanceLogica.ObtenerResumenDev();
            //litTotalAvances.Text = resumen.totalAvances.ToString();
            //litProyectosActivos.Text = resumen.proyectosActivos.ToString();
        }

        private void CargarProyectosDropdown()
        {
            var proyectos = _proyectoLogica.ListarProyectos();
            ddlProyectos.Items.Clear();
            ddlProyectos.Items.Add(new ListItem("-- Seleccione el Proyecto --", "0"));

            foreach (var p in proyectos)
            {
                ddlProyectos.Items.Add(new ListItem($"{p.Titulo} ({p.NombreEmpresa ?? "Syrax"})", p.Id.ToString()));
            }
        }

        private void CargarHistorialAvances()
        {
            //var lista = _avanceLogica.ListarAvances();
            //rptAvances.DataSource = lista;
            //rptAvances.DataBind();
        }

        protected void btnGuardarAvance_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            int idProyecto = Convert.ToInt32(ddlProyectos.SelectedValue);
            string evidencia = txtEvidencia.Text.Trim();
            DateTime fechaEntrega;
            if (!DateTime.TryParse(txtFechaEntrega.Text, out fechaEntrega))
            {
                fechaEntrega = DateTime.Now;
            }
            string nuevoEstado = ddlEstadoProyecto.SelectedValue;

            string mensaje;
            bool exito = _avanceLogica.RegistrarAvance(idProyecto, evidencia, fechaEntrega, nuevoEstado, out mensaje);

            pnlMensaje.Visible = true;
            lblMensaje.Text = mensaje;

            if (exito)
            {
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";
                txtEvidencia.Text = string.Empty;
                ddlProyectos.SelectedIndex = 0;
                ddlEstadoProyecto.SelectedIndex = 0;

                CargarMetricas();
                CargarHistorialAvances();
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
