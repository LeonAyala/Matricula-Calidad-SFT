using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using CapaPresentacion.CapaEntidades;
using CapaPresentacion.CapaDatos;
using CapaPresentacion.CapaLogicaN;
using CapaPresentacion.Custom;

namespace CapaPresentacion
{
    public partial class login : BasePage
    //public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["UserSessionId"] = null;
            }
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
         {
             bool auth = Membership.ValidateUser(LoginUser.UserName, LoginUser.Password);

             if (auth)
             {
                 // Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(LoginUser.UserName, LoginUser.Password);
                 Usuario obj = UsuarioLN.getInstance().AccesoSistema(LoginUser.UserName, LoginUser.Password);
                 if (obj != null)
                 {
                     SessionManager _SessionManager = new SessionManager(Session);
                     //SessionManager.UserSessionId = objEmpleado.ID.ToString();
                     _SessionManager.UserSessionEmpleado = obj;
                     FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
                 }
                 else
                 {
                     Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
                 }
             }
             else
             {
                 Response.Write("<script>alert('DATOS INCORRECTOS')</script>");
             }
         }


       
    }
}