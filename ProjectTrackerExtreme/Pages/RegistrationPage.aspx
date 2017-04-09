<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.RegistrationPage" %>

<%@ Register TagPrefix="uc" TagName="Spinner" Src="~/UserControls/RegistrationForm.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <uc:Spinner id="registrationForm" runat="server" />
</asp:Content>
