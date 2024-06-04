<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebEcomm.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/><br/>
     <div style="margin-left:10%; font-family:'Comic Sans MS' ">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="141px" Width="1083px" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand1">
         <Columns>
     <asp:BoundField DataField="pid" HeaderText="PID" InsertVisible="False" ReadOnly="True" SortExpression="pid" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="pname" HeaderText="P_Name" SortExpression="pname" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="pcat" HeaderText="P_Cat" SortExpression="pcat" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="perprice" HeaderText="Per_Price" SortExpression="price" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="qty" HeaderText="P_Qty" SortExpression="qty" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="price" HeaderText="Price" SortExpression="perprice" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="dt" HeaderText="Date" SortExpression="dt" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="suser" HeaderText="User" SortExpression="suser" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="pstatus" HeaderText="Status" SortExpression="pstatus" >
     <HeaderStyle HorizontalAlign="Center" />
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
 
    <asp:TemplateField>
        <ItemTemplate>
            <asp:Button ID="Button1" runat="server" CommandName="Status" CommandArgument='<%#Eval("pid") %>' class="btn btn-warning" Text="Approve" />
        </ItemTemplate>
    </asp:TemplateField>
             
 </Columns>
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
 </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" ProviderName="<%$ ConnectionStrings:dbconn.ProviderName %>" SelectCommand="SELECT [pid], [pname], [pcat], [price], [perprice], [qty], [dt], [suser], [pstatus] FROM [placeorder]"></asp:SqlDataSource>
  
</asp:Content>
