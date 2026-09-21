using System;
using System.Web.UI;

namespace AppSyraxSolutionsSAS.Vista.Cliente
{
    public partial class Soporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 2)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string nombre = Session["NombreCompleto"]?.ToString() ?? "Cliente";
                litNombreCliente.Text = nombre;
                litEmpresaCliente.Text = Session["EmpresaNombre"]?.ToString() ?? "Empresa";
                litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "C";
            }
        }

        protected void btnEnviarTicket_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            string asunto = txtAsunto.Text.Trim();
            string detalle = txtDetalle.Text.Trim();

            if (string.IsNullOrWhiteSpace(asunto) || string.IsNullOrWhiteSpace(detalle))
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text = "Por favor complete el asunto y el mensaje del ticket.";
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-error-container text-on-error-container border border-error/20";
                return;
            }

            pnlMensaje.Visible = true;
            lblMensaje.Text = "Ticket radicado con éxito. Un especialista de Syrax Solutions responderá a su solicitud a través de su correo corporativo.";
            pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";

            txtAsunto.Text = string.Empty;
            txtDetalle.Text = string.Empty;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }
    }
}
