using System;
using System.Collections.Generic;
using AppSyraxSolutionsSAS.Datos;
using AppSyraxSolutionsSAS.Modelos;

namespace AppSyraxSolutionsSAS.Logica
{
    public class CatalogoLogica
    {
        private readonly CatalogoDatos _catalogoDatos = new CatalogoDatos();
        private readonly EmpresaDatos _empresaDatos = new EmpresaDatos();

        public List<Rol> ListarRoles()
        {
            return _catalogoDatos.ListarRoles();
        }

        public List<TipoDocumento> ListarTiposDocumento()
        {
            return _catalogoDatos.ListarTiposDocumento();
        }

        public List<Plan> ListarPlanes()
        {
            return _catalogoDatos.ListarPlanes();
        }

        public List<Empresa> ListarEmpresas()
        {
            return _empresaDatos.ListarEmpresas();
        }
    }
}
