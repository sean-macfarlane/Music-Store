<%@ Page Title="Admin - Home" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment2.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <h1>Admin Home</h1>
        <h2>Current Categories:</h2>
        <asp:GridView runat="server" id="categories" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
               <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Edit Category</b>
                    </HeaderTemplate>
                   <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemTemplate>
                       <asp:Button ID="editButton" CssClass="btn" runat="server" Text="EDIT" OnClick="edit_Category_OnClick" CommandArgument='<%#Eval("CategoryId")%>' />
                    </ItemTemplate>
                   </asp:TemplateField>
               <asp:TemplateField>
                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Delete Category</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Button ID="deleteButton" CssClass="btn" runat="server" OnClientClick="return confirm('are you sure?');" Text="DELETE" OnClick="delete_Category_OnClick" CommandArgument='<%#Eval("CategoryId")%>' />
                    </ItemTemplate>
               </asp:TemplateField>  
                <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Category</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <a href="../CategoryDetails.aspx?id=<%#Eval("CategoryId")%>" style="text-decoration: none;"><h2><%# Eval("Name") %></h2></a>                   
                    </ItemTemplate>
               </asp:TemplateField>                             
            </Columns>
            <EmptyDataTemplate>
                <p>There currently no categories.</p> 
            </EmptyDataTemplate>
    </asp:GridView>
        <asp:Button Text="Add Category" CssClass="btn" runat="server" OnClick="clickAddCategory" />  
        <br />
        <br />
        <h2>Current Products:</h2>
        <asp:GridView runat="server" id="products" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
               <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Edit Product</b>
                    </HeaderTemplate>
                   <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemTemplate>
                       <asp:Button ID="editButton" CssClass="btn" runat="server" Text="EDIT" OnClick="edit_Product_OnClick" CommandArgument='<%#Eval("ProductId")%>' />
                    </ItemTemplate>
                   </asp:TemplateField>
               <asp:TemplateField>
                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Delete Product</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Button ID="deleteButton" CssClass="btn" runat="server" OnClientClick="return confirm('are you sure?');" Text="DELETE" OnClick="delete_Product_OnClick" CommandArgument='<%#Eval("ProductId")%>' />
                    </ItemTemplate>
               </asp:TemplateField>   
                <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Product</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <a href="../ProductDetails.aspx?id=<%#Eval("ProductId")%>" style="text-decoration: none;"><h2><%# Eval("Name") %></h2></a>
                       <p><%# Eval("ShortDescription") %></p>
                       <p>Price: $<%# Eval("Price") %></p>
                    </ItemTemplate>
               </asp:TemplateField>                             
            </Columns>
            <EmptyDataTemplate>
                <p>There currently no products.</p> 
            </EmptyDataTemplate>
    </asp:GridView>
        <asp:Button Text="Add Product" CssClass="btn" runat="server" OnClick="clickAddProduct" />  

        </div>
</asp:Content>
