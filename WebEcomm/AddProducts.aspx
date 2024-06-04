<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="WebEcomm.AddProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:40%;font-family:'Comic Sans MS' ">
        <h1>Add Products</h1>
    </div>
    <div style="width:30%; padding:40px ; border: 5px solid navy;margin-left:35% ; background-color:deepskyblue">
        
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Product Name:</label>
        <asp:TextBox ID="TextBox1" class ="form-control" runat="server" placeholder="Enter Product Name"></asp:TextBox>
    </div>

          <div class="mb-3">
         <label for="exampleInputEmail1" class="form-label">Product Category</label>
         <%--<asp:TextBox ID="TextBox2" class ="form-control"  runat="server"OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:TextBox>--%>
         <asp:DropDownList class="form-control" ID="DropDownList1" runat="server"  >
             <asp:ListItem>Electronics</asp:ListItem>
             <asp:ListItem>Cloths</asp:ListItem>
             <asp:ListItem>Furniture</asp:ListItem>
           </asp:DropDownList>     

     </div>

       <div class="mb-3">
         <label for="exampleInputEmail1" class="form-label">Product price </label>
         <asp:TextBox ID="TextBox3" class ="form-control" runat="server" placeholder="Enter Product Price"></asp:TextBox>
     </div>

       <div class="mb-3">
         <label for="exampleInputEmail1" class="form-label">Product Image </label>
           <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
     </div>
        
   

      <div style="margin-left:120px">
          <asp:Button class="btn-btn-info" ID="Button1" runat="server" Text="Add Product" OnClick="Button1_Click"/>

      </div> 
    </div>
  
    
</asp:Content>
