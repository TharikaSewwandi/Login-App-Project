

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
 <style>
    form {
        border: 3px solid #f1f1f1;
    }
 body
 {
     background-color: #181C3E;
 }
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    button:hover {
        opacity: 0.8;
    }

    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }



    img.avatar {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>
<body>

<h2>Login Form</h2>
<div style="width: 50% ;position: absolute;left: 25%">
<form method="post">
    <div class="container">
        <label><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="usrname" required >

        <label><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>


        <input type="checkbox" checked="checked" name="cb_remember"> Remember me
        <input type="checkbox" checked="checked" name="cb_http"> Http Only
        <input type="checkbox" checked="checked" name="cb_https"> Secure Flag
        <button type="submit" name = "submit" value="Login">Login</button>
    </div>

    <div class="container">
        <button type="button" class="cancelbtn">Cancel</button>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %><% String msg="";%>
    <%
        Cookie cookie = null;
        Cookie[] cookies = null;

        //Get an array of cookies
        cookies = request.getCookies();

        if( cookies != null ) {

            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if(cookie.getName( ).equals("LoginCookie") ){
                    response.sendRedirect("content.jsp");
                }
            }
        }
    %>

    <%
        if(request.getParameter("submit") != null) {
            //collect the user input and put into a variable
            String usrname = request.getParameter("usrname");
            String psw = request.getParameter("psw");
            String secureFlag=request.getParameter("cb_https");
            String httpflag=request.getParameter("cb_http");

            if ("user".equals(usrname) && "user".equals(psw)) {


                Cookie LoginCookie = new Cookie("LoginCookie", usrname);

                LoginCookie.setMaxAge(300);
                LoginCookie.setPath("localhost/myprojects/IT15097934");
                LoginCookie.setDomain("localhost");
               // LoginCookie.setComment("cookie for the login");

                if(secureFlag != null){

                    LoginCookie.setSecure(true);

                }

                if(secureFlag == null){
                    LoginCookie.setSecure(false);
                }

                if(httpflag !=null) {
                    LoginCookie.setHttpOnly(true);
                }

                if(httpflag ==null) {
                    LoginCookie.setHttpOnly(false);
                }
                response.addCookie(LoginCookie);
                response.sendRedirect("content.jsp");
            }
            else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username or password incorrect');");
                out.println("location='index.jsp';");
                out.println("</script>");

            }
        }
    %>

</form>
</div>
</body>
</html>