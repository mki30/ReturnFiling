<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/ChangeAssessmentYear.aspx.cs" Inherits="ChangeAssessmentYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top: -20px;" id="divMain1">
        <br />
        <br />
        <h2>Choose Assessment Year</h2>
        <h3>You are currently working on Tax Return of Assessment Year: 2014-2015</h3>
        <p class="narrate">Note: When Assessment Year is 2014-2015, the Financial Year is 2013-2014 which starts from 01/04/2013 and ends on 31/03/2014 </p>
        <div class="span-24 last">
            <fieldset>
                <legend>Change Assessment Year Below if needed</legend>
                <p>
                    <label for="ddAssessmentYear">Choose Assessment Year</label>
                    <asp:DropDownList runat="server" ID="ddAssessmentYear" CssClass="form-control" Style="max-width: 120px;">
                        <asp:ListItem Value="2012-2013">2013-2014</asp:ListItem>
                        <asp:ListItem Selected="True" Value="2013-2014">2014-2015</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </fieldset>
            <p>
                <asp:Button ID="btnSaveAssessmentYear" Text="Save" OnClick="btnSaveAssessmentYear_Click" runat="server" CssClass="btn btn-primary" />
            </p>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#divMain1").css('min-height', $(window).height() - 68 - ($(".header-panel").height() + $(".footer-panel").height()));
        });
    </script>
</asp:Content>

