<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
            <div class="row" style="margin-top:60px">
                <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">    	        
			        <fieldset>
				        <h2>Please Sign In</h2>
				        <hr class="colorgraph">
                        <div class="form-group">
                            <input type="email" name="txtUsername" id="txtUsername" class="form-control input-lg" placeholder="email">
				        </div>
				        <div class="form-group">
                            <input type="password" name="txtPassword" id="txtPassword" class="form-control input-lg" placeholder="password">
					        <a href="ForgottenPage.aspx" class="btn btn-link pull-right">Forgot Password?</a>
				        </div>
				        <hr class="colorgraph">
				        <div class="row">
					        <div class="col-xs-6 col-sm-6 col-md-6">
						        <a href="RegistrationPage.aspx" class="btn btn-lg btn-primary btn-block">Register</a>
					        </div>
					        <div class="col-xs-6 col-sm-6 col-md-6">
                                <input id="btnLogin" name="btnLogin" type="button" class="btn btn-lg btn-success btn-block" value="Sign In">
					        </div>
				        </div>
			        </fieldset>		        
	            </div>
            </div>
    </div>  
    <script>
        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }

        function validate() {
            var email = $("#txtUsername").val();

            if (!validateEmail(email)) 
            {
                var type = "error";
                var text = "Email non valid!";

                DevExpress.ui.notify(text, type, 3000);

                return true;
            }
            else
                return true;
        }

        $(document).ready(
            $('#btnLogin').click(function () {
                if (validate())
                {
                    if ($('#txtUsername').val() != "" && $('#txtPassword').val() != "")
                    {
                        $('#btnLogin').prop('disabled', true);

                        var apiToken = null;
                        var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';

                        $.ajax({
                            url: url + "/token",
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
                    }
                    else
                    {
                        var type = "warning";
                        var text = "Required fields not set!";

                        DevExpress.ui.notify(text, type, 3000);
                    }
                }
            })
        );
    </script>
</asp:Content>