using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CapaPresentacion.CapaEntidades;
using CapaPresentacion.CapaDatos;
using CapaPresentacion.CapaLogicaN;
using CapaPresentacion.Custom;

namespace CapaPresentacion
{
    public partial class frmGEspecialidad : System.Web.UI.Page
    {
        // DaoUsuario dao = new DaoUsuario();
       private void limpiarcampo()
        {
            txtNombres.Text = string.Empty;
           

        }

       

        private void LlenarGVespecialidad()
        {
           // DataTable Lista = EspecialidadLN.getInstance().Listar();
            List<Especialidad> Lista = EspecialidadLN.getInstance().Listar();

            gvUsuario.DataSource = Lista;
            gvUsuario.DataBind();


        }


        public void consultarUsuario()
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.CNP))
            {
                //captura los errores con try cacth
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT descripcion FROM Especialidad where descripcion like'%" + txtBuscar.Text + "%'", oConexion);
                    //SqlDataAdapter da = new SqlDataAdapter("Select*from usuario where NUsuario like'%" + txtBuscar.Text + "%'", oConexion);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    this.gvUsuario.DataSource = dt;
                    gvUsuario.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }


        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            consultarUsuario();

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarGVespecialidad();
              
                lblRespuesta.Text = "";

            }
        }



        private Especialidad GetEntity()
        {
            Especialidad objEspecialidad = new Especialidad();
            objEspecialidad.Descripcion = txtNombres.Text.Trim();
         
            return objEspecialidad;

        }


        private Especialidad GetEntityb()
        {
            Especialidad objEspecialidad = new Especialidad();
            objEspecialidad.Descripcion = txtBuscar.Text.Trim();

            return objEspecialidad;

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            //pnlDatosCurso.Visible = false;
            //pnlAltaCurso.Visible = true;

            limpiarcampo();
        }

        //BOTONES DE MANTENIIENTO  ---> OPCION 1
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

            // Registro del paciente
            Especialidad objEspecialidad = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = EspecialidadLN.getInstance().RegistrarEspecialidad(objEspecialidad);
            if (response)
            {
                Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");
                LlenarGVespecialidad();

            }
            else
            {
                Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
            }
        }

        //BOTONES DE MANTENIIENTO  ---> OPCION ALTERNATIVO

        protected void gvCursos_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.CNP))

                {

                    int IdUsuario = Convert.ToInt32(gvUsuario.DataKeys[e.RowIndex].Value);
                    string NUsuario = (gvUsuario.Rows[e.RowIndex].FindControl("txtNombres") as TextBox).Text;
                    //bool Activo = Convert.ToBoolean((gvUsuario.Rows[e.RowIndex].FindControl("txtEstado") as TextBox).Text);


                    SqlCommand cmd = new SqlCommand("usp_ModificarEspecialidad", oConexion);
                    cmd.Parameters.AddWithValue("@Nombres", NUsuario);                   
                    cmd.Parameters.AddWithValue("@Estado", IdUsuario);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    oConexion.Close();
                    gvUsuario.EditIndex = -1;
                    LlenarGVespecialidad();
                    lblRespuesta.Text = "Se actualizo con exito el registro";

                }
            }
            catch (Exception ex)
            {
                lblRespuesta.Text = "Error al Actualizar:" + ex.Message;

            }
        }



        protected void gvCursos_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            gvUsuario.EditIndex = e.NewEditIndex;
            LlenarGVespecialidad();
        }

        protected void gvCursos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                using (SqlConnection oConexion = new SqlConnection(Conexion.CNP))
                {
                    int id = Convert.ToInt32(gvUsuario.DataKeys[e.RowIndex].Value);
                    SqlCommand cmd = new SqlCommand("usp_EliminarUsuario", oConexion);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id_Especialidad", id);
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    oConexion.Close();
                    lblRespuesta.Text = "Se Elimino el registro";
                    LlenarGVespecialidad();
                }
            }
            catch (Exception ex)
            {
                lblRespuesta.Text = "Error al Eliminar:" + ex.Message;

            }
        }


        protected void gvCursos_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsuario.EditIndex = -1;
            LlenarGVespecialidad();
        }
    }
}