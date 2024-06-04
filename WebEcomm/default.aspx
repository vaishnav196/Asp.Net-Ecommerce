<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebEcomm.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-vector/online-shopping-digital-technology-with-icon-blue-background-ecommerce-online-store-marketing_252172-219.jpg');
            background-size: cover; 
            background-repeat: no-repeat;  
            color:white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     
    <div class="Card" style="width:30%;font-family:Comic Sans MS;float:right;margin-right:54px; margin-top:100px">
    <div  style="margin-bottom:15px; font-weight:bolder"><h2>Welcome to ApnaKart!</h2></div>
        <div style="padding:20px;border-radius:10%" class="card-part">
            <div class="mb-3">
             <label for="exampleInputEmail1" class="form-label">Email address&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;
                <asp:TextBox ID="TextBox1"  runat="server" placeholder="Enter Email Address" Height="45px" Width="290px"></asp:TextBox>
            </div>  
        <div class="mb-3">
             <label for="exampleInputPassword1" class="form-label">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>&nbsp;
             <asp:TextBox ID="TextBox2"  runat="server" placeholder="Enter Password:)" Height="45px" Width="290px" TextMode="Password"></asp:TextBox>
        </div>
            
            <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-outline-light w-25 mt-3" OnClick="Button1_Click" />
            <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" runat="server" class="btn btn-outline-light mt-3 ms-2">Create New Account!</a>
            </div>
        </div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" style="color:black;font-family:Comic Sans MS" id="exampleModalLabel">Sign Up</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
      <div style="color:black;font-family:Comic Sans MS;">

      <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;
      <asp:TextBox ID="TextBox3"  runat="server" placeholder="Enter Username" Height="45px" Width="290px"></asp:TextBox>
     </div>  

     <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Email address&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;
      <asp:TextBox ID="TextBox4"  runat="server" placeholder="Enter Email Address" Height="45px" Width="290px"></asp:TextBox>
     </div>  
 <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>&nbsp;
      <asp:TextBox ID="TextBox5"  runat="server" placeholder="Enter Password:)" Height="45px" Width="290px" TextMode="Password"></asp:TextBox>
 </div>
     
     <asp:Button ID="Button2" runat="server" Text="Create New Account" class="btn btn-outline-dark w-100 mt-3" OnClick="Button2_Click"/>
     </div>
      </div>

    </div>
  </div>
</div>
     
    </form>
</body>
</html>
