<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Assignment2.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Transaction Complete!</h1>
        <h2>Thank you <b>
            <asp:Literal runat="server" ID="Name" /></b> for shopping at Tuneify.</h2>
        <asp:Button Text="Continue Shopping" CssClass="btn" runat="server" OnClick="Continue" />
        <br />
        <h2>Downloads:</h2>
        <asp:GridView runat="server" ShowHeader="False" ID="products" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <h3><%# Eval("Name") %></h3>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:HyperLinkField DataNavigateUrlFields="ProductId" Text="Download" DataNavigateUrlFormatString = "DownloadHandler.ashx?fileid={0}" HeaderText="Download" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
