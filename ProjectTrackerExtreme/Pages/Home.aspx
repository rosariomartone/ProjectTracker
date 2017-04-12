<%@ Page Title="Home" Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeBehind="Home.aspx.cs" Inherits="ProjectTrackerExtreme.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="container-fluid">
    <div class="row">
        <dx:ASPxImageSlider ID="ImageSlider" runat="server" Width="100%" Height="400px" ImageSourceFolder="~/Content/Images/Components">
            <SettingsImageArea ImageSizeMode="FillAndCrop" NavigationButtonVisibility="Always" EnableLoopNavigation="true" />
            <SettingsNavigationBar Mode="Dots" />
            <SettingsSlideShow AutoPlay="true" PlayPauseButtonVisibility="OnMouseOver" />
        </dx:ASPxImageSlider>
    </div>
</div>
<div class="container">
    <section class="row text-center">
        <div class="col-md-12">
            <h1>ASP.NET Bootstrapped Web Site for</h1>
            <p class="mainText">This website is based on the Bootstrapped Web Site project template available in the DevExpress Template Gallery. This template utilizes DevExpress ASP.NET AJAX controls in conjunction with the Bootstrap framework to create a website with multi-page design and responsive, mobile-friendly interface out of the box. By default, the website has a format of a <a href="<%: ResolveUrl("~/Pages/BlogTimeline.aspx") %>">blog</a> with integrated <a href="<%: ResolveUrl("~/Pages/Search.aspx") %>">full-text search</a><br /><br />If you are using a custom Bootstrap theme, it is recommended that you manually modify the base color in the DevExpress theme of your choice to better suit the overall color scheme. You can accomplish this task using the DevExpress Theme Builder.</p>
        </div>
        <div class="col-md-12 marginTop20">
            <a class="btn btn-primary btn-lg" href="#"><i class="glyphicon glyphicon-info-sign"></i> Learn more</a>
        </div>
    </section>
    <section class="row features">
        <div class="col-md-4 media">
            <div class="media-left">
                <div class="media-object">
                    <i class="glyphicon glyphicon-wrench featureIcon text-primary"></i>
                </div>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Cross-browser compatibility</h4>
                <p>DevExpress ASP.NET AJAX Controls and MVC Extensions are cross-browser compatible and are carefully tested against the following browsers to ensure utmost compatibility: Microsoft Internet Explorer, Microsoft Edge, Mozilla FireFox, Google Chrome, Safari, and Opera</p>
            </div>
        </div>
        <div class="col-md-4 media">
            <div class="media-left">
                <div class="media-object">
                    <i class="glyphicon glyphicon-cog featureIcon text-primary"></i>
                </div>
            </div>
            <div class="media-body">
                <h4 class="media-heading">AJAX Enabled</h4>
                <p>Each and every control provides an ability to update the control using callbacks, eliminating the need to re-load the entire page. This callback functionality allows you to optimize how data is transferred to the client</p>
            </div>
        </div>
        <div class="col-md-4 media">
            <div class="media-left">
                <div class="media-object">
                    <i class="glyphicon glyphicon-phone featureIcon text-primary"></i>
                </div>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Touch and Mobile Device Enabled</h4>
                <p>The ASP.NET Subscription helps you leverage your current investments and address customer needs via a comprehensive range of WebForms Controls and MVC Extensions that support touch on iOS Safari, Android and Internet Explorer 10+.</p>
            </div>
        </div>
    </section>
    <section>
        <div class="row marginTop20">
            <div class="col-md-12">
                <h3>Our Customers</h3>
                <p>No amount of marketing hype and hyperbole can mask a company's ability to deliver products that meet and exceed customer expectations. The following is a brief list of comments sent to us from our end-users - developers such as yourself who don't have time and money to waste - developers who need to get down to business and address client needs in the shortest possible.</p>
            </div>
        </div>
        <div class="row customers">
            <div class="col-md-6">
                <div class="media">
                    <div class="media-left media-middle">
                        <div class="media-object">
                            <img src="<%:Page.ResolveClientUrl("~/Content/Images/Customers/RafaelRaje.jpg")%>" width="100" alt="customer" class="img-circle">
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Rafael Raje</h4>
                        <p><small>Lorem ipsum dolor sit amet, nec te errem ridens aeterno. Ei mea utinam incorrupte intellegebat, te sonet aliquando intellegebat nam, offendit theophrastus ea per. Ei vel tota noluisse, meis utamur referrentur ea sit. Mel nulla vulputate ei.</small></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="media">
                    <div class="media-left media-middle">
                        <div class="media-object">
                            <img src="<%:Page.ResolveClientUrl("~/Content/Images/Customers/NathanBryant.jpg")%>" width="100" alt="customer" class="img-circle">
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Nathan Bryant</h4>
                        <p><small>Ut per alia constituto, vis amet adhuc quidam no, ea amet aeterno ceteros mea. Nec scriptorem adversarium id, dolorum elaboraret id sit. Novum ignota per ne, mel mollis verear ut. Id per integre periculis gubergren, eam aperiam apeirian.</small></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row customers">
            <div class="col-md-6">
                <div class="media">
                    <div class="media-left media-middle">
                        <div class="media-object">
                            <img src="<%:Page.ResolveClientUrl("~/Content/Images/Customers/HeidiLopez.jpg")%>" width="100" alt="customer" class="img-circle">
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Heidi Lopez</h4>
                        <p><small>Mollis vivendum in pro. Partem tritani cu duo, te cum antiopam consequuntur. Qui in solum habemus, eripuit similique mel ad. No officiis similique nec, te fierent disputando eam. Mei legimus habemus atomorum cu, vix in ullum delicatissimi. Nec te iusto commodo.</small></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="media">
                    <div class="media-left media-middle">
                        <div class="media-object">
                            <img src="<%:Page.ResolveClientUrl("~/Content/Images/Customers/GaryRubio.jpg")%>" width="100" alt="customer" class="img-circle">
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Gary Rubio</h4>
                        <p><small>Eos id tale tantas, id vidit impedit omnesque mea. In soluta suscipiantur usu, duo ad tale liber assueverit. Nec an aeterno detracto vulputate, usu et causae perpetua, debet soluta deseruisse in pri. Te error iudico primis vel, sed ut dicam saperet mandamus.</small></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
    <script>
        $(document).ready(
           function () 
           {
               localStorage.removeItem('ProjectTracker_Token');
           }
        ); 
    </script>
</asp:Content>