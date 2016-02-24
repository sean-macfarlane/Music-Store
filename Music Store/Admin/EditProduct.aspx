<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Assignment2.Admin.EditProduct" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
        <h1>Edit Product</h1>
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
                <td>Category:
                </td>
                <td>
                    <asp:DropDownList ID="categoryDropDown" runat="server" placeholder="Category" CssClass="dropdown" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="categoryDropDown"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>Short Description:
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescription"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>Price:
                </td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPrice"
                        runat="server" />
                    <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtPrice" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Please enter a valid number" />
                </td>
            </tr>
            <tr>
                <td>Sale Price:
                </td>
                <td>
                    <asp:TextBox ID="txtSale" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSale"
                        runat="server" />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtSale" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Please enter a valid number" />
                </td>
            </tr>
            <tr>
                <td>Is on Sale?
                </td>
                <td>
                    <asp:CheckBox ID="checkBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Image:
                </td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="fileUpload"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>Long Description:
                </td>
                <td>
                    <asp:ScriptManager runat="Server" />
                        <asp:TextBox ID="txtLong" TextMode="MultiLine" Columns="60" Rows="8" runat="server" /> 
                        <ajaxToolkit:HtmlEditorExtender runat="server" TargetControlID="txtLong" EnableSanitization="false" />
                    
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLong"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button Text="Submit Changes" CssClass="btn" runat="server" OnClick="Edit_Product" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
