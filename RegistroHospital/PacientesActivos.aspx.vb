Public Class PacientesActivos
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Usuario") = Nothing Then  ' Verifica que haya un valor asignado a la variable de sesion Usuario
            Response.Redirect("~/Login.aspx") ' en caso contrario, redirecciona al usuario a la pagina de Login.
        End If
    End Sub

    Protected Sub PATxbBusNomPac_TextChanged(sender As Object, e As EventArgs) Handles PATxbBusNomPac.TextChanged
        Dim datasource As String = GV.DataSourceID.ToString()
        If datasource = "DsPacientesActivos" Then         ' Cuando se escribe texto en el campo cambia al DataSource a uno
            GV.DataSourceID = "DsPacientesActivosBusqueda" ' uno que realiza busquedas con el campo de txto.
        Else
            GV.DataSourceID = "DsPacientesActivos"
        End If
        If PATxbBusNomPac.Text = "" Then             ' Cuando el campo de texto esta vacio asigna un DataSource
            GV.DataSourceID = "DsPacientesActivos"   ' al GridView que hace una busqueda general ya definida.
        End If
    End Sub

    Protected Sub GV_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GV.SelectedIndexChanged
        SelIdPac.Text = GV.SelectedRow.Cells(1).Text ' Asigna los valores del GridView a los campos de texto.
        SelNumHab.Text = GV.SelectedRow.Cells(4).Text
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        DsUpdAlta1.Update() 'Da de alta al paciente cambiando su estado a INACTIVO en la tabla 'pacientes'.
        DsUpdAlta2.Update() 'Libera la habitacion asignada al paciente, cambiando su estado a LIBRE en la tabla 'habitaciones'.
    End Sub

    Protected Sub DsPacientesActivos_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesActivos.Updated
        GV.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub

    Protected Sub DsPacientesActivosBusqueda_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles DsPacientesActivosBusqueda.Updated
        GV.DataBind() 'Actualiza la información del GridView cuando se actualiza el DataSource.
    End Sub
End Class