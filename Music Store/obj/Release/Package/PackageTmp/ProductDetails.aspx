<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Assignment2.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <a href="Default.aspx">< Back</a>
        <br />
        <br />
        
        <div class="row featurette">
            <div class="col-md-4">
                <asp:Image ID="image" runat="server" ImageUrl="GetFileHandler.ashx?fileid=" Width="300" />
            </div>
            <div class="col-md-8">
                <h1>
                <asp:Literal runat="server" ID="Name"></asp:Literal></h1>
                <h3>
                    Price: $<asp:Literal runat="server" ID="Price"></asp:Literal></h3>
                <h3 style="color:red">
                    Sale Price: $<asp:Literal runat="server" ID="SalePrice" Text=""></asp:Literal></h3>
                <p>
                    <asp:Literal runat="server" ID="ShortDesc"></asp:Literal>
                </p>
                <asp:Literal runat="server" ID="audioURL" /> 
                <br />
                <asp:Button runat="server" ID="AddCartButton" CssClass="btn btn-default" Text="Add to Cart" OnClick="AddToCart" ValidationGroup="add" Enabled="false"/>
            </div>
        </div>
        <br />
        <br />

        <asp:ScriptManager runat="Server" />
        <ajaxToolkit:TabContainer ID="tabs" runat="server">
            <ajaxToolkit:TabPanel runat="server" HeaderText="Description">
                <ContentTemplate>
                    <br />
                    <p>
                        <asp:Literal runat="server" ID="LongDesc"></asp:Literal>
                    </p>
                    <br />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="Comments">
                <ContentTemplate>

                    <asp:Panel runat="server" ID="AddCommentPanel" Visible="False">
                        <h3>Add Comment:</h3>
                        <asp:TextBox ID="txtComment" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="txtComment" runat="server" />
                        <asp:Button Text="Add Comment" CssClass="btn" runat="server" OnClick="AddComment" />
                    </asp:Panel>
                    <h3>Comments:</h3>
                    <asp:GridView runat="server" ID="comments" ShowHeader="False" CssClass="table table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <p><%# BadWords(Eval("Text")) %></p>
                                    <p><%# Eval("Username") %> (<%# Eval("CreatedDate") %>)</p>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>There are no comments.</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>


    </div>
</asp:Content>
