using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Logica;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Admin
{
    public partial class DetalleProyecto : Page
    {
        private readonly ProyectoDatos _proyectoDatos = new ProyectoDatos();
        private readonly AvanceDatos _avanceDatos = new AvanceDatos();
        private readonly AvanceLogica _avanceLogica = new AvanceLogica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["RolId"] == null || Convert.ToInt32(Session["RolId"]) != 1)
            {
                Response.Redirect("~/Vista/Index/Login.aspx");
                return;
            }

            int idProyecto = ObtenerIdProyecto();
            if (idProyecto <= 0)
            {
                Response.Redirect("Proyectos.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string nombre = Session["NombreCompleto"]?.ToString() ?? "Administrador";
                litNombreUsuario.Text = nombre;
                litInicial.Text = !string.IsNullOrEmpty(nombre) ? nombre.Substring(0, 1).ToUpper() : "A";

                CargarDetalle(idProyecto, true);
            }
        }

        private int ObtenerIdProyecto()
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                return id;
            }
            return 0;
        }

        private void CargarDetalle(int idProyecto, bool actualizarDropdown)
        {
            try
            {
                Proyecto proyecto = _proyectoDatos.ObtenerProyectoPorId(idProyecto);
                if (proyecto == null)
                {
                    Response.Redirect("Proyectos.aspx");
                    return;
                }

                litTituloHeader.Text = proyecto.Titulo;
                litTitulo.Text = proyecto.Titulo;
                litDescripcion.Text = !string.IsNullOrEmpty(proyecto.Descripcion) ? proyecto.Descripcion : "Sin descripción detallada.";
                litEstadoBadge.Text = proyecto.Estado;
                
                string empresa = !string.IsNullOrEmpty(proyecto.NombreEmpresa) ? proyecto.NombreEmpresa : "Empresa Aliada";
                string cliente = !string.IsNullOrEmpty(proyecto.NombreCliente) ? proyecto.NombreCliente : "Representante";
                
                litEmpresa.Text = empresa;
                litCliente.Text = cliente;
                litCardEmpresa.Text = empresa;
                litCardCliente.Text = cliente;
                litCardCorreo.Text = !string.IsNullOrEmpty(proyecto.CorreoCliente) ? proyecto.CorreoCliente : "N/A";
                litCardSuscripcion.Text = proyecto.IdSuscripcion.HasValue ? "#" + proyecto.IdSuscripcion.Value : "#0";

                litPorcentaje.Text = proyecto.PorcentajeAvance + "%";
                divProgresoBar.Style["width"] = proyecto.PorcentajeAvance + "%";

                litFechaInicio.Text = proyecto.FechaCreacion.HasValue ? proyecto.FechaCreacion.Value.ToString("dd/MM/yyyy") : "No definida";
                litFechaEntrega.Text = proyecto.FechaEntrega.HasValue ? proyecto.FechaEntrega.Value.ToString("dd/MM/yyyy") : "Por definir";
                litPrecio.Text = proyecto.Precio.HasValue ? string.Format("{0:N0}", proyecto.Precio.Value) : "0";

                if (actualizarDropdown && ddlEstado.Items.FindByValue(proyecto.Estado) != null)
                {
                    ddlEstado.SelectedValue = proyecto.Estado;
                }

                CargarAvances(idProyecto);
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar la información del proyecto: " + ex.Message, false);
            }
        }

        private void CargarAvances(int idProyecto)
        {
            var avances = _avanceDatos.ListarAvances(idProyecto);
            rptAvances.DataSource = avances;
            rptAvances.DataBind();

            pnlSinAvances.Visible = (avances == null || avances.Count == 0);
        }

        protected void btnActualizarEstado_Click(object sender, EventArgs e)
        {
            pnlAlerta.Visible = false;
            int idProyecto = ObtenerIdProyecto();
            if (idProyecto <= 0) return;

            string nuevoEstado = ddlEstado.SelectedValue;
            bool ok = _proyectoDatos.ActualizarEstado(idProyecto, nuevoEstado);

            if (ok)
            {
                MostrarMensaje("El estado del proyecto se actualizó exitosamente a '" + nuevoEstado + "'.", true);
                CargarDetalle(idProyecto, false);
            }
            else
            {
                MostrarMensaje("No fue posible actualizar el estado del proyecto.", false);
            }
        }

        protected void btnGuardarAvance_Click(object sender, EventArgs e)
        {
            pnlAlerta.Visible = false;
            int idProyecto = ObtenerIdProyecto();
            if (idProyecto <= 0) return;

            string evidencia = txtEvidencia.Text.Trim();
            if (string.IsNullOrEmpty(evidencia))
            {
                MostrarMensaje("Debe ingresar la descripción o evidencia del avance técnico.", false);
                return;
            }

            Avance nuevoAvance = new Avance
            {
                IdProyecto = idProyecto,
                Evidencia = evidencia,
                FechaEntrega = DateTime.Now
            };

            bool ok = _avanceDatos.RegistrarAvance(nuevoAvance);
            if (ok)
            {
                txtEvidencia.Text = string.Empty;
                MostrarMensaje("El avance técnico fue registrado exitosamente en la bitácora.", true);
                CargarDetalle(idProyecto, false);
            }
            else
            {
                MostrarMensaje("No fue posible registrar el avance técnico.", false);
            }
        }

        protected void rptAvances_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AgregarObservacion")
            {
                pnlAlerta.Visible = false;
                int idAvance = Convert.ToInt32(e.CommandArgument);
                var txtObs = e.Item.FindControl("txtNuevaObservacion") as System.Web.UI.WebControls.TextBox;
                if (txtObs != null && !string.IsNullOrWhiteSpace(txtObs.Text))
                {
                    int? idUsuario = Session["UsuarioId"] != null ? (int?)Convert.ToInt32(Session["UsuarioId"]) : null;
                    string msg;
                    bool ok = _avanceLogica.AgregarObservacion(idAvance, idUsuario, txtObs.Text.Trim(), out msg);
                    MostrarMensaje(msg, ok);
                    int idProyecto = ObtenerIdProyecto();
                    CargarDetalle(idProyecto, false);
                }
                else
                {
                    MostrarMensaje("Debe escribir una observación o retroalimentación técnica.", false);
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Vista/Index/Login.aspx");
        }

        private void MostrarMensaje(string mensaje, bool esExito)
        {
            lblMensaje.Text = mensaje;
            if (esExito)
            {
                pnlAlerta.CssClass = "mb-6 p-4 rounded-2xl flex items-center gap-3 text-sm bg-emerald-50 text-emerald-800 border border-emerald-200";
            }
            else
            {
                pnlAlerta.CssClass = "mb-6 p-4 rounded-2xl flex items-center gap-3 text-sm bg-red-50 text-red-700 border border-red-200";
            }
            pnlAlerta.Visible = true;
        }
    }
}
