<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmGcita.aspx.cs" Inherits="CapaPresentacion.frmGcita" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="css/Estilos.css" rel="stylesheet" />
    <title>Login</title>
    <script type="text/javascript">
        function onKeyDecimal(e, thix) { // onkeypress="return justNumbers(this,event);"
            var keynum = window.event ? window.event.keyCode : e.which;
            if (document.getElementById(thix.id).value.indexOf('.') != -1 && keynum == 46)
                return false;
            if ((keynum == 8 || keynum == 48 || keynum == 46))
                return true;
            if (keynum <= 47 || keynum >= 58) return false;
            return /\d/.test(String.fromCharCode(keynum));
        }

        function justNumbers(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
            if ((keynum == 8 || keynum == 48))
                return true;
            if (keynum <= 47 || keynum >= 58) return false;
            return /\d/.test(String.fromCharCode(keynum));
        }

        function soloLetras(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;

            return false;
        }

    </script>
    <style type="text/css">
        .auto-style1 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        .auto-style2 {
            height: 26px;
        }
    </style>
</head>

<body class="bg-light ">   
                        
    <div class="wrapper">

      
            
            <form id="formulario_login" runat="server">
                 
              <div class="formcontent">

                <asp:Panel runat="server" ID="pnlDatoslogeo" Visible="true">

                    <div class="form-control">
                        
                    <div class="row">
                        <asp:Label class="h3" ID="lblBienvenida" runat="server" Text="Bienvenido/a al Sistema"></asp:Label>
                     </div>
                    <br />
                    <div>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" value="Admin" placeholder="Ingresar Usuario"></asp:TextBox>
                    </div>
                       <br /> 
                    <div>
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="tbPassword" CssClass="form-control" TextMode="Password" value="Admin123" runat="server" placeholder="Ingresar Password"></asp:TextBox>
                    </div>
                    <br />                
                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    </div>
             
                    <div class="row">
                        <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-danger" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click"/>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-info" ID="lblokP" Visible="false"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-info" ID="lblokU" Visible="false"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-dark" ID="lblregistrarse"></asp:Label>
                    </div>

                     <div class="row">
                        <asp:Button ID="BtnRegistrarse" CssClass="btn  btn-success" runat="server" 
                            Text="Registrarse" OnClick="BtnRegistrarse_Click" />
                    </div>

           
                  </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="pnlDatosRegistro" Visible="false" Width="459px">
                    <div class="form-control">
              
                    <div class="row">
                        <asp:Label class="h3" ID="Label1" runat="server" Text="Regístrar Datos del Pacientea"></asp:Label>
                     </div>
                    <br />
                 <table>
                   <tr>
                    
                     <td > <asp:Label ID="Label2" runat="server" Text="Nombres:" Font-Bold="True"></asp:Label></td> 
                      <td>  <asp:TextBox ID="tbnombres" CssClass="form-control" runat="server"  
                              placeholder="Ingresar sus Nombres" Width="295px"></asp:TextBox></td> 
                    </tr>
                    <tr>    
                       <td> <asp:Label ID="Label3" runat="server" Text="Apellidos:" Font-Bold="True"></asp:Label></td> 
                         <td> <asp:TextBox ID="tbapellidos" CssClass="form-control" runat="server" placeholder="Ingresar sus Apellidos" Width="295px"></asp:TextBox></td> 
         
                    </tr>
                    <tr>
                       <td class="auto-style2"> <asp:Label ID="Label4" runat="server" Text="DNI:" 
                               Font-Bold="True"></asp:Label></td> 
                       <td class="auto-style2"> <asp:TextBox ID="tbdni" CssClass="form-control"   runat="server" placeholder="Ingresar su DNI" Width="295px"></asp:TextBox></td> 
                  
                   </tr>
                    <tr>
                       <td> <asp:Label ID="Label6" runat="server" Text="Telefono:" Font-Bold="True"></asp:Label></td> 
                       <td> <asp:TextBox ID="tbtelefono" CssClass="form-control" onkeypress="return justNumbers(event);" TextMode="Phone" MaxLength="2" runat="server" placeholder="Ingresar su Telefono" Width="295px"></asp:TextBox></td> 
                     </tr>
                     <tr>
                     
                     <td><asp:Label ID="Label15" runat="server" Text="Sexo:" Font-Bold="True"></asp:Label>  </td> 
                         <td> <asp:DropDownList ID="cbSexo" runat="server" CssClass="form-control" Width="295px">
                             <asp:ListItem>--Seleccionar--</asp:ListItem>
                             <asp:ListItem>Masculino</asp:ListItem>
                             <asp:ListItem>Femenino</asp:ListItem>
                            
                         </asp:DropDownList></td>
                    </tr>
                    <tr>
                         <td><asp:Label ID="Label8" runat="server" Text="Email:" Font-Bold="True"></asp:Label></td> 
                         <td><asp:TextBox ID="tbcorreo" CssClass="form-control" MaxLength="35"  TextMode="Email" runat="server" placeholder="ejemplor@dominio.com" Width="295px"></asp:TextBox></td> 
                     </tr>
                     <tr>
                        <td><asp:Label ID="Label9" runat="server" Text="Dirección:" Font-Bold="True"></asp:Label></td> 
                        <td><asp:TextBox ID="tbdireccion" CssClass="form-control"   runat="server" placeholder="Ingresar su Dirección" Width="295px"></asp:TextBox></td> 
                    </tr>
                    <tr>
                        <td><asp:Label ID="Label10" runat="server" Text="F. Nacimiento:" 
                                Font-Bold="True"></asp:Label></td> 
                        <td><asp:TextBox ID="tbfnacimiento"  TextMode="Date"  MaxLength="9" runat="server" CssClass="auto-style1"
                                placeholder="Ingresar su Fecha Nacimiento" Width="295px"></asp:TextBox></td> 
                     </tr>
                     <tr>
                         <td><asp:Label ID="Label7" runat="server" Text="Estado Civil:" Font-Bold="True"></asp:Label>  </td>
                         <td><asp:DropDownList ID="cbEstdoCivil" runat="server" CssClass="form-control" Width="295px">
                             <asp:ListItem>--Seleccionar---</asp:ListItem><asp:ListItem>Casado</asp:ListItem><asp:ListItem>Soltero</asp:ListItem>
                             <asp:ListItem>Divorciado</asp:ListItem><asp:ListItem>Viudo</asp:ListItem>
                         </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Label14" runat="server" Text="Movito de Cita:" Font-Bold="True"></asp:Label></td>
                        <td><asp:TextBox ID="tbobservacion" CssClass="auto-style1"  TextMode="MultiLine"  
                                MaxLength="9" runat="server" placeholder="Describir el Motivo por la cual reservará la Cita" 
                                Width="295px" Height="90px"></asp:TextBox></td>
                     </tr>
                     </table>
                        <br />
                     <div class="row">
                        <asp:Label class="h3" ID="Label16" runat="server" Text="Regístrar Datos de la Cuente"></asp:Label>
                     </div>                
                      
                     <table>
                             <tr>
                                
                                     <td>
                                         <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                             Text="Nombre de Usuario:"></asp:Label>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="tbiusername" runat="server" CssClass="form-control" 
                                             placeholder="Ingresar Nueva Cuenta" Width="221px"></asp:TextBox>
                                     </td>
                            
                     </tr>
                     <tr>
                         
                             <td>
                                 <asp:Label ID="Label12" runat="server" Font-Bold="true" Text="Nuevo Password:"></asp:Label>
                             </td>
                             <td>
                                 <asp:TextBox ID="tbipass1" runat="server" CssClass="form-control" 
                                     placeholder="Ingresar Nuevo Password" TextMode="Password" Width="221px"></asp:TextBox>
                             </td>
                       
                     </tr>
                     <tr>
                        
                             <td>
                                 <asp:Label ID="Label13" runat="server" Font-Bold="true" 
                                     Text="Confirmar Password:"></asp:Label>
                             </td>
                             <td>
                                 <asp:TextBox ID="tbipass2" runat="server" CssClass="form-control" 
                                     placeholder="Confirmar  Password" TextMode="Password" Width="221px"></asp:TextBox>
                             </td>
                        
                   </tr>
                        </table>
                      <br />
                    <div class="row">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegistrop" CssClass="btn  btn-success" 
                            runat="server" Text="Registrar" Width="150px" />          
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelar" CssClass="btn btn-primary btn-danger" 
                            runat="server" Text="Cancelar" Width="150px" />
                    </div>
                    <br />
                     <div class="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="Label5"></asp:Label>
                    </div>
                    <br />

                      
                    </div>
                     </asp:Panel>
                    <div class="row">
                        <p class="mb-0">Todos los derechos reservados ©<a id="publicidad" href="#" target="_blank" class="ml-1"><br /><b>UCH - Click Aqui</b></a></p>
                     </div>   

                  </div>
            </form>
                      
             </div>
     
</body>
</html>


