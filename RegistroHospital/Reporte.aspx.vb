Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Public Class Reporte
    Inherits System.Web.UI.Page
    Dim oDoc As New Document(PageSize.LETTER, 0, 0, 0, 0)
    Dim pdfw As PdfWriter
    Dim cb As PdfContentByte
    Dim fuente As BaseFont

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("IdConsulta") = Nothing Then  'Verifica que la variable de sesion IdConsulta tenga un valor asignado. En caso contrario redirecciona a la pagina de consultas.
            Response.Redirect("~/Consultas.aspx")
        End If

        Dim RutaDirectorio As String = Server.MapPath("~/Docs/" + Session("IdConsulta").ToString + "/") ' Se define la ruta donde se almacenara el archivo pdf.
        If Directory.Exists(RutaDirectorio) = False Then
            Directory.CreateDirectory(RutaDirectorio) 'En caso de no existir la ruta, se crea.
        End If
        Try
            If File.Exists(Server.MapPath("~/Docs/" + Session("IdConsulta").ToString + "/" + "Reporte.pdf")) Then
                If oDoc.IsOpen Then oDoc.Close()
                File.Delete(Server.MapPath("~/Docs/" + Session("IdConsulta").ToString + "/" + "Reporte.pdf"))
            End If
        Catch ex As Exception
        End Try

        Dim oldFile As String = Server.MapPath("~/Docs/" + "SampleFinalV2.pdf") 'PLANTILLA PDF PARA REPORTE
        Dim newFile As String = Server.MapPath("~/Docs/" + Session("IdConsulta").ToString + "/" + "Reporte.pdf") 'Creacion del nuevo archivo, se le asigna la variable de sesion IdConsulta como nombre.
        Dim reader As PdfReader = New PdfReader(oldFile) 'Se crea el objeto PdfReader, lector para el pdf.
        Dim size As Rectangle = reader.GetPageSizeWithRotation(1) 'Se definen las dimensiones del lector pdf.
        Dim document As Document = New Document(size) 'Se crea objeto de tipo Document
        Dim fs As FileStream = New FileStream(newFile, FileMode.Create, FileAccess.Write)
        Dim writer As PdfWriter = PdfWriter.GetInstance(document, fs) 'Se crea un objeto de tipo PdfWriter para editar el archivo PDF.
        document.Open()
        Dim cb As PdfContentByte = writer.DirectContent
        Dim bf As BaseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED)
        cb.SetColorFill(BaseColor.BLACK)
        cb.SetFontAndSize(bf, 12)

        cb.BeginText()

        Dim dv As DataView = DirectCast(DsReportePaciente.Select(DataSourceSelectArguments.Empty), DataView) 'Se crea un objeto donde se almacena el resultado del DataSource.

        cb.ShowTextAligned(0, dv.Table.Rows(0)(0).ToString, 50, 610, 0)  'ID                        ' Extrae el contenido del objeto dv.
        cb.ShowTextAligned(0, dv.Table.Rows(0)(1).ToString, 120, 610, 0) 'NOMBRE
        cb.ShowTextAligned(0, dv.Table.Rows(0)(2).ToString, 50, 549, 0)  'HABITACION
        cb.ShowTextAligned(0, dv.Table.Rows(0)(3).ToString, 50, 486, 0)  'MEDICO ASIGNADO
        cb.ShowTextAligned(0, dv.Table.Rows(0)(4).ToString, 180, 549, 0) 'ESTADO
        cb.ShowTextAligned(0, dv.Table.Rows(0)(5).ToString, 310, 549, 0) 'FECHA DE INGRESO
        cb.ShowTextAligned(0, dv.Table.Rows(0)(6).ToString, 445, 549, 0) 'FECHA DE EGRESO

        cb.EndText()

        Dim page As PdfImportedPage = writer.GetImportedPage(reader, 1)
        cb.AddTemplate(page, 0, 0)
        document.Close()
        fs.Close()
        writer.Close()
        reader.Close()
        pdfvisor.Src = "~/Docs/" + Session("IdConsulta").ToString + "/" + "Reporte.pdf" 'Abre el archivo en el visor pdf.

    End Sub

End Class