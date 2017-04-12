<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SettingsUser.ascx.cs" Inherits="ProjectTrackerExtreme.UserControls.SettingsUser" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<div class="container">
    <div class="row" style="margin-top:60px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form id="regexpEmailForm" role="form" style="width:400px; margin: 0 auto;">
                <h1>List of Users</h1>

                <hr class="colorgraph">

                <div id="gridContainer" style="height:70%; width:90%; margin: 0 auto">
                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <rsweb:ReportViewer ID="rvExample" runat="server" ProcessingMode="Remote">
                    </rsweb:ReportViewer>--%>      
                </div>    

                <hr class="colorgraph">

            </form>
        </div>
    </div>
</div>