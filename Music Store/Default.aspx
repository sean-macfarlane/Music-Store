<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment2.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="">
        <h2>Sale Products:</h2>
        <asp:GridView runat="server" ShowHeader="False" ID="products" CssClass="table table-bordered" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="grdData_PageIndexChanging" PageSize="5">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>

                        <div class="row featurette">
                            <div class="col-md-2">
                                <asp:Image ID="image" runat="server" ImageUrl='<%# "GetFileHandler.ashx?fileid=" + Eval("ProductId") %>' Width="200" />
                            </div>
                            <div class="col-md-10">
                                <a href="ProductDetails.aspx?id=<%#Eval("ProductId")%>" style="text-decoration: none;">
                                    <h2><%# Eval("Name") %></h2>
                                </a>
                                <h4>Price: $<%# Eval("Price") %></h4>
                                <h3 style="color: red">Sale Price: $<%# Eval("SalePrice") %></h3>
                                <p><%# Eval("ShortDescription") %></p>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <pagerstyle BackColor="#f5f5f5" ForeColor="Black" 
            HorizontalAlign="Center"></pagerstyle>
            <rowstyle BackColor="#F7F6F3" ForeColor="#333333"></rowstyle>
            <selectedrowstyle BackColor="#E2DED6" Font-Bold="True" 
            ForeColor="#333333"></selectedrowstyle>
            <EmptyDataTemplate>
                <p>There are currently no products on sale.</p>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
