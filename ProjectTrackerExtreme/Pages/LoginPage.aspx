<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="btn btn-group">
        username : <input type="text" id="txtUsername" />
        password : <input type="password" id="txtPassword" />

        <br /> <br />
        <input type="button" id="btnLogin" value="Login" class="btn btn-success" />

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
                            alert(response.responseText);
                            document.location.href = "LoginPage.aspx";
                        },
                        error: function (response) {
                            alert(response.responseText);
                            document.location.href = "LoginPage.aspx";
                        }
                    });
                })
            );
    </script>
    </div>
</asp:Content>