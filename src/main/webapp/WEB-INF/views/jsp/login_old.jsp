<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%-- <link rel="shortcut icon" href="<c:out value='${pageContext.request.contextPath}'/>/images/srp.png" type="image/png"/> --%>


<meta charset="UTF-8">

<style>
body {
      background: url('http://i.imgur.com/Eor57Ae.jpg') no-repeat fixed center center;
    /*  background: none repeat scroll 0 0 rgba(4, 40, 68, 0.85); */
     background-size: cover;
     /* font-family: Montserrat; */
}

.logo {
    width: 300px;
    height: 36px;
    background:"";
    margin: 30px auto;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
/*     border-radius: 5px; */
    border:1px solid #288cbd;
    border-top: 10px solid #288cbd;
    margin: 0 auto;
}

.login-block h1 {
   
    text-align: center;
    color: #3796ba;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
    border-bottom:2px solid #3796ba;
    padding:5px;
    text-shadow: 1px 1px 1px #000;
    
    
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    /* font-family: Montserrat; */
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('${webapp_path}/images/loginuser.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('${webapp_path}/images/loginuser.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #3796ba;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #1f6d93;
    box-sizing: border-box;
    border: 1px solid #1f6d93;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
   /*  font-family: Montserrat; */
    outline: none;
    cursor: pointer;
    margin-top:5px;
    text-shadow: 1px 1px 1px #000;
   
}

.login-block button:hover {
    background: #288cbd;
    border: 1px solid #288cbd;
    /* border-bottom: 5px solid #3796ba !important; */
}



</style>
</head>

<body>

<div class="logo"></div>
<%-- <div>${objectmodel}</div> --%>
<div class="login-block">
    <h1>Sign In</h1>
    <input type="text" value="" placeholder="Username" id="username" />
    <input type="password" value="" placeholder="Password" id="password" />
    <a href="#">Forgot your password?</a>
    <a href="${webapp_path}/home.sp"> 
      <button>Sign In &nbsp;<span class="glyphicon glyphicon-log-in"></span></button> 
   </a>
</div>
</body>

</html>