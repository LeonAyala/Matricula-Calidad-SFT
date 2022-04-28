using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CapaPresentacion.CapaDatos;
using CapaPresentacion.CapaEntidades;
using CapaPresentacion.CapaLogicaN;
using CapaPresentacion.Custom;
using System.Web.Services;

namespace CapaPresentacion
{
    public partial class frmGUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
              
                LlenarRol();
                ddlRol.Items.Insert(0, new ListItem("-- Seleccionar Rol --", "0"));

            
            }

  

        }


        [WebMethod]
        public static List<Usuario> ListarUsuarios()
        {
            List<Usuario> Lista = null;
            try
            {
                Lista = UsuarioLN.getInstance().ListarUsuarios();
            }
            catch (Exception)
            {
                Lista = new List<Usuario>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool EliminarDatosUsuario(String id)
        {
            Int32 idUsuario = Convert.ToInt32(id);

            bool ok = UsuarioLN.getInstance().Eliminar(idUsuario);

            return ok;

        }

        private Usuario GetEntity()
        {
            Usuario obj = new Usuario();
           
                obj.IdUsuario = 0;
                obj.NUsuario = txtNUsuario.Text;
                obj.Clave = txtClave.Text;
                obj.IdRol = int.Parse(ddlRol.SelectedValue);
                obj.idEmpleado = Convert.ToInt32(idEmpleado.Value);
                obj.Activo = true;

                return obj;
           

        }

        private Usuario GetEntity2()
        {
            Usuario obj = new Usuario();
            obj.IdUsuario = Convert.ToInt32(IdUsuario.Value);
            obj.NUsuario = txtNUsuario.Text;
            obj.Clave = txtClave.Text;
            obj.IdRol = int.Parse(ddlRol.SelectedValue);
            obj.Activo = true;
            return obj;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
                
            if (txtDNI.Text=="")
            {   
                
                Response.Write("<script>alert('BUSCAR EMPLEADO POR DNI ANTES DE REGISTRAR AL USUARIO.')</script>");
                txtDNI.Focus();
            }
            else
            {
                Usuario obj = GetEntity();
                bool response = UsuarioLN.getInstance().RegistrarUsuario(obj);
                if (response)
                {
                    Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");

                }
                else
                {
                    Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
                }
                Limpiar();
            }

        }
      

        [WebMethod]
        public static Empleado BuscarEmpleadoDNI(String dni)
        {
            return EmpleadoLN.getInstance().BuscarEmpleado(dni);
        }

        private void Limpiar()
        {
            txtDNI.Text = "";
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtNUsuario.Text = "";
            txtClave.Text = "";
            ddlRol.SelectedIndex = 0;
         // txtTipoEmpleado.Text = "";
            idEmpleado.Value = "0";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Usuario obj = GetEntity2();
            bool response = UsuarioLN.getInstance().Actualizar(obj);
            if (response)
            {
                Response.Write("<script>alert('ACTUALIZACION CORRECTA.')</script>");

            }
            else
            {
                Response.Write("<script>alert('ACTUALIZACION INCORRECTA.')</script>");
            }
            Limpiar();

        }

        private void LlenarRol()
        {
            List<Rol> Lista = RolLN.getInstance().ListarRol();

            ddlRol.DataSource = Lista;
            ddlRol.DataValueField = "IdRol";
            ddlRol.DataTextField = "Descripcion";
            ddlRol.DataBind();
        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            txtNUsuario.Enabled = true;
            txtClave.Enabled = true;
            ddlRol.Enabled = true;
        }
    }


}
