using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaPresentacion.CapaEntidades;
using CapaPresentacion.CapaLogicaN;
using System.Web.Services;


namespace CapaPresentacion
{
    public partial class frmGReservaCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarEspecialidades();
            }

        }


        private void LlenarGridViewHorariosAtencion()
        {

            //if (txtFechaAtencion.Text.Equals(string.Empty))
            //{
            //    Response.Write("<script>alert('No ha ingresado una fecha valida')</script>");
            //    return;
            //}
            //// obtenemos fecha
            //String fecha = txtFechaAtencion.Text;
            //DateTime fechaBusqueda = Convert.ToDateTime(fecha);

            // obtenemos el idEspecialidad
            Int32 idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);

            List<HorarioAtencion> Lista = HorarioAtencionLN.getInstance().ListarHorario(idEspecialidad);
            grdHorariosAtencion.DataSource = Lista;
            grdHorariosAtencion.DataBind();
        }

        private void LlenarEspecialidades()
        {
            List<Especialidad> Lista = EspecialidadLN.getInstance().Listar();

            ddlEspecialidad.DataSource = Lista;
            ddlEspecialidad.DataValueField = "idEspecialidad";
            ddlEspecialidad.DataTextField = "descripcion";
            ddlEspecialidad.DataBind();
        }

        [WebMethod]
        public static Paciente BuscarPacienteDNI(String dni)
        {
            return PacienteLN.getInstance().BuscarPacienteDNI(dni);
        }

        protected void btnBuscarHorario_Click(object sender, EventArgs e)
        {
            LlenarGridViewHorariosAtencion();
        }

        [WebMethod]
        public static bool ActualizarHorarioAtencion(String id)
        {
            HorarioAtencion obj = new HorarioAtencion()
            {
                IdHorarioAtencion = Convert.ToInt32(id),
            };

            bool ok = HorarioAtencionLN.getInstance().Actualizar(obj);
            return ok;
        }


        protected void btnReservarCita_Click(object sender, EventArgs e)
        {
            // ejecutar el guardado de la reserva
            bool isSelected = HorarioAtencionSelccionado();

            if (!idPaciente.Value.Equals(string.Empty) && isSelected.Equals(true))
            {
                Cita objCita = ObtenerCitaSeleccionada();
                bool response = CitaLN.getInstance().RegistrarCita(objCita);

                if (response)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Mensaje", "<script>alert('Cita registrada correctamente.')</script>", false);
                    Response.Redirect("frmGReservaCitas.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alerta", "<script>alert('Error al registrar la cita.')</script>", false);
                }

            }

        }

        //Comprobar si existe un horario seleccionado
        private bool HorarioAtencionSelccionado()
        {
            foreach (GridViewRow row in grdHorariosAtencion.Rows)
            {
                CheckBox chkHorario = (row.FindControl("chkSeleccionar") as CheckBox);

                if (chkHorario.Checked)
                {
                    return true;
                }
            }
            return false;
        }


        //Obtener el objeto cita
        private Cita ObtenerCitaSeleccionada()
        {
            Cita objCita = new Cita();
            Medico objMedico = new Medico();

            char es = 'P';

            foreach (GridViewRow row in grdHorariosAtencion.Rows)
            {
                CheckBox chkHorario = (row.FindControl("chkSeleccionar") as CheckBox);

                if (chkHorario.Checked)
                {
                    objCita.Hora = (row.FindControl("lblHora") as Label).Text;
                    String fecha = (row.FindControl("lblFecha") as Label).Text;
                    objCita.FechaReserva = Convert.ToDateTime(fecha);
                    objCita.Paciente.idPaciente = Convert.ToInt32(idPaciente.Value);

                    string idMedico = (row.FindControl("hfIdMedico") as HiddenField).Value;
                    objCita.Medico.IdMedico = Convert.ToInt32(idMedico);


                    //  string idMedico = (row.FindControl("hfIdMedico") as HiddenField).Value;

                    break;
                }
            }
            return objCita;
        }

        protected void btnAgregarHorario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmGHorarioAtencion.aspx");
        }
    }
}