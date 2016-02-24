<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="Assignment2.CategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
         <h2>Products:</h2>
        <asp:GridView runat="server"  ShowHeader="False" id="products" CssClass="table table-bordered" AutoGenerateColumns="false">
              <Columns>            
                <asp:TemplateField>
                   <ItemTemplate>
                       <div class="row featurette">
                            <div class="col-md-4">
                                <asp:Image ID="image" runat="server" ImageUrl='<%# "GetFileHandler.ashx?fileid=" + Eval("ProductId") %>' Width="200" />
                            </div>
                            <div class="col-md-8">
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
            <EmptyDataTemplate>
                <p>There are currently no products available.</p> 
            </EmptyDataTemplate>
    </asp:GridView>
    </div>
</asp:Content>
