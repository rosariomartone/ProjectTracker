<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.Settings" %>

<%@ Import Namespace="System.Security.Claims" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <style>
        .content{
            text-align: justify;
            margin-top: 25px;
        }

        #scrolledtabs {
            margin-top: 10px;
        }

        #tabs {
            margin-top: 10px;
        }

        .caption{
            font-size: 16px;
            padding-bottom: 3px;
            padding-left: 10px;
        }

        .left-aligned {
            text-align: left; 
        }
    </style>
    
    <div id="longtabs">
        <hr class="colorgraph">
        <div class="tabs-container"></div>
        <br />
        <div id="usersGridContainer" style="height:70%; width:90%; margin: 0 auto">
        </div>
        <hr class="colorgraph">
    </div>

    <script>
        var longtabs = null;

        if (localStorage.getItem('ProjectTracker_Token') == null)
            document.location.href = "LoginPage.aspx";
        else {
            $(document).ready(
               function () {
                    var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';
                   var apiToken = localStorage.getItem('ProjectTracker_Token');

                   $.ajax({
                       url: url + "/api/data/authenticate",
                       type: "GET",
                       headers: {
                           'Authorization': "bearer " + apiToken,
                       },
                       success: function (data) {
                           localStorage.setItem('ProjectTracker_Token_Role', data);

                            $.ajax({
                                    url: url + "/api/data/menuvoices/" + localStorage.getItem("ProjectTracker_Token_Role"),
                                    type: "GET",
                                    headers: {
                                        'Authorization': "bearer " + apiToken,
                                    },
                                    success: function (data) {
                                        longtabs = data;

                                        $("#longtabs > .tabs-container").dxTabs({
                                            dataSource: longtabs,
                                            onItemClick: function (e) {
                                                //Users
                                                if (e.itemData.text == "Users")
                                                {
                                                    var users = null;
                                                    var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';

                                                    if (localStorage.getItem('ProjectTracker_Token') == null)
                                                        document.location.href = "LoginPage.aspx";
                                                    else
                                                    {
                                                        var apiToken = localStorage.getItem('ProjectTracker_Token');
                   
                                                        $.ajax({
                                                            url: url + "/api/data/users",
                                                            type: "GET",
                                                            headers: {
                                                                'Authorization': "bearer " + apiToken,
                                                            },
                                                            success: function (data) {
                                                                users = data;

                                                                $("#usersGridContainer").dxDataGrid({
                                                                    dataSource: users,
                                                                    columns: [
                                                                        { dataField: 'Id', width: 50, dataType: 'number', allowEditing: false },
                                                                        { dataField: 'Firstname', dataType: 'string', allowEditing: false },
                                                                        { dataField: 'Surname', dataType: 'string', allowEditing: false },
                                                                        { dataField: 'Username', dataType: 'string', allowEditing: false },
                                                                        { dataField: 'Email', dataType: 'string', allowEditing: false },
                                                                        { dataField: 'IsActive', width: 100, dataType: 'boolean', caption: 'Active' }
                                                                    ],
                                                                    selection: {
                                                                        mode: "multiple"
                                                                    },
                                                                    "export": {
                                                                        enabled: true,
                                                                        fileName: "Users",
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
                                                                    onRowUpdated: function (e) {
                                                                        var dataGrid = JSON.stringify(e.key);
                                                                        var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';
                                                                        var apiToken = localStorage.getItem('ProjectTracker_Token');
                                                                        var isActive = "0";

                                                                        if (e.key["IsActive"] == true)
                                                                            isActive = "1";

                                                                        $.ajax({
                                                                            url: url + "/api/data/usersSettings",
                                                                            type: "POST",
                                                                            headers: {
                                                                                'Authorization': "bearer " + apiToken,
                                                                            },
                                                                            data: {
                                                                                Id: e.key["Id"],
                                                                                isActive: isActive
                                                                            },
                                                                            success: function (data) {
                                                                                var type = "success";
                                                                                var text = response.responseText;

                                                                                DevExpress.ui.notify(text, type, 3000);
                                                                            },
                                                                            failure: function (response) {
                                                                                var type = "error";
                                                                                var text = response.responseText;

                                                                                DevExpress.ui.notify(text, type, 3000);
                                                                            },
                                                                            error: function (response) {
                                                                                var type = "error";
                                                                                var text = response.responseText;

                                                                                DevExpress.ui.notify(text, type, 3000);
                                                                            }
                                                                        });
                                                                    },
                                                                    wordWrapEnabled: true,
                                                                    loadPanel: {
                                                                        enabled: true
                                                                    },
                                                                    editing: {
                                                                        allowAdding: false,
                                                                        allowUpdating: true,
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
                                                                    groupPanel: {
                                                                        visible: true
                                                                    },
                                                                    grouping: {
                                                                        autoExpandAll: true,
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
                                                }
                                                //Labels
                                            }
                                        });

                                    },
                                    failure: function (response) {
                                        var type = "error";
                                        var text = response.responseText;

                                        DevExpress.ui.notify(text, type, 3000);
                                    },
                                    error: function (response) {
                                        var type = "error";
                                        var text = response.responseText;

                                        DevExpress.ui.notify(text, type, 3000);
                                    }
                                });
                       },
                       failure: function (response) {
                           $('#btnLogin').prop('disabled', false);

                           var type = "error";
                           var text = response.responseText;

                           DevExpress.ui.notify(text, type, 3000);
                       },
                       error: function (response) {
                           $('#btnLogin').prop('disabled', false);

                           var type = "error";
                           var text = response.responseText;

                           DevExpress.ui.notify(text, type, 3000);
                       }
                   });
               });
        }
    </script>
</asp:Content>