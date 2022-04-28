using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaPresentacion.CapaDatos;
using CapaPresentacion.CapaEntidades;
using CapaPresentacion.CapaLogicaN;
using CapaPresentacion.Custom;
using System.Web.Services;

namespace CapaPresentacion
{
    //public partial class frmGPaciente : BasePage

       public partial class frmGPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Page.ClientScript.RegisterClientScriptInclude("pacientejs", "js/paciente.js");
                ddlSexo.Items.Insert(0, new ListItem("-- Seleccionar Sexo --", "0"));
              
            }
        }


        [WebMethod]
        public static List<Paciente> ListarPacientes()
        {
            List<Paciente> Lista = null;
            try
            {
                Lista = PacienteLN.getInstance().ListarPacientes();
            }
            catch (Exception)
            {
                Lista = new List<Paciente>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool ActualizarDatosPaciente(String id, String direccion, String telefono,String correo)
        {
        
            Paciente objPaciente = new Paciente()
            {
                idPaciente = Convert.ToInt32(id),
                direccion = direccion,
                telefono = telefono,
                correo = correo,
            };

            bool ok = PacienteLN.getInstance().Actualizar(objPaciente);
            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosPaciente(String id)
        {
            Int32 idPaciente = Convert.ToInt32(id);

            bool ok = PacienteLN.getInstance().Eliminar(idPaciente);

            return ok;

        }

        private Paciente GetEntity()
        {
            Paciente objPaciente = new Paciente();
            objPaciente.idPaciente = 0;
            objPaciente.nombres = txtNombres.Text;
            objPaciente.apPaterno = txtApPaterno.Text;
            objPaciente.apMaterno = txtApMaterno.Text;
            objPaciente.edad = Convert.ToInt32(txtEdad.Text);
            objPaciente.sexo = ddlSexo.SelectedValue; // == "Femenino") ? 'F' : 'M'; // Masculino , Femenino
            objPaciente.nroDocumento = txtNroDocumento.Text;
            objPaciente.direccion = txtDireccion.Text;
            objPaciente.correo = txtCorreo.Text;
            objPaciente.telefono = txtTelefono.Text;            
            objPaciente.nusuario = txtnuser.Text;
            objPaciente.clave = txtclave.Text;
            objPaciente.estado = true;

            return objPaciente;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

            if (txtApMaterno.Text == "" || txtApPaterno.Text == "" || txtNroDocumento.Text == "" || txtclave.Text == "" || txtclave2.Text == "" || txtNombres.Text == "" || txtEdad.Text == "")
            {
                Response.Write("<script>alert('TODO LOS CAMPOS DEBES SER  LLENADOS.')</script>");

            } else
            { 
                // Registro del paciente
                Paciente objPaciente = GetEntity();
                // enviar a la capa de logica de negocio
                bool response = PacienteLN.getInstance().RegistrarPaciente(objPaciente);
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

        private void Limpiar()
        {
            txtDireccion.Text = "";
            txtApMaterno.Text = "";
            txtApPaterno.Text = "";
            txtEdad.Text = "";
            txtclave.Text = "";
            txtclave2.Text = "";
            txtnuser.Text = "";
            txtCorreo.Text = "";
            txtNombres.Text = "";
            txtNroDocumento.Text = "";
            txtTelefono.Text = "";
            ddlSexo.SelectedIndex = 0;

        }
    }
}