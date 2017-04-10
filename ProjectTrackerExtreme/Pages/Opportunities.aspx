<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="Opportunities.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.Opportunities" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <br />
    <div id="gridContainer" style="height:70%; width:90%; margin: 0 auto">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="rvExample" runat="server" ProcessingMode="Remote">
        </rsweb:ReportViewer>--%>      
    </div>
    <script>
        $(document).ready(
           function () {
               var opportunities = null;
               var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';

               if (localStorage.getItem('ProjectTracker_Token') == null)
                   document.location.href = "LoginPage.aspx";
               else
               {
                   var apiToken = localStorage.getItem('ProjectTracker_Token');
                   
                   $.ajax({
                       url: url + "/api/data/opportunities",
                       type: "GET",
                       headers: {
                           'Authorization': "bearer " + apiToken,
                       },
                       success: function (data) {
                           opportunities = data;

                           $("#gridContainer").dxDataGrid({
                               dataSource: opportunities,
                               columns: [
                                   { dataField: 'Id', width: 50 },
                                   { dataField: 'Name' },
                                   {
                                       width: 100,
                                       alignment: 'center',
                                       cellTemplate: function (container, options) {
                                           $('<a/>').addClass('dx-text')
                                               .text('DETAILS')
                                               .on('dxclick', function () {
                                                   alert(options.data.Id);
                                               })
                                               .appendTo(container);
                                       }
                                   }
                               ],
                               selection: {
                                   mode: "multiple"
                               },
                               "export": {
                                   enabled: true,
                                   fileName: "Opportunities",
                                   allowExportSelectedData: true
                               },
                               columnChooser: {
                                   enabled: true,
                                   mode: "select"
                               },
                               showBorders: true,
                               allowColumnReordering: true,
                               rowAlternationEnabled: true,
                               onRowPrepared: function (e) {
                                   if (e.rowType == 'data') {
                                       e.rowElement[0].addEventListener("mouseover", function () {
                                           e.rowElement.find("td").css('background', '#ffdb71');
                                           e.rowElement.css("transition", "background-color 0.5s");
                                       });
                                       e.rowElement[0].addEventListener("mouseleave", function () {
                                           e.rowElement.find("td").css('background', "");
                                       });
                                   }
                               },
                               wordWrapEnabled: true,
                               loadPanel: {
                                   enabled: true
                               },
                               editing: {
                                   allowAdding: false,
                                   allowUpdating: false,
                                   mode: "batch"
                               },
                               sorting: { mode: 'multiple' },
                               pager: {
                                   allowedPageSizes: [10, 20, 50],
                                   showInfo: true,
                                   showNavigationButtons: true,
                                   showPageSizeSelector: true,
                                   visible: true
                               },
                               paging: { pageSize: 10 },
                               filterRow: { visible: true },
                               searchPanel: { visible: true },
                               selection: { mode: 'multiple' },
                               hoverStateEnabled: true
                           });
                       },
                       failure: function (response) {
                           var type = "error";
                           var text = response.responseText;

                           DevExpress.ui.notify(text, type, 3000);

                           localStorage.removeItem('ProjectTracker_Token');
                           document.location.href = "LoginPage.aspx";
                       },
                       error: function (response) {
                           var type = "error";
                           var text = response.responseText;

                           DevExpress.ui.notify(text, type, 3000);
                           localStorage.removeItem('ProjectTracker_Token');
                           document.location.href = "LoginPage.aspx";
                       }
                   });
               }
        }); 
    </script>
</asp:Content>