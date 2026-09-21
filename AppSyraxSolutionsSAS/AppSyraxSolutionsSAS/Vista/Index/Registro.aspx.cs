using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Vista.Index
{
    public partial class Registro : Page
    {
        private readonly CatalogoDatos _catalogoDatos = new CatalogoDatos();
        private readonly EmpresaDatos _empresaDatos = new EmpresaDatos();
        private readonly UsuarioDatos _usuarioDatos = new UsuarioDatos();
        private readonly ProyectoDatos _proyectoDatos = new ProyectoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTiposDocumento();
            }
        }

        private void CargarTiposDocumento()
        {
            try
            {
                var tipos = _catalogoDatos.ListarTiposDocumento();
                ddlTipoDocumento.DataSource = tipos;
                ddlTipoDocumento.DataTextField = "Nombre";
                ddlTipoDocumento.DataValueField = "Id";
                ddlTipoDocumento.DataBind();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al cargar tipos de documento: " + ex.Message, false);
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            pnlMensaje.Visible = false;

            // Validar campos obligatorios
            string documento = txtNumeroDocumento.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string clave = txtClave.Text.Trim();
            string nombreEmpresa = txtNombreEmpresa.Text.Trim();
            string nitEmpresa = txtNitEmpresa.Text.Trim();
            string direccionEmpresa = txtDireccionEmpresa.Text.Trim();
            string telefonoEmpresa = txtTelefonoEmpresa.Text.Trim();
            string descripcionEmpresa = txtDescripcionEmpresa.Text.Trim();

            if (string.IsNullOrEmpty(documento) || string.IsNullOrEmpty(nombres) ||
                string.IsNullOrEmpty(apellidos) || string.IsNullOrEmpty(correo) ||
                string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(clave) ||
                string.IsNullOrEmpty(nombreEmpresa) || string.IsNullOrEmpty(nitEmpresa))
            {
                MostrarMensaje("Por favor complete todos los campos obligatorios (*).", false);
                return;
            }

            if (clave.Length < 6)
            {
                MostrarMensaje("La contraseña debe contener al menos 6 caracteres.", false);
                return;
            }

            try
            {
                // Verificar si ya existe correo o documento
                if (_usuarioDatos.ExisteCorreo(correo))
                {
                    MostrarMensaje("El correo corporativo ya se encuentra registrado en la plataforma. Inicie sesión o utilice otra cuenta.", false);
                    return;
                }

                if (_usuarioDatos.ExisteDocumento(documento))
                {
                    MostrarMensaje("El número de documento ya está registrado en la plataforma.", false);
                    return;
                }

                // Obtener o registrar la Empresa
                int idEmpresa = _empresaDatos.ObtenerOCrearEmpresa(
                    nombreEmpresa,
                    nitEmpresa,
                    string.IsNullOrEmpty(direccionEmpresa) ? null : direccionEmpresa,
                    string.IsNullOrEmpty(telefonoEmpresa) ? null : telefonoEmpresa,
                    string.IsNullOrEmpty(descripcionEmpresa) ? null : descripcionEmpresa
                );

                if (idEmpresa <= 0)
                {
                    MostrarMensaje("No fue posible registrar la empresa. Verifique los datos ingresados.", false);
                    return;
                }

                // Crear Usuario Cliente (IdRol = 2)
                Usuario nuevoUsuario = new Usuario
                {
                    NumeroDocumento = documento,
                    Nombres = nombres,
                    Apellidos = apellidos,
                    Correo = correo,
                    Telefono = telefono,
                    Direccion = string.IsNullOrEmpty(direccionEmpresa) ? "Sede Corporativa" : direccionEmpresa,
                    Clave = clave,
                    IdEmpresa = idEmpresa,
                    IdTipoDocumento = Convert.ToInt32(ddlTipoDocumento.SelectedValue),
                    IdRol = 2 // Cliente
                };

                bool ok = _usuarioDatos.RegistrarUsuario(nuevoUsuario);

                if (ok)
                {
                    // Inicializar suscripción para el nuevo cliente
                    Usuario usuarioCreado = _usuarioDatos.ObtenerPorCorreo(correo);
                    if (usuarioCreado != null)
                    {
                        _proyectoDatos.ObtenerOCrearSuscripcionPorUsuario(usuarioCreado.Id);
                    }

                    // Redireccionar al login con notificación de éxito
                    Response.Redirect("Login.aspx?registro=exito", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    MostrarMensaje("No se pudo completar el registro. Intente nuevamente más tarde.", false);
                }
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error inesperado durante el registro: " + ex.Message, false);
            }
        }

        private void MostrarMensaje(string mensaje, bool esExito)
        {
            lblMensaje.Text = mensaje;
            if (esExito)
            {
                pnlMensaje.CssClass = "p-4 rounded-xl flex items-center gap-3 text-sm bg-emerald-50 text-emerald-800 border border-emerald-200";
            }
            else
            {
                pnlMensaje.CssClass = "p-4 rounded-xl flex items-center gap-3 text-sm bg-red-50 text-red-700 border border-red-200";
            }
            pnlMensaje.Visible = true;
        }
    }
}
