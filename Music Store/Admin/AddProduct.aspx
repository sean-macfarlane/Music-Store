<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Assignment2.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Add Product</h1>
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
                    <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtPrice" ForeColor="Red" Type="Currency" Operator="DataTypeCheck" ErrorMessage="Please enter a valid number" />
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
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ForeColor="Red" ControlToValidate="txtSale" Type="Currency" Operator="DataTypeCheck" ErrorMessage="Please enter a valid number" />
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
                    <asp:FileUpload ID="fileUpload"   runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="fileUpload"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>Audio File:
                </td>
                <td>
                    <asp:FileUpload ID="audioUpload"  runat="server" />
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
                    <asp:Button Text="Create Product" CssClass="btn" runat="server" OnClick="CreateProduct" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
