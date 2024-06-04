<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebEcomm.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       .auto-style1 {
            width: 973px;
            margin-left: 8%;
        }
        .auto-style2 {
            width: 50%;
            height: 350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    &nbsp; 
    <br />
 
    <div class="auto-style1" style="margin-left:10%; font-family:'Comic Sans MS' ">
       <b style="font-size:30px;">My Cart</b>
       <br />
        &emsp;
        <%--OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"--%>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1084px" OnRowDeleting="GridView1_RowDeleting">
    <Columns>
        <%--<asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
        <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
        <asp:BoundField DataField="pcat" HeaderText="pcat" SortExpression="pcat" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
        <asp:TemplateField HeaderText="Product Image">
            <ItemTemplate>
                <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# ResolveUrl(Eval("pic").ToString()) %>' Width="100px" Height="100px" />
            </ItemTemplate>
        </asp:TemplateField>--%>

        <%--<asp:BoundField DataField="imgUrl" HeaderText="imgUrl" SortExpression="imgUrl" />--%>
        <%--<asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt" />
        <asp:BoundField DataField="suser" HeaderText="suser" SortExpression="suser" />
        <asp:BoundField DataField="perprice" HeaderText="perprice" SortExpression="perprice" />
   
        <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete">
        <ControlStyle BackColor="#FF3300" BorderStyle="None" ForeColor="White" />
        </asp:ButtonField>--%>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ImageUrl='<%#Eval("pic") %>' runat="server" Height="100px" Width="150px" ></asp:Image>
            </ItemTemplate>
            <ItemStyle Height="5px" Width="5px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PID">
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%#Eval("pid") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="P_Name">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="P_Cat">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%#Eval("pcat") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="P_Price">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%#Eval("perprice") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Qty">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total_Price">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%#Eval("price") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%#Eval("dt") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="User">
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%#Eval("suser") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="Button4" runat="server" CommandName="Delete" CommandArgument='<%# Eval("pid") %>' Text="Remove" CssClass="btn btn-danger" />

                <%--<asp:Button ID="Button1" CommandName="Delete" CommandArgument='<%#Eval("pid") %>' runat="server" style="cursor:pointer" class="btn btn-danger" Text="Remove" ClientIDMode="Static" />--%>
            </ItemTemplate>
        </asp:TemplateField>
     </Columns>

    <%--<FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle ForeColor="#333333" BackColor="White" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />--%>

        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

</asp:GridView>

   <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebEcomConnectionString4 %>" ProviderName="<%$ ConnectionStrings:WebEcomConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [cart] WHERE ([suser] = @suser)">
       <SelectParameters>
           <asp:Parameter DefaultValue="john@gmail.com" Name="suser" Type="String" />
       </SelectParameters>
        </asp:SqlDataSource>--%>
   
    <div class="auto-style2">
         <br />
         <strong>Grand Total:&nbsp; <asp:Label ID="Label8" runat="server"></asp:Label>
         </strong>
        <br />
        <br />

        Address:<asp:TextBox ID="TextBox1" runat="server" Text="" class="form-control text-area w-50" placeholder="Address" Height="44px" TextMode="MultiLine"></asp:TextBox>&emsp;  &emsp;
         <br />

        Contact:<asp:TextBox ID="TextBox2" runat="server"   class="form-control text-area w-50"  placeholder="Conatct Number"></asp:TextBox>
         <br />
         <br />

 <asp:Button ID="Button2" class="btn btn-outline-primary" runat="server" Text="Continue Shopping" Width="181px" OnClick="Button2_Click" />  &emsp;
<asp:Button ID="Button3" class="btn btn-outline-danger" runat="server" Text="Place Order" Width="111px" OnClick="Button3_Click" />&emsp;  &emsp; 

    </div>
    </div>
    <%--<asp:Button ID="Button1" runat="server" Text="Place Order" OnClick="Button1_Click" />--%>
   
  
</asp:Content>