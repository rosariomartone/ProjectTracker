<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangeUserPassword.ascx.cs" Inherits="ProjectTrackerExtreme.UserControls.ChangeUserPassword" %>

<style type="text/css">
    /* Required field START */

.required-field-block {
    position: relative;   
}

.required-field-block .required-icon {
    display: inline-block;
    vertical-align: middle;
    margin: -0.25em 0.25em 0em;
    background-color: #E8E8E8;
    border-color: #E8E8E8;
    padding: 0.5em 0.8em;
    color: rgba(0, 0, 0, 0.65);
    text-transform: uppercase;
    font-weight: normal;
    border-radius: 0.325em;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: background 0.1s linear;
    -moz-transition: background 0.1s linear;
    transition: background 0.1s linear;
    font-size: 75%;
}
	
.required-field-block .required-icon {
    background-color: transparent;
    position: absolute;
    top: 0em;
    right: 0em;
    z-index: 10;
    margin: 0em;
    width: 30px;
    height: 30px;
    padding: 0em;
    text-align: center;
    -webkit-transition: color 0.2s ease;
    -moz-transition: color 0.2s ease;
    transition: color 0.2s ease;
}

.required-field-block .required-icon:after {
    position: absolute;
    content: "";
    right: 1px;
    top: 1px;
    z-index: -1;
    width: 0em;
    height: 0em;
    border-top: 0em solid transparent;
    border-right: 30px solid transparent;
    border-bottom: 30px solid transparent;
    border-left: 0em solid transparent;
    border-right-color: inherit;
    -webkit-transition: border-color 0.2s ease;
    -moz-transition: border-color 0.2s ease;
    transition: border-color 0.2s ease;
}

.required-field-block .required-icon .text {
	color: #B80000;
	font-size: 26px;
	margin: -3px 0 0 12px;
}
/* Required field END */

</style>

<script>
    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';

        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
</script>

<div class="container">
    <div class="row" style="margin-top:60px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form id="regexpEmailForm" role="form" style="width:400px; margin: 0 auto;">
                <h1>Please fill in all required fields</h1>

                <hr class="colorgraph">
        
                <div class="required-field-block">
                    <input type="password" name="txtPassword" id="txtPassword" placeholder="Password" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>

                <div class="required-field-block">
                    <input type="password" name="txtConfirmPassword" id="txtConfirmPassword" placeholder="Confirm your password" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>

                <hr class="colorgraph">

                <div class="row">
			        <div class="col-xs-6 col-sm-6 col-md-6">
				        <input id="btnChangePassword" name="btnChangePassword" type="button" class="btn btn-lg btn-primary btn-block" value="Change password">
			        </div>
		        </div>
        
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(
        $(function() {
            $('.required-icon').tooltip({
                placement: 'left',
                title: 'Required field'
            });

            $('#btnChangePassword').click(function () {
                if ($('#txtPassword').val() != "" && $('#txtConfirmPassword').val() != "")
                {
                    if ($('#txtPassword').val() == $('#txtConfirmPassword').val())
                    {
                        $('#btnChangePassword').prop('disabled', true);

                        var apiToken = null;
                        var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';

                        $.ajax({
                            url: url + "/api/data/changePassword",
                            type: "POST",
                            data: {
                                token: getParameterByName('token'),
                                password: $('#txtPassword').val()
                            },
                            success: function (data) {
                                var type = "info";
                                var text = "Password changed. Is it now possible to Sign In.";

                                DevExpress.ui.notify(text, type, 3000);
                            },
                            failure: function (response) {
                                $('#btnChangePassword').prop('disabled', false);

                                var type = "error";
                                var text = response.responseText;

                                DevExpress.ui.notify(text, type, 3000);
                            },
                            error: function (response) {
                                $('#btnChangePassword').prop('disabled', false);

                                var type = "error";
                                var text = response.responseText;

                                DevExpress.ui.notify(text, type, 3000);
                            }
                        });
                    }
                    else {
                        var type = "warning";
                        var text = "Password does not match with confirm Password!";

                        DevExpress.ui.notify(text, type, 3000);
                    }
                }
                else
                {
                    var type = "warning";
                    var text = "Required fields not set!";

                    DevExpress.ui.notify(text, type, 3000);
                }                
            });
        })
    );
</script>