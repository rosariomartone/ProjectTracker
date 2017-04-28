<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="ChangeUserPassword.aspx.cs" Inherits="ProjectTrackerExtreme.Pages.ChangeUserPassword" %>

<%@ Register TagPrefix="uc" TagName="Spinner" Src="~/UserControls/ChangeUserPassword.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <uc:Spinner id="ChangePwdForm" runat="server" />
</asp:Content>
