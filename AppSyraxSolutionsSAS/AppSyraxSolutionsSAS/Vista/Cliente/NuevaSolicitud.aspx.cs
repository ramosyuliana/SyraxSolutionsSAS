using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Cliente
{
    public partial class NuevaSolicitud : System.Web.UI.Page
    {
        private readonly ProyectoDatos _proyectoDatos = new ProyectoDatos();

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

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            string titulo = txtTitulo.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            string prioridad = ddlPrioridad.SelectedValue;

            if (string.IsNullOrWhiteSpace(titulo))
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text = "Por favor ingrese un título descriptivo para el requerimiento.";
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-error-container text-on-error-container border border-error/20";
                return;
            }

            if (string.IsNullOrWhiteSpace(descripcion))
            {
                pnlMensaje.Visible = true;
                lblMensaje.Text = "Por favor ingrese la descripción técnica u objetivos de la solicitud.";
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-error-container text-on-error-container border border-error/20";
                return;
            }

            int idUsuario = Convert.ToInt32(Session["UsuarioId"]);
            int idSuscripcion = _proyectoDatos.ObtenerOCrearSuscripcionPorUsuario(idUsuario);

            Proyecto nuevoProyecto = new Proyecto
            {
                Titulo = titulo,
                Descripcion = $"[Prioridad: {prioridad}] {descripcion}",
                FechaCreacion = DateTime.Now,
                FechaEntrega = DateTime.Now.AddDays(45),
                Estado = "Pendiente",
                Precio = 0,
                IdSuscripcion = idSuscripcion
            };

            bool registrado = _proyectoDatos.RegistrarProyecto(nuevoProyecto);

            pnlMensaje.Visible = true;
            if (registrado)
            {
                lblMensaje.Text = "¡Solicitud radicada con éxito! Nuestro equipo de arquitectura revisará el requerimiento a la brevedad.";
                pnlMensaje.CssClass = "mb-6 p-4 rounded-xl flex items-center gap-3 text-sm bg-primary/10 text-primary border border-primary/20";
                txtTitulo.Text = string.Empty;
                txtDescripcion.Text = string.Empty;
            }
            else
            {
                lblMensaje.Text = "Ocurrió un error al guardar la solicitud. Por favor intente más tarde.";
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
