<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String user,pass;
    user=request.getParameter("user");
    pass=request.getParameter("pass");
    if(user.equals("ta")&&pass.equals("ta"))
    {
    out.println("<script>"
                    +"alert('Welcome Authority !!!!!')"
                    +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("/ahome.jsp");
                    rd.include(request, response);
            }
    else{
    out.println("<script>"
            +"alret('Please enter the valid Username and Password ')"
            
            +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("authority.jsp");
     rd.include(request, response);
            }
    
    %>
