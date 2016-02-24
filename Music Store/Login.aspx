<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment2.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="login">
            <div>
                <h1>Login</h1>
                Please login with your Algonquin College Network Username and Password.
    <table>
        <tr class="row">
            <td>Username:
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="txtUsername" runat="server" />
            </td>
        </tr>
        <tr class="row">
            <td>Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword"
                    runat="server" />
            </td>
        </tr>
        <tr class="row">
            <td></td>
            <td>
                <asp:Button Text="Login" CssClass="btn" runat="server" OnClick="ValidateUser" />
            </td>
            <td>
                <asp:CheckBox ID="isAdmin" runat="server" Text="is Admin?" />
            </td>
        </tr>
    </table>
            </div>
        </div>
    </div>
</asp:Content>
