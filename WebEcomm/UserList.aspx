<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WebEcomm.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 837px;
            margin-left: 19%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <div class="auto-style1" style="margin-left:10%; font-family:'Comic Sans MS'">
        <h1 style="margin-left:25%">User List</h1>
        <p style="margin-left:25%">
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
        
        <asp:TemplateField HeaderText="User ID">
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%#Eval("id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="User Name">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%#Eval("acc_user") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
    <ItemTemplate>
        <asp:Label ID="Label2" runat="server" Text='<%#Eval("acc_email") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
        
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="Button4" runat="server" CommandName="Delete" CommandArgument='<%# Eval("id") %>' Text="Remove" CssClass="btn btn-danger" />

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
        </p>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [user_account] WHERE ([acc_role] = @acc_role)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [user_account] WHERE [id] = @original_id AND (([acc_user] = @original_acc_user) OR ([acc_user] IS NULL AND @original_acc_user IS NULL)) AND (([acc_pass] = @original_acc_pass) OR ([acc_pass] IS NULL AND @original_acc_pass IS NULL)) AND (([acc_email] = @original_acc_email) OR ([acc_email] IS NULL AND @original_acc_email IS NULL)) AND (([acc_role] = @original_acc_role) OR ([acc_role] IS NULL AND @original_acc_role IS NULL))" InsertCommand="INSERT INTO [user_account] ([acc_user], [acc_pass], [acc_email], [acc_role]) VALUES (@acc_user, @acc_pass, @acc_email, @acc_role)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:WebEcomConnectionString13.ProviderName %>" UpdateCommand="UPDATE [user_account] SET [acc_user] = @acc_user, [acc_pass] = @acc_pass, [acc_email] = @acc_email, [acc_role] = @acc_role WHERE [id] = @original_id AND (([acc_user] = @original_acc_user) OR ([acc_user] IS NULL AND @original_acc_user IS NULL)) AND (([acc_pass] = @original_acc_pass) OR ([acc_pass] IS NULL AND @original_acc_pass IS NULL)) AND (([acc_email] = @original_acc_email) OR ([acc_email] IS NULL AND @original_acc_email IS NULL)) AND (([acc_role] = @original_acc_role) OR ([acc_role] IS NULL AND @original_acc_role IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_acc_user" Type="String" />
                <asp:Parameter Name="original_acc_pass" Type="String" />
                <asp:Parameter Name="original_acc_email" Type="String" />
                <asp:Parameter Name="original_acc_role" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="acc_user" Type="String" />
                <asp:Parameter Name="acc_pass" Type="String" />
                <asp:Parameter Name="acc_email" Type="String" />
                <asp:Parameter Name="acc_role" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="User" Name="acc_role" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="acc_user" Type="String" />
                <asp:Parameter Name="acc_pass" Type="String" />
                <asp:Parameter Name="acc_email" Type="String" />
                <asp:Parameter Name="acc_role" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_acc_user" Type="String" />
                <asp:Parameter Name="original_acc_pass" Type="String" />
                <asp:Parameter Name="original_acc_email" Type="String" />
                <asp:Parameter Name="original_acc_role" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
