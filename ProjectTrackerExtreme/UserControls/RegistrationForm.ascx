<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.ascx.cs" Inherits="ProjectTrackerExtreme.UserControls.AddCommentForm" %>

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

<div class="container">
    <div class="row" style="margin-top:60px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form id="regexpEmailForm" role="form" style="width:400px; margin: 0 auto;">
                <h1>Please fill in all required fields</h1>

                <hr class="colorgraph">
        
                <div class="required-field-block">
                    <input type="text" name="txtFirstname" id="txtFirstname" placeholder="Firstname" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>

                <br />

                <div class="required-field-block">
                    <input type="text" name="txtSurname" id="txtSurname" placeholder="Surname" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>
        
                <br />

                <div class="required-field-block">
                    <input type="email" name="txtEmail" id="txtEmail" placeholder="Username (Email)" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>
        
                <br />

                <div class="required-field-block">
                    <input type="email" name="txtEmailConfirm" id="txtEmailConfirm" placeholder="Confirm your email" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>   

                <br />

                <div class="required-field-block">
                    <input type="password" name="txtPassword" id="txtPassword" placeholder="Password" class="form-control">
                    <div class="required-icon">
                        <div class="text">*</div>
                    </div>
                </div>   

                <hr class="colorgraph">

                <div class="row">
			        <div class="col-xs-6 col-sm-6 col-md-6">
				        <input id="btnRegister" name="btnRegister" type="button" class="btn btn-lg btn-primary btn-block" value="Register">
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

            $('#btnRegister').click(function () {
                if ($('#txtFirstname').val() != "" && $('#txtSurname').val() != "" && $('#txtEmailConfirm').val() != "" && $('#txtEmail').val() != "" && $('#txtPassword').val() != "")
                {
                    if ($('#txtEmailConfirm').val() == $('#txtEmail').val())
                    {
                        var apiToken = null;
                        var url = '<%= ConfigurationManager.AppSettings["API_URL"].ToString() %>';

                        $.ajax({
                            url: url + "/api/data/registration",
                            type: "POST",
                            data: {
                                firstname: $('#txtFirstname').val(),
                                surname: $('#txtSurname').val(),
                                email: $('#txtEmail').val(),
                                password: $('#txtPassword').val()
                            },
                            success: function (data) {
                                var type = "info";
                                var text = "Your data have been sent and a confirmation email has been sent to " + $('#txtEmail').val();

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
                    }
                    else
                    {
                        var type = "warning";
                        var text = "Email does not match with confirm Email!";

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