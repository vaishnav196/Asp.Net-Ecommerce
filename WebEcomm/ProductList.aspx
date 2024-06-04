<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="WebEcomm.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <div style="margin-left:10%; font-family:'Comic Sans MS' ">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" DataKeyNames="pid" DataSourceID="SqlDataSource1" GridLines="None" Width="1033px" style="margin-right: 0px" CellSpacing="1" Height="311px" PageSize="5">
        <Columns>
            <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="pid" ControlStyle-Width="30px" HeaderText="pid" SortExpression="pid" InsertVisible="False" ReadOnly="True">
            </asp:BoundField>
            <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname">
            </asp:BoundField>
            <asp:BoundField DataField="pcat" HeaderText="pcat" SortExpression="pcat">
            </asp:BoundField>
            <%--<asp:ImageField>
            </asp:ImageField>--%>
            <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt">
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Action">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
</asp:GridView>
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Product] WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([dt] = @original_dt) OR ([dt] IS NULL AND @original_dt IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))" InsertCommand="INSERT INTO [Product] ([pname], [pcat], [pic], [dt], [price]) VALUES (@pname, @pcat, @pic, @dt, @price)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:WebEcomConnectionString6.ProviderName %>" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [pname] = @pname, [pcat] = @pcat, [pic] = @pic, [dt] = @dt, [price] = @price WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([dt] = @original_dt) OR ([dt] IS NULL AND @original_dt IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_dt" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="dt" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="dt" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_dt" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
