using System;
using System.Web.UI;
using AppSyraxSolutionsSAS.Logica;

namespace AppSyraxSolutionsSAS.Vista.Cliente
{
    public partial class MisProyectos : System.Web.UI.Page
    {
        private readonly ProyectoLogica _proyectoLogica = new ProyectoLogica();

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

                int idUsuario = Convert.ToInt32(Session["UsuarioId"]);
                rptMisProyectos.DataSource = _proyectoLogica.ListarProyectos(idUsuario);
                rptMisProyectos.DataBind();
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
