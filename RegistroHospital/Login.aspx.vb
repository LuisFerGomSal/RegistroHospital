Public Class Login2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") <> Nothing Then                    ' Varifica que la variable de sesion Usuario este vacia, en caso contrario redirecciona al usuario a la pagina de Pacientes Activos.
            Response.Redirect("~/PacientesActivos.aspx")
        End If
    End Sub

    Protected Sub loginBtnRegistro_Click(sender As Object, e As EventArgs) Handles loginBtnRegistro.Click
        Panel1.Visible = False ' Modifica la propiedad Visible de los paneles.
        Panel2.Visible = True
    End Sub

    Protected Sub registroBtnLogin_Click(sender As Object, e As EventArgs) Handles registroBtnLogin.Click
        Panel1.Visible = True    ' Modifica la propiedad Visible de los paneles.
        Panel2.Visible = False
    End Sub

    Protected Sub loginBtnLogin_Click(sender As Object, e As EventArgs) Handles loginBtnLogin.Click
        Dim dv As DataView = DirectCast(DsValidarUsuario.Select(DataSourceSelectArguments.Empty), DataView)
        If dv IsNot Nothing AndAlso dv.Count <> 0 Then
            Session("Usuario") = loginTxbUsuario.Text    ' Si el numero de resultados del query en diferente de 0
            Response.Redirect("~/PacientesActivos.aspx") ' ejecuta el código dentro de la estructura If.
        Else
            Response.Write("<script type='text/javascript'> alert('Usuario no encontrado') </script>") ' Muestra un mensaje de confirmacion.
            loginTxbUsuario.Text = "" ' Limpia los campos del
            loginTxbClave.Text = ""   ' formulario y posiciona el cursor
            loginTxbUsuario.Focus()   ' en el TextBox de nombre de usuario.
        End If
    End Sub

    Protected Sub registroBtnRegistrar_Click(sender As Object, e As EventArgs) Handles registroBtnRegistrar.Click
        DsRegistrarUsuario.Insert() ' Registra al nuevo usuario al realizar un insert en la tabla 'usuarios'.
        Response.Write("<script type='text/javascript'> alert('Usuario registrado') </script>")  ' Muestra un mensaje de confirmacion del registro.
        Panel1.Visible = False  ' Modifica la propiedad Visible de los paneles.
        Panel2.Visible = True
    End Sub
End Class