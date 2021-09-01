Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Usuario") = Nothing Then 'Si no hay un valor asignado a la variable de sesion Usuario
            item_nav1.Visible = False        'los items del menu no se muestra.
            item_nav2.Visible = False
            item_nav3.Visible = False
            itemNav5.Visible = False
        End If
    End Sub

    Protected Sub itemNav5_Click(sender As Object, e As EventArgs) Handles itemNav5.Click
        Session("Usuario") = Nothing       ' Borra las variables de sesión y redirecciona
        Session("Rol") = Nothing           ' al usuario a la pantalla de login.
        Session("IdConsulta") = Nothing
        Response.Redirect("~/Login.aspx")
    End Sub
End Class