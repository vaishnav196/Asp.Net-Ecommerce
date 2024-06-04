<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="WebEcomm.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 89%;
            height: 474px;
        }
        .auto-style11 {
            width: 288px;
            height: 46px;
        }
        .auto-style12 {
            height: 46px;
        }
        .auto-style15 {
            width: 288px;
            height: 22px;
        }
        .auto-style16 {
            height: 22px;
        }
        .auto-style20 {
            width: 549px;
            height: 22px;
        }
    .auto-style22 {
        width: 549px;
        height: 22px;
    }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <script src='https://checkout.razorpay.com/v1/checkout.js'></script>
    </head>
    <br/><br/>
    
        <asp:Button ID="Button1" class="btn btn-danger" runat="server" OnClick="Button1_Click" Text="Download" Height="39px" Width="150px" />
    &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="Button2" runat="server" Text="Pay Now" class="btn btn-success" Height="39px" Width="150px" OnClick="Button2_Click"/>
    <%--<br/>
    <br/>--%>
    
    
    <asp:Panel ID="Panel1" runat="server" Height="585px" Width="1316px">
        <br/>
            <h1 align="center">Invoice</h1>
        <br/>
        <div style="margin-left:10%;padding-bottom:5%">
        <table border="1" cellspacing="4" cellpadding="5" class="auto-style1" style="border-style: none">
            <tr>
                <td class="auto-style11" style="border-style: solid"><strong>Order ID:&nbsp;&nbsp;</strong>
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </td>
                <td class="auto-style12" style="border-style: solid"><strong>Email ID:&nbsp;</strong>&nbsp;
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <br />
                    <strong>Contact No:&nbsp;</strong>&nbsp;
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" style="border-style: solid">
                    <br />
                    <strong>Seller Address: </strong>
                    <br />
                    <br />
                    708, Fenkin 9,<br /> Near Mulund cheknaka,<br /> Thane-400612<br /> </td>
                <td class="auto-style16" style="border-style: solid"><strong>Buyer Address:</strong><br />
                    <br />
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style20" style="border-style: solid">
                  
                    <%--BackColor="#CCCCCC" BorderColor="#999999" ForeColor="Black" BorderStyle="Solid" BorderWidth="3px"--%>

                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" CellSpacing="2"  Height="103px" Width="1083px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="pid" HeaderText="PID" InsertVisible="False" ReadOnly="True" SortExpression="pid" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pcat" HeaderText="Product Category" SortExpression="pcat" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="perprice" HeaderText="Per Price" SortExpression="perprice" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="price" HeaderText="Total Price" SortExpression="price" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <%--<FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" ProviderName="<%$ ConnectionStrings:dbconn.ProviderName %>" SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)">
                        <SelectParameters>
                            <asp:SessionParameter Name="suser" SessionField="MyUser" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                   
                </td>
                
            </tr>
            <tr>
                <td colspan="2" class="auto-style22" style="border-style: solid"><strong>
                    <br />
                    Grand Total: </strong>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
                
            </tr>
        </table>
    </div>
    </asp:Panel>
</asp:Content>
