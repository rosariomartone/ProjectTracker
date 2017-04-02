<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="Opportunities.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.Opportunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <br />
    <div id="gridContainer" style="height:420px; width:90%; margin: 0 auto"></div>
    <script>
        $(document).ready(
           function () {
               var opportunities = null;

               if (localStorage.getItem('ProjectTracker_Token') == null)
                   document.location.href = "LoginPage.aspx";
               else
               {
                   var apiToken = localStorage.getItem('ProjectTracker_Token');
                   
                   $.ajax({
                       url: "http://localhost/ProjectTracker/api/data/opportunities",
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
                                   { dataField: 'Name', allowGrouping: false }
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
                               allowColumnReordering: true,
                               //rowAlternationEnabled: true,
                               wordWrapEnabled: true,
                               loadPanel: {
                                   enabled: true
                               },
                               scrolling: {
                                   mode: "virtual"
                               },
                               editing: {
                                   allowAdding: false,
                                   allowUpdating: false,
                                   mode: "batch"
                               },
                               sorting: { mode: 'multiple' },
                               pager: {
                                   allowedPageSizes: [5, 8, 15, 30],
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
                           alert(response.responseText);
                       },
                       error: function (response) {
                           alert(response.responseText);
                       }
                   });
               }
        }); 
    </script>
</asp:Content>