<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reporte.aspx.vb" Inherits="RegistroHospital.Reporte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link rel="stylesheet" href="Content/Site.css" />
    <title>Reporte</title>
</head>
<body>
    <div>
        <form id="form1" runat="server">
            <div class="contenedorReporte">
                <p align="center"><iframe class="lectorPdf" id="pdfvisor" runat="server" style="width: 640px; height: 850px;" visible="True"></iframe></p>
                <asp:SqlDataSource ID="DsReportePaciente" runat="server" ConnectionString="<%$ ConnectionStrings:CS_Hospital_Gomez_Sladana %>" SelectCommand="SELECT * FROM [pacientes] WHERE idPaciente = @ID">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="IdConsulta" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div>
                <br />
                <p align="center"><asp:Button width="640px" ID="BtnRegresar" class="btn1 btn-block" runat="server" Text="REGRESAR" OnClientClick="javascript:history.back(); return false;"/></p>
            </div>
        </form>
    </div>
</body>
</html>
