using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppSyraxSolutionsSAS.Vista.Index
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            string nombre = txtNombre.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string mensaje = txtMensaje.Text.Trim();

            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(mensaje))
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text = "Por favor complete todos los campos obligatorios (*).";
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-error-container text-on-error-container border border-error/20";
                return;
            }

            pnlMensaje.Visible = true;
            lblMensaje.Text = $"¡Gracias por contactarnos, {nombre}! Hemos recibido su solicitud y un consultor técnico se comunicará a {correo} a la mayor brevedad.";
            pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";

            txtNombre.Text = string.Empty;
            txtEmpresa.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            txtMensaje.Text = string.Empty;
        }
    }
}