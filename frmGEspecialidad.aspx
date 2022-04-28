<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="frmGEspecialidad.aspx.cs" Inherits="CapaPresentacion.frmGEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="content-header">
     <h1 style="text-align: center">REGISTRO DE EPECIALIDAD</h1>
     
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                       
               
                        <div class="form-group">
                            <label class="formulario__label">NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="evNombres" runat="server" ErrorMessage="El nombre solo contiene letras y espacios" ControlToValidate="txtNombres" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ\s]{1,40}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
                        </div>
                      
                        
                    </div>
                </div>
            </div>
          
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <img src="img/photo/6.jpg"/>
                        </div>
                       
                     
                    </div>
                </div>
            </div>
        </div>
         <div class="row">
            <div>
                <p class="formulario__mensaje" id="formulario__mensaje">
                    <i class="fas fa-exclamation-triangle"></i>
                    <b>Error:</b> Rellene los campos correctamente
                </p>
            </div>
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar"/>
                    </td>
                    <td>  &nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!-- GRIDVIEW Part -->
          
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Especialidad</h3>
                    </div>
                    
                          <div style="width:100%;text-align:left;">
                              
                             <div class="form-group">
                             <asp:TextBox ID="txtBuscar" CssClass="form-control"
                                    runat="server"  TextMode="Search"  Text="" placeholder="Ingresar Usuario" Width="281px" >
                             </asp:TextBox>
                            </div>

                             <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="btnBuscar_Click1" 
                                  />
                              <br />

                                <asp:GridView id="gvUsuario" runat="server" CssClass="table" 
                                    AutoGenerateColumns="False" 
                                    OnRowDeleting="gvCursos_RowDeleting"
                                    OnRowEditing="gvCursos_RowEditing1" 
                                    OnRowUpdating="gvCursos_RowUpdating1" 
                                    OnRowCancelingEdit="gvCursos_RowCancelingEdit1"
                                    DataKeyNames="IdUsuario">

                                    <Columns>
                                        <asp:BoundField DataField="IdUsuario" HeaderText="Codigo" ReadOnly="true"/>
                                        <asp:TemplateField HeaderText="UserName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtNUsuario2" runat="server" Text='<%# Bind("NUsuario") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NUsuario") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                       <asp:BoundField DataField="Descripcion" HeaderText="Rol del Usuario" ReadOnly="true"/>
                                   
                                      
                                        <asp:BoundField DataField="Activo" HeaderText="Estado" ReadOnly="true"/>

                                                                               
                       

                                         <asp:TemplateField HeaderText="Action">
                                             <ItemTemplate>
                                                 <asp:Button CommandName="delete" runat="server" ControlStyle-CssClass="btn btn-danger"
                                                      Text="Remove" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                       

                                        <asp:CommandField ShowEditButton="true" 
                                            ControlStyle-CssClass="btn btn-primary" HeaderText="Editar">
                                        <ControlStyle CssClass="btn btn-primary" />

                                            <ControlStyle CssClass="btn btn-primary" />
                                        </asp:CommandField>
                                    </Columns>

                                </asp:GridView>
                                </div>
                    <asp:Label ID="lblRespuesta" runat="server" Text="" CssClass="text-info"></asp:Label>

                </div>
            </div>
        </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
   
</asp:Content>

