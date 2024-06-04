<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebEcomm.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/><br/>
    <%--From&nbsp; <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;&nbsp;
    To&nbsp; <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Search" Height="26px" Width="71px" OnClick="Button1_Click" />--%>
    
    <div style="margin-left:10%; font-family:'Comic Sans MS' " >
        <h1>Order History</h1>
        <br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="173px" PageSize="5" Width="1082px">
    <Columns>
        <%--<asp:ImageField DataImageUrlFormatString="Products/tv" HeaderText="Image">
        </asp:ImageField>--%>
        <%--<asp:ImageField DataImageUrlField='<%# ResolveUrl(Eval("pic").ToString()) %>' HeaderText="Image">
        </asp:ImageField>--%>
       <%-- <asp:TemplateField HeaderText="Image">
    <ItemTemplate>
        <asp:Image ImageUrl='<%#ResolveUrl(Eval("pic").ToString()) %>' runat="server" ></asp:Image>
    </ItemTemplate>
    <ItemStyle Height="10px" Width="10px" />
</asp:TemplateField>--%>
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
        <asp:BoundField DataField="price" HeaderText="Total_Price" SortExpression="perprice" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="dt" HeaderText="Date" SortExpression="dt" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="pstatus" HeaderText="Status" SortExpression="pstatus" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" ProviderName="<%$ ConnectionStrings:dbconn.ProviderName %>" SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)">
    <SelectParameters>
        <asp:SessionParameter Name="suser" SessionField="MyUser" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<br/>

    </asp:Content>
