<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/28/17
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Content Page</title>
</head>

<script>
    function Fun_viewCookie() {
        alert(document.cookie);
    }


</script>
<style>
    button {
        display: inline-block;
        padding: 15px 25px;
        font-size: 24px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: #fff;
        background-color: #4CAF50;
        border: none;
        border-radius: 15px;
        box-shadow: 0 9px #999;
    }
    body {
        background-color: #181C3E;
        color: white;
    }
    input
    {
        display: inline-block;
        padding: 15px 25px;
        font-size: 24px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: #fff;
        background-color: #4CAF50;
        border: none;
        border-radius: 15px;
        box-shadow: 0 9px #999;

    }
    table {
        border-collapse: collapse;
        width: 50%;

    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even){background-color: #f2f2f2}

    th {
        background-color: #4CAF50;
        color: white;
    }


</style>


<body >
<!-- webpage content goes here in the body -->

<div id="page">
    <div id="logo">
        <h1><a  id="logoLink">Secure Software Systems</a></h1>
    </div>
    <div id="nav">
        <ul>

        </ul>
    </div>
    <div id="content">

        <p>
            IT15097934
            Munasinghe A. N. T. S.
        </p>
        <p>
            1st assignment
            SSS
        </p>
        <div>

            <table align="center">
                <tr>
                    <th>
                        Name of the Cookie
                    </th>
                    <th>
                        Value of the cookie
                    </th>

                    <%
                        Cookie cookie = null;
                        Cookie[] cookies = null;

                        boolean FindCookie = false;
                        cookies = request.getCookies();

                        if(cookies !=null)
                        {   int j;
                            for( j=0; j<cookies.length; j++)
                            {
                                cookie = cookies[j];
                                if (cookie.getName().equals("LoginCookie"))
                                {

                                    out.print("<tr><td>" + cookie.getName() + "</td>");

                                    out.print("<td>" + cookie.getValue() + " </td></tr>");

                                    FindCookie = true;
                                }
                            }

                                if (FindCookie)
                                {
                                    out.println("<p> Successfully created</p>");

                                }
                                else {
                                    response.sendRedirect("index.jsp");

                                }

                            }
                            else
                                {
                                    out.println("<p>No cookies</p>");
                                }


                    %>



            </table>
            <form method="post">
                <input type="submit" name="js_btn" value="View Cookie" onclick="Fun_viewCookie()"/>

                <!--script src="js/index.js"></script-->
            </form>
        </div>

        <input type="submit"  name="logout" value="Logout">
        <br>
        <br>


    </div>
    <div id="footer">

    </div>
</div>
</body>

</html>
<%
    if (request.getParameter("logout")!=null)
    {
        session.invalidate();
        for(Cookie ck1:cookies)
        {
            if(ck1.getName().equals("usrname"))
            {
                ck1.setDomain("localhost");
                ck1.setMaxAge(0);
                ck1.setValue(null);
                ck1.setPath("/");
                response.addCookie(ck1);

            }

        }

    }



%>
<%
    if(request.getParameter("logout") != null){
        Cookie cookie_destroy = null;
        Cookie[] cookieDestroy = null;


        cookieDestroy = request.getCookies();

        if( cookieDestroy != null ) {
            for (int i = 0; i < cookieDestroy.length; i++) {

                cookie_destroy = cookieDestroy[i];

                if ((cookie_destroy.getName()).compareTo("login_cookie") == 0) {
                    cookie_destroy.setMaxAge(0);

                    response.addCookie(cookie_destroy);

                }
                response.setHeader("REFRESH", "0");
            }
        }
    }
%>
