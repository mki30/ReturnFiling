<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMasterPage.master" AutoEventWireup="true" CodeFile="~/Master/Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" id="divMain">
        <div class="col-lg-12">
            <div id="divReports" runat="server">
            </div>
        </div>
    </div>
    <div class="modal fade" id="modaluser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Assign Associate</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtName">Name</label>&nbsp;&nbsp;&nbsp;<span class="label label-info" id="spnCandidateID"></span>
                        <input type="text" id="txtCandidateID" runat="server" style="display: none" />
                        <input type="text" maxlength="30" readonly="true" runat="server" class="form-control" id="txtCandidateName" />
                    </div>

                    <div class="form-group">
                        <label for="ddUserType">Associate to Assign</label>
                        <asp:DropDownList ID="ddAssociate" Style="max-width: 200px;" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAssignAssociate" runat="server" ClientIDMode="Static" CssClass="btn btn-primary" Text="Assign" OnClick="btnAssignAssociate_Click" />
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="modalUpload">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Upload File</h4>
                </div>
                <div class="modal-body ">
                    <div class="form-group">
                        <label for="flUpload">Upload File</label>&nbsp;&nbsp;&nbsp;<span class="label label-info" id="spnCandidateID_upload"></span>
                        <input type="text" id="txtCandidateID_upload" style="display: none" runat="server" />
                        <asp:FileUpload ID="flUpload" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="ddUserType">Change Status</label>
                        <asp:DropDownList ID="ddChangeStatus" Style="max-width: 200px;" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Literal ID="ltMsg1" runat="server"></asp:Literal>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Upload" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function AssignAssociate(CandidateID, Name, AssociateID)
        {
            $("#spnCandidateID").text(CandidateID);
            $("#txtCandidateID").val(CandidateID);
            $("#txtCandidateName").val(Name);
            $("#ddAssociate").val(AssociateID);
            $("#modaluser").modal('show');
        }

        function UploadFile(CandidateID)
        {
            $("#spnCandidateID_upload").text(CandidateID);
            $("#txtCandidateID_upload").val(CandidateID);
            $("#modalUpload").modal('show');
        }

    </script>
</asp:Content>



