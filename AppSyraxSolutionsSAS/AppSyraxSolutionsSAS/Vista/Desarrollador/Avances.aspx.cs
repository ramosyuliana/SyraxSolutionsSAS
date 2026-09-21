using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Desarrollador
{
    public partial class Avances : System.Web.UI.Page
    {
        private readonly ProyectoLogica _proyectoLogica = new ProyectoLogica();
        private readonly AvanceLogica _avanceLogica = new AvanceLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 3)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string nombre = Session["NombreCompleto"]?.ToString() ?? "Desarrollador";
                litNombre.Text = nombre;
                litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "D";
                txtFechaEntrega.Text = DateTime.Now.ToString("yyyy-MM-dd");

                CargarProyectos();

                if (!string.IsNullOrEmpty(Request.QueryString["proyectoId"]))
                {
                    string pId = Request.QueryString["proyectoId"];
                    if (ddlProyectos.Items.FindByValue(pId) != null)
                    {
                        ddlProyectos.SelectedValue = pId;
                    }
                }

                CargarAvances();
            }
        }

        private void CargarProyectos()
        {
            var proyectos = _proyectoLogica.ListarProyectos();
            ddlProyectos.Items.Clear();
            ddlProyectos.Items.Add(new ListItem("-- Seleccionar Proyecto --", "0"));
            foreach (var p in proyectos)
            {
                ddlProyectos.Items.Add(new ListItem($"{p.Titulo} ({p.NombreEmpresa})", p.Id.ToString()));
            }
        }

        private void CargarAvances()
        {
            rptAvances.DataSource = _avanceLogica.ListarAvances();
            rptAvances.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;
            int idProyecto = Convert.ToInt32(ddlProyectos.SelectedValue);
            string evidencia = txtEvidencia.Text.Trim();
            DateTime fecha;
            if (!DateTime.TryParse(txtFechaEntrega.Text, out fecha)) fecha = DateTime.Now;
            string estado = ddlEstadoProyecto.SelectedValue;

            string mensaje;
            bool ok = _avanceLogica.RegistrarAvance(idProyecto, evidencia, fecha, estado, out mensaje);

            pnlMensaje.Visible = true;
            lblMensaje.Text = mensaje;
            if (ok)
            {
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";
                txtEvidencia.Text = string.Empty;
                ddlProyectos.SelectedIndex = 0;
                CargarAvances();
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
