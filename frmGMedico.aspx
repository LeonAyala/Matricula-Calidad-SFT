<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="frmGMedico.aspx.cs" Inherits="CapaPresentacion.frmGMedico" ClientIDMode="Static"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE MEDICOS</h1>
    </section>
    <section class="content">
        <div Style="width:100%" class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                       
                        <div class="form-group">
                            <label class="formulario__label">DOCUMENTO DE IDENTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNroDocumento" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="evDNI" runat="server" ErrorMessage="El DNI solo debe contener 8 digitos y deben ser números" ControlToValidate="txtNroDocumento" ForeColor="#FF3300" ValidationExpression="[0-9]{8}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>  
                        </div>
                        <div class="form-group">
                            <label class="formulario__label">NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="evNombres" runat="server" ErrorMessage="El nombre solo contiene letras y espacios" ControlToValidate="txtNombres" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ\s]{1,40}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label class="formulario__label">APELLIDO PATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApPaterno" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="evApPaterno" runat="server" ErrorMessage="El apellido solo contiene letras" ControlToValidate="txtApPaterno" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ]{1,30}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label class="formulario__label">APELLIDO MATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApMaterno" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="evApMaterno" runat="server" ErrorMessage="El apellido solo contiene letras" ControlToValidate="txtApMaterno" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ]{1,30}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
                        </div>
                         <div class="form-group">
                          <label>ESPECIALIDAD</label>
                          <asp:DropDownList ID="ddlEspecialidad" CssClass="form-control" runat="server" required="true"></asp:DropDownList>
                        
                        </div>
                           <div class="form-group">
                            <label class="formulario__label">TITULO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTitulo" runat="server" Text="" CssClass="form-control" required="true"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="evTitulo" runat="server" ErrorMessage="El titulo solo contiene letras" ControlToValidate="txtTitulo" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ ]{1,30}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
                            </div>
                         <div class="form-group">
                            <label class="formulario__label"s>CARGO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCargo" runat="server" Text=""  CssClass="form-control" required="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="evCarg" runat="server" ErrorMessage="El cargo solo contiene letras" ControlToValidate="txtCargo" ForeColor="#FF3300" ValidationExpression="[a-zA-ZÀ-ÿ]{1,30}" ValidationGroup="DatosRequeridos"></asp:RegularExpressionValidator>
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
                       
                     
                         <div class="form-group">
                            <label>Nro. de Colegiatura:</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCMP" runat="server" Text=""  CssClass="form-control"></asp:TextBox>
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
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar" OnClick="btnRegistrar_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!-- Datatable Part -->

        <div class="row" style="width:100%">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Médicos</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_medicos" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombres</th>
                                    <th>Ap Paterno</th>
                                    <th>Ap Materno</th>
                                    <th>Nro Documento</th>
                                    <th>Cargo</th>
                                    <th>Especialidad</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Datatable -->
    </section>


     <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar registro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>NOMBRES</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>AP_PATERNO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPaterno" runat="server" Text="" CssClass="form-control" Enabled="false" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>AP_MATERNO</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtMaterno" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DNI</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtDNI" runat="server" Text="" CssClass="form-control" ></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="js/medico.js" type="text/javascript"></script>
</asp:Content>

