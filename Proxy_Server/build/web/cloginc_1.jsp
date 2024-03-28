<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name,pass;
name=request.getParameter("name");
pass=request.getParameter("pass");
if(name.equals("CSP")&&(pass.equals("CSP"))){
out.println("<script>"
                            +"alert('Welcome Cloud Server Provider')"
                            +"</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/chome_1.jsp");
                    rd.include(request, response);
}
else
{
out.println("<script>"
                            +"alert('Please Enter Valid Username and Password')"
                            +"</script>");
                    RequestDispatcher rd=request.getRequestDispatcher("/cloud.jsp");
                    rd.include(request, response);
}
%>
