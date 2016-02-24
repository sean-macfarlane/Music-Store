<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment2.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                <h1>Checkout</h1>
                Please enter valid credit card information to complete transaction.
                <table >
                    <tr class="row">
                        <td>First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtfirst" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="txtfirst" runat="server" />
                        Last Name:
                            <asp:TextBox ID="txtLast" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="txtLast" runat="server" />
                        </td>
                    </tr>
                    <tr class="row" >
                        <td>Number:
                        </td>
                        <td>
                            <asp:TextBox ID="txtNum" runat="server" TextMode="Password" />
                        </td>
                        <td s>
                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNum"
                                runat="server" />
                            
                            <asp:RegularExpressionValidator ControlToValidate="txtNum" validationexpression="^\d{9}$" ErrorMessage="Please enter a valid credit card number" ForeColor="Red" runat="server" />  
        
                        </td>
                    </tr>
                    <tr class="row" style="width: 100%;">
                        <td >Expirary Date:
                        </td>
                        <td >
                            <asp:DropDownList ID="month" runat="server" Width="100px"/>
   
                            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="month" runat="server" />
                       / 
                           <asp:DropDownList ID="year" runat="server" Width="100px"/>

                            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="year" runat="server" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td></td>
                        <td>
                            <asp:Button Text="Complete Transaction" CssClass="btn" runat="server" OnClick="Complete" />
                        </td>
                        <td>
                            <asp:Button Text="Cancel" CssClass="btn" runat="server" OnClick="Cancel" />
                        </td>
                    </tr>
                </table>
    </div>
</asp:Content>
