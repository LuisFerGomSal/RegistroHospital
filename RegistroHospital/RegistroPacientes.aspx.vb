Public Class RegistroPacientes
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Usuario") = Nothing Then     ' Verifica que la variable de sesion Usuario tenga un valor asignado, en caso contrario redirecciona al usuario a la pagina de Login.
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub RegPacBtnRegistrar_Click(sender As Object, e As EventArgs) Handles RegPacBtnRegistrar.Click
        DsRegistroPaciente.Insert() 'Registra al paciente al insertarlo en la tabla de 'pacientes'.
        DsOcuparHabitacion.Update() 'Asigna el estado de EN USO a la habitación en que se registro el paciente en la tabla 'habitaciones'.
        regPacDDLHab.DataBind() 'Funcion que vuelve a cargar los elementos del DataSource seleccionado.
        regPacDDLHab.SelectedIndex = 0 'Posiciona la selección del DropDownList en el indice 0.
    End Sub

End Class