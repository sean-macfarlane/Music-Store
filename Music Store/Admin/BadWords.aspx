<%@ Page Title="Bad Words" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" AutoEventWireup="true" CodeBehind="BadWords.aspx.cs" Inherits="Assignment2.Admin.BadWords" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container-fluid">
        <h1>Bad Words</h1>
 <h3>Add Bad Word</h3>
            <asp:TextBox ID="txtBad" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtBad" runat="server" /> 
        <asp:Button Text="Add Bad Word" CssClass="btn" runat="server" OnClick="AddBadWord" />
        <h3>Current Bad Words</h3>
        <asp:GridView runat="server" id="badwords" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
                 <asp:TemplateField>
                <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                   <HeaderTemplate>
                            <b>Delete Post</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                       <asp:Button ID="deleteButton" runat="server" validationgroup="delete" CssClass="btn" Text="DELETE" OnClick="delete_OnClick" CommandArgument='<%#Eval("BadWordId")%>' />
                    </ItemTemplate>
               </asp:TemplateField>  
                <asp:TemplateField>
                   <HeaderTemplate>
                            <b>Word</b>
                    </HeaderTemplate>
                   <ItemTemplate>
                        <%#Eval("Word")%>
                    </ItemTemplate>
               </asp:TemplateField>                             
            </Columns>
            <EmptyDataTemplate>
                <p>There are no bad words.</p> 
            </EmptyDataTemplate>
    </asp:GridView>
        </div>
</asp:Content>
