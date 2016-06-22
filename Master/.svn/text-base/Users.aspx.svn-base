<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMasterPage.master" AutoEventWireup="true" CodeFile="~/Master/Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container" id="divMain">
        <div class="col-lg-12">
            
            <div id="divUsers" runat="server">
            </div>
        </div>
    </div>

    <div class="modal" id="modaluser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Add / Update User</h4>
                </div>
                <div class="modal-body">
                    <form role="form">

                    <div class="form-group">
                        <label for="txtName">Name</label>&nbsp;&nbsp;&nbsp;<asp:Label CssClass="label label-info" ID="spnID" runat="server">0</asp:Label>
                        <input type="text" id="txtID" runat="server" style="display:none" />
                        <input type="text" maxlength="30" runat="server" class="form-control" id="txtName" placeholder="Name" />
                    </div>

                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <input type="text" maxlength="20" runat="server" class="form-control" id="txtUsername" placeholder="User Name" />
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input type="password" maxlength="10" runat="server" class="form-control" id="txtPassword" placeholder="Password" />
                    </div>

                    <div class="form-group">
                        <label for="ddUserType">User Type</label>
                        <select id="ddUserType" runat="server" class="form-control">
                            <option value="0">Associate User</option>
                            <option value="1">Master User</option>
                        </select>
                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdateUser" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnUpdateUser_Click" />
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function EditUser(ID, Name, UserName, Password, Role)
        {
            $("#txtID").val(ID);
            $("#spnID").text(ID);
            $("#txtName").val(Name);
            $("#txtUsername").val(UserName);
            $("#txtPassword").val(Password);
            $("#ddUserType").val(Role);

            $("#modaluser").modal('show');
        }
    </script>
</asp:Content>

