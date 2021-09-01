<%@ Page Title="RegistroPacientes" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroPacientes.aspx.vb" Inherits="RegistroHospital.RegistroPacientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">

        <div id="registroUsuario" class="form-group">

            <h2>REGISTRO DE PACIENTE NUEVO</h2>
            <br />

            <label for="regPacTxbNombre">Nombre del Paciente</label>
            <asp:TextBox ID="regPacTxbNombre" runat="server" CssClass="form-control" placeholder="Nombre del Paciente" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            <br />

            <label for="regPacDDLHab">Habitación</label>
            <asp:DropDownList ID="regPacDDLHab" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="DsListaHabitaciones" DataTextField="numHabitacion" DataValueField="numHabitacion">
            <asp:ListItem Value="50" Text="Choose Your Division">Choose Your Division</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="DsListaHabitaciones" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT numHabitacion, estado FROM habitaciones WHERE (estado = 'LIBRE')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DsOcuparHabitacion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [habitaciones]" UpdateCommand="UPDATE habitaciones SET estado = 'EN USO' WHERE numHabitacion = @numHabitacion">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="regPacDDLHab" Name="numHabitacion" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />

            <label for="regPacDDLMed">Medico Asignado</label>
            <asp:DropDownList ID="RegPacDDLMed" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="DsListaMedicos" DataTextField="nombre" DataValueField="nombre">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DsListaMedicos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [medicos]"></asp:SqlDataSource>
            <br />

            <asp:Button ID="RegPacBtnRegistrar" runat="server" Text="REGISTRAR PACIENTE" class="btn1 btn-block"/>
            
            <asp:SqlDataSource ID="DsRegistroPaciente" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" InsertCommand="INSERT INTO pacientes(nombre, habitacion, medico, estado, fechaIngreso) VALUES (@nombre, @habitacion, @medico, @estado, GETDATE())" SelectCommand="SELECT * FROM [pacientes]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="regPacTxbNombre" Name="nombre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="regPacDDLHab" Name="habitacion" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="RegPacDDLMed" Name="medico" PropertyName="SelectedValue" />
                    <asp:Parameter DefaultValue="ACTIVO" Name="estado" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>

</asp:Content>
