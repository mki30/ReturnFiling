<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMasterPage.master" AutoEventWireup="true" CodeFile="~/Master/ReportDetails.aspx.cs" Inherits="ReportDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        hr { background-color:green; height:1px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" id="divMain">
        <a href="/reports" class="btn btn-info pull-right">Back to reports</a>
        <div class="col-lg-12">
            <div id="divPersonalInfo" visible="false" runat="server"></div>
            <div id="divDeductions" visible="false" runat="server"></div>
            <div id="divAssets" visible="false" runat="server"></div>
            <div id="divHouseProperty" visible="false" runat="server"></div>
            <div id="divSalary" visible="false" runat="server"></div>
        </div>
    </div>
</asp:Content>

