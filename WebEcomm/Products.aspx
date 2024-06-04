<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebEcomm.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 900px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="margin:3% 5%; font-family:'Comic Sans MS'">
       <h1 class="mx-5"> All Products</h1> 
           <%--style="margin-top: 42px; margin-bottom: 0px" Width="985px"--%>
            <asp:DataList ID="DataList1" runat="server"  RepeatDirection="Horizontal" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="0px" CellPadding="8" GridLines="Horizontal" Height="508px" RepeatColumns="4" DataSourceID="SqlDataSource1" CssClass="auto-style2"  OnItemCommand="DataList1_ItemCommand" >
          
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
      
        <ItemTemplate>

            <div class="card mx-3" style="width: 18rem; box-shadow:5px 5px 5px 5x red; margin-bottom:100px; left: 0px; top: 0px; height: 390px;">
  <img src='<%#Eval("pic") %>' class="card-img d-block m-auto" height="150" width="100" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%#Eval("pname") %></h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"> Category :<%#Eval("pcat") %></li>
    <li class="list-group-item">Price:<%#Eval("price") %></li>
  <li class="list-group-item">Quantity:<asp:DropDownList ID="DropDownList1" class="form-control"  runat="server">

                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        

                                       </asp:DropDownList>


  </li>
      <li class="list-group-item">
          <asp:Button ID="Button1"  class="btn btn-primary w-100" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%#Eval("pid") %>' Width="100px" />
      </li>
  </ul>
  <div class="card-body">
     
      
  </div>
</div>

        </ItemTemplate>

        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />

    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" ProviderName="<%$ ConnectionStrings:dbconn.ProviderName %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
    </div>
   
   
    
</asp:Content>
