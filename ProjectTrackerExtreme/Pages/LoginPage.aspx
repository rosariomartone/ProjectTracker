<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <div class="container container-table">
        <div class="row vertical-center-row">
            <div class="text-center col-md-4 col-md-offset-4">
                <span class="input-group-addon" id="basic-addon1">username:</span><br />
                <input type="text" id="txtUsername" aria-describedby="basic-addon1" style="width:100%" />
            </div>
        </div>
    </div>
    <br />
    <div class="container container-table">
        <div class="row vertical-center-row">
            <div class="text-center col-md-4 col-md-offset-4">
                <span class="input-group-addon" id="basic-addon2">passord:</span><br />
                <input type="password" id="txtPassword" aria-describedby="basic-addon2" style="width:100%" />
            </div>
        </div>
    </div>
    <br /><br />
    <div class="container container-table">
        <div class="row vertical-center-row">
            <div class="text-center col-md-4 col-md-offset-4">
                <input type="button" id="btnLogin" value="Login" class="btn btn-success center-block" />
            </div>
        </div>
    </div>
    <script>
        $(document).ready(
            $('#btnLogin').click(function () {
                var apiToken = null;

                $.ajax({
                    url: "http://localhost/ProjectTracker/token",
                    type: "POST",
                    data : {
                        username : $('#txtUsername').val(),
                        password : $('#txtPassword').val(),
                        grant_type : "password"
                    },
                    success: function (data) {
                        localStorage.setItem("ProjectTracker_Token", data.access_token);
                        document.location.href = "Opportunities.aspx";
                    },
                    failure: function (response) {
                        var type = "error";
                        var text = response.responseText;

                        DevExpress.ui.notify(text, type, 600);
                    },
                    error: function (response) {
                        var type = "error";
                        var text = response.responseText;

                        DevExpress.ui.notify(text, type, 600);
                    }
                });
            })
        );
    </script>
</asp:Content>