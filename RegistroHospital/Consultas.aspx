<%@ Page Title="Consultas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Consultas.aspx.vb" Inherits="RegistroHospital.Consultas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <div>
            <h2>BÚSQUEDA DE REGISTROS</h2>

            <br />

            <div class="row">
                <div class="form-group col-md-2">
                    <label for="DDLTipoDato">Tipo de Busqueda</label>
                    <asp:DropDownList ID="DDLTipoDato" runat="server" AutoPostBack="True" Class="form-control">
                        <asp:ListItem>HABITACION</asp:ListItem>
                        <asp:ListItem>ID</asp:ListItem>
                        <asp:ListItem>NOMBRE</asp:ListItem>
                        <asp:ListItem>MEDICO</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-7">
                    <label for="TxbBusqueda">Ingresa tu Busqueda</label>
                    <asp:TextBox ID="TbxBusqueda" runat="server" Class="form-control" placeholder="Presiona ENTER para buscar..."></asp:TextBox>
                </div>
                <div class= "form-group col-md-3">
                    <asp:Button ID="Button3" runat="server" Text="Mostrar Todos los Registros" class="btn1 btn-block"/>
                    <br />
                    <asp:SqlDataSource ID="DsPacientes" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT idPaciente, nombre, habitacion, medico, estado, fechaIngreso, fechaEgreso FROM pacientes"></asp:SqlDataSource>
                </div>
            </div>

            <br />

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="DsPacientesHabitacion" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="False" DataKeyNames="idPaciente">
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="SELECCIONAR" ShowSelectButton="True" />
                    <asp:BoundField DataField="idPaciente" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idPaciente" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" SortExpression="nombre" />
                    <asp:BoundField DataField="habitacion" HeaderText="HABITACION" SortExpression="habitacion" />
                    <asp:BoundField DataField="medico" HeaderText="MEDICO" SortExpression="medico" />
                    <asp:BoundField DataField="estado" HeaderText="ESTADO" SortExpression="estado" />
                    <asp:BoundField DataField="fechaIngreso" HeaderText="FECHA DE INGRESO" SortExpression="fechaIngreso" DataFormatString = "{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="fechaEgreso" HeaderText="FECHA DE EGRESO" SortExpression="fechaEgreso" DataFormatString = "{0:dd/MM/yyyy}"/>
                </Columns>
                <HeaderStyle CssClass="header" />
                <PagerStyle CssClass="pager" />
                <RowStyle CssClass="rows" />
            </asp:GridView>
            <asp:SqlDataSource ID="DsPacientesHabitacion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT idPaciente, nombre, habitacion, medico, estado, fechaIngreso, fechaEgreso FROM pacientes WHERE (habitacion = @busqueda)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TbxBusqueda" Name="busqueda" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsPacientesID" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [pacientes] WHERE idPaciente = @busqueda">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TbxBusqueda" Name="busqueda" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsPacientesNombre" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [pacientes] WHERE nombre LIKE N'%' + @busqueda + N'%'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TbxBusqueda" Name="busqueda" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsPacientesMedico" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [pacientes] WHERE medico LIKE N'%' + @busqueda + N'%'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TbxBusqueda" Name="busqueda" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>     

            <h2>MODIFICAR REGISTRO</h2>

            <br />

            <div class="row">
                <div class="form-group col-md-4">
                    <label for="TxbID">ID</label>
                    <asp:TextBox ID="TxbID" runat="server" CssClass="form-control" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <label for="TxbEstado">Estado</label>
                    <asp:TextBox ID="TxbEstado" runat="server" CssClass="form-control" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                </div>

                <div class="form-group col-md-4">
                    <label for="DDLHabitaciones">Habitacion</label>
                    <asp:DropDownList ID="DDLHabitaciones" runat="server" DataSourceID="DsHabitaciones" DataTextField="numHabitacion" DataValueField="numHabitacion" AutoPostBack="True" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>

            <label for="TxbNombre">Nombre</label>
            <asp:TextBox ID="TxbNombre" runat="server" CssClass="form-control" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>

            <asp:SqlDataSource ID="DsHabitaciones" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [habitaciones]"></asp:SqlDataSource>

            <br />

            <label for="DDLMedicos">Medico Asignado</label>
            <asp:DropDownList ID="DDLMedicos" runat="server" DataSourceID="DsMedicos" DataTextField="nombre" DataValueField="nombre" AutoPostBack="True" CssClass="form-control">
            </asp:DropDownList>

            <asp:SqlDataSource ID="DsMedicos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [medicos]"></asp:SqlDataSource>

            <br />

            <div class="row">

                <div class="form-group col-md-4">
                    <asp:Button ID="Button1" runat="server" Text="GUARDAR MODIFICACIONES" class="btn1 btn-block"/>
                </div>

                <div class="form-group col-md-4">
                    <asp:Button ID="Button2" runat="server" Text="ELIMINAR REGISTRO" class="btn3 btn-block"/>
                </div>

                <div class="form-group col-md-4">
                    <asp:Button ID="BtnReporteConsulta" runat="server" Text="GENERAR REPORTE" class="btn1 btn-block"/>
                </div>

            </div>

            
            

            <asp:SqlDataSource ID="DsAccionesRegistroSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" DeleteCommand="DELETE FROM pacientes WHERE idPaciente = @idPaciente" SelectCommand="SELECT * FROM [pacientes]" UpdateCommand="UPDATE pacientes SET nombre = @nombre, habitacion = @habitacion, medico = @medico WHERE idPaciente = @idPaciente">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="TxbID" Name="idPaciente" PropertyName="Text" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxbNombre" Name="nombre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLHabitaciones" Name="habitacion" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLMedicos" Name="medico" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxbID" Name="idPaciente" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsAsignarHabitacion" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [habitaciones]" UpdateCommand="UPDATE habitaciones SET estado = 'EN USO' WHERE numHabitacion = @habitacion">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DDLHabitaciones" Name="habitacion" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DsLiberarHabitacion2" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [habitaciones]" UpdateCommand="UPDATE habitaciones SET estado = 'LIBRE' FROM habitaciones INNER JOIN pacientes ON habitaciones.numHabitacion = pacientes.habitacion WHERE (pacientes.idPaciente = @ID)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxbID" Name="ID" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>
</asp:Content>
