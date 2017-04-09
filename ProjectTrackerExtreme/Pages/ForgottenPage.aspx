<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="ForgottenPage.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.ForgottenPage" %>

<%@ Register TagPrefix="uc" TagName="Spinner" Src="~/UserControls/ForgottenPassword.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <uc:Spinner id="forgottenForm" runat="server" />
</asp:Content>