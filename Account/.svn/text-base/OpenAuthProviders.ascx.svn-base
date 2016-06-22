<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>
<div id="socialLoginList">
    <h4>Use another service to log in.</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                 <button type="submit" class="<%#: Item.ToLower()=="facebook"?"fbConnect":"goConnect" %>" name="provider" value="<%#: Item %>"
                title="Log in using your <%#: Item %> account.">
                <i></i>
                <span>Login with <%#: Item %></span>
            </button>
            </p>
        </ItemTemplate>       
    </asp:ListView>
</div>