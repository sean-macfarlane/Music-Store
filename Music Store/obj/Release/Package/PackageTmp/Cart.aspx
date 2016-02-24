<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment2.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h2>Cart:</h2>
        <asp:Panel runat="server" ID="itemTotal" Visible="false">
            <h3>There are <asp:Literal runat="server" ID="numItems"/> item(s) in your Cart...</h3>
        </asp:Panel>
        <asp:GridView runat="server" ShowHeader="False" ID="products" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>

                        <div class="row featurette">
                            <div class="col-md-4">
                                <asp:Image ID="image" runat="server" ImageUrl='<%# "GetFileHandler.ashx?fileid=" + Eval("ProductId") %>' Width="200" />
                            </div>
                            <div class="col-md-8">
                                <a href="../ProductDetails.aspx?id=<%#Eval("ProductId")%>" style="text-decoration: none;">
                                    <h2><%# Eval("Name") %></h2>
                                </a>
                                <h4>Price: $<%# Eval("Price") %></h4>
                                <h3 style="color: red">Sale Price: $<%# Eval("SalePrice") %></h3>
                                <p><%# Eval("ShortDescription") %></p>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Remove Product</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Button ID="deleteButton" CssClass="btn" runat="server" Text="REMOVE" OnClick="removeItem" CommandArgument='<%#Eval("ProductId")%>' />
                    </ItemTemplate>
               </asp:TemplateField> 
            </Columns>
            <EmptyDataTemplate>
                <p>There are currently no products in your cart.</p>
            </EmptyDataTemplate>
        </asp:GridView>
        <div class="pull-right">
            <asp:Panel runat="server" ID="Total" Visible="false">
                <h3>Total: $<asp:Literal runat="server" ID="TotalValue"/></h3>
            </asp:Panel>
            <asp:Button runat="server" ID="Continue" CssClass="btn btn-default" Text="Continue Shopping" OnClick="ContinueShopping" ValidationGroup="continue"/>
             <asp:Button runat="server" ID="CheckoutBtn" CssClass="btn btn-default" Text="Buy Now" OnClick="CheckOut" Enabled="false" ValidationGroup="out"/>
        </div>
    </div>
</asp:Content>
