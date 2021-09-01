Public Class Consultas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") = Nothing Then  'Verifica que la variable de sesion Usuario tenga un valor asignado. En caso contrario redirecciona a la pantalla de Login.
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub DDLTipoDato_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLTipoDato.SelectedIndexChanged
        TbxBusqueda.Text = "" 'Limpia el campo de texto cada vez que se ejecute este codigo.
        Dim datasource As String = GridView1.DataSourceID.ToString() 'Convierte el nombre del DataSource asignado al GridView en una cadena de texto
        If DDLTipoDato.Text = "ID" Then
            GridView1.DataSourceID = "DsPacientesID"               ' Cambia el DataSource asignado al GridView cuando el cambia el texto del DropDownList.
        ElseIf DDLTipoDato.Text = "HABITACION" Then
            GridView1.DataSourceID = "DsPacientesHabitacion"
        ElseIf DDLTipoDato.Text = "NOMBRE" Then
            GridView1.DataSourceID = "DsPacientesNombre"
        ElseIf DDLTipoDato.Text = "MEDICO" Then
            GridView1.DataSourceID = "DsPacientesMedico"
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        TxbID.Text = GridView1.SelectedRow.Cells(1).Text                      ' Asigna los valores del registro
        TxbNombre.Text = GridView1.SelectedRow.Cells(2).Text                  ' seleccionado a los campos
        DDLHabitaciones.SelectedValue = GridView1.SelectedRow.Cells(3).Text   ' del formulario.
        DDLMedicos.SelectedValue = GridView1.SelectedRow.Cells(4).Text
        TxbEstado.Text = GridView1.SelectedRow.Cells(5).Text
        Session("IdConsulta") = GridView1.SelectedRow.Cells(1).Text
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        DsLiberarHabitacion2.Update() 'Asigna el estado LIBRE a la habitacion en la tabla 'habitaciones' 
        DsAccionesRegistroSeleccionado.Delete() 'Elimina el registro del paciente de la tabla 'pacientes'

        TxbID.Text = ""      ' Limpia los campos de texto del paciente previamente seleccionado
        TxbNombre.Text = ""
        TxbEstado.Text = ""

        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        DsLiberarHabitacion2.Update() 'Asigna el estado LIBRE a la habitacion en la tabla 'habitaciones' 
        DsAccionesRegistroSeleccionado.Update() 'Actualiza la informacion del registro del paciente en la tabla 'pacientes'
        If TxbEstado.Text = "ACTIVO" Then
            DsAsignarHabitacion.Update() 'Asigna el estado EN USO a la habitacion asignada al paciente en la tabla 'habitaciones'
        End If

        TxbID.Text = ""        ' Limpia los campos de texto del formulario.
        TxbNombre.Text = ""
        TxbEstado.Text = ""

        GridView1.DataBind() 'Actualiza la información del GridView.
    End Sub

    Protected Sub BtnReporteConsulta_Click(sender As Object, e As EventArgs) Handles BtnReporteConsulta.Click
        Response.Redirect("~/Reporte.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        GridView1.DataSourceID = "DsPacientes" 'Asiga el DataSource 'DsPacientes' al GridView.
    End Sub

    Protected Sub DsPacientes_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientes.Updated
        GridView1.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

    Protected Sub DsPacientesID_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesID.Updated
        GridView1.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

    Protected Sub DsPacientesHabitacion_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesHabitacion.Updated
        GridView1.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

    Protected Sub DsPacientesNombre_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesNombre.Updated
        GridView1.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

    Protected Sub DsPacientesMedico_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesMedico.Updated
        GridView1.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

End Class