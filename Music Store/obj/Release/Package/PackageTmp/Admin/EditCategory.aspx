<%@ Page Title="Edit Category" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="Assignment2.Admin.EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Edit Category</h1>
        <table>
            <tr>
                <td>Name:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                        ControlToValidate="txtName" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button Text="Submit Changes" CssClass="btn" runat="server" OnClick="Edit_Category" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
