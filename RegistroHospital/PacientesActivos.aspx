<%@ Page Title="PacientesActivos" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PacientesActivos.aspx.vb" Inherits="RegistroHospital.PacientesActivos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">

        <div id="contenedorTablaPacientesActivos" class="">

            <h2>PACIENTES ACTIVOS</h2>
            <br />

            <label for="PATxbBusNomPac">Nombre del Paciente</label>
            <asp:TextBox ID="PATxbBusNomPac" runat="server" CssClass="form-control" placeholder="Presiona ENTER para buscar..."></asp:TextBox>
            <br />

            <asp:GridView ID="GV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DsPacientesActivos" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" DataKeyNames="idPaciente">
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="SELECCIONAR" ShowSelectButton="True" />
                    <asp:BoundField DataField="idPaciente" HeaderText="ID" SortExpression="idPaciente" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" SortExpression="nombre" />
                    <asp:BoundField DataField="medico" HeaderText="MEDICO" SortExpression="medico"/>
                    <asp:BoundField DataField="habitacion" HeaderText="HABITACIÓN" SortExpression="habitacion" />
                    <asp:BoundField DataField="fechaIngreso" HeaderText="FECHA DE INGRESO" SortExpression="fechaIngreso" DataFormatString = "{0:dd/MM/yyyy}" />
                </Columns>
                <HeaderStyle CssClass="header" />
                <PagerStyle CssClass="pager" />
                <RowStyle CssClass="rows" />
            </asp:GridView>
            
            <div hidden>
                <br />
                <label for="SelIdPac">ID</label>
                <asp:TextBox ID="SelIdPac" runat="server"></asp:TextBox>
                <label for="SelNumHab">HABITACIÓN</label>
                <asp:TextBox ID="SelNumHab" runat="server"></asp:TextBox>
            </div>

            <br />
            <asp:Button ID="Button1" runat="server" Text="DAR DE ALTA" class="btn1 btn-block"/>

            <asp:SqlDataSource ID="DsPacientesActivos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" 
                SelectCommand="SELECT idPaciente, fechaIngreso, medico, habitacion, nombre FROM pacientes WHERE (estado = 'ACTIVO')">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsPacientesActivosBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT idPaciente, fechaIngreso, medico, habitacion, nombre FROM pacientes WHERE (estado = 'ACTIVO') AND (nombre LIKE N'%' + @nombre + N'%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="PATxbBusNomPac" Name="nombre" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="DsUpdAlta1" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [pacientes]" UpdateCommand="UPDATE pacientes SET estado = 'INACTIVO', fechaEgreso = GETDATE() WHERE idPaciente = @idPaciente">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="SelIdPac" Name="idPaciente" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsUpdAlta2" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [habitaciones]" UpdateCommand="UPDATE habitaciones SET estado = 'LIBRE' WHERE numHabitacion = @numHabitacion">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="SelNumHab" Name="numHabitacion" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
    </asp:Panel>

</asp:Content>
