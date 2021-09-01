<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="RegistroHospital.Login2" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server" Visible="True" class="d-flex justify-content-center">

        <div ID="login">

            <h2>INICIO DE SESIÓN</h2>

            <label for="loginTxbUsuario">Nombre de Usuario</label>
            <asp:TextBox ID="loginTxbUsuario" runat="server" class="form-control" placeholder="Nombre de usuario" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            <br />
            <label for="loginTxbClave">Clave</label>
            <asp:TextBox ID="loginTxbClave" runat="server" class="form-control" placeholder="Clave" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            <br />
            <asp:Button ID="loginBtnLogin" runat="server" Text="Iniciar Sesion" class="btn2 btn-block"/>
            <asp:Button ID="loginBtnRegistro" runat="server" Text="Registrarse" class="btn1 btn-block"/>

            <asp:SqlDataSource ID="DsValidarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT nombre, clave FROM usuarios WHERE (nombre = @usuario) AND (clave = @clave)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="loginTxbUsuario" Name="usuario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="loginTxbClave" Name="clave" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="False" class="d-flex justify-content-center">

        <div ID="registro">

            <h2>REGISTRO DE NUEVO USUARIO</h2>

            <label for="registroTxbUsuario">Nombre de Usuario</label>
            <asp:TextBox ID="registroTxbUsuario" runat="server" class="form-control" placeholder="Nombre de usuario" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            <br />
            <label for="registroTxbClave">Clave</label>
            <asp:TextBox ID="registroTxbClave" runat="server" class="form-control" placeholder="Nombre de usuario" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            <br />
            <asp:Button ID="registroBtnRegistrar" runat="server" Text="Registrarse" class="btn1 btn-block"/>
            <asp:Button ID="registroBtnLogin" runat="server" Text="Inicio de Sesión" class="btn1 btn-block"/>

            <asp:SqlDataSource ID="DsRegistrarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" InsertCommand="INSERT INTO usuarios(nombre, clave, rol) VALUES (@nombre, @clave, @rol)" SelectCommand="SELECT * FROM [usuarios]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="registroTxbUsuario" Name="nombre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="registroTxbClave" Name="clave" PropertyName="Text" />
                    <asp:Parameter DefaultValue="0" Name="rol" />
                </InsertParameters>
            </asp:SqlDataSource>

        </div>

    </asp:Panel>

</asp:Content>
