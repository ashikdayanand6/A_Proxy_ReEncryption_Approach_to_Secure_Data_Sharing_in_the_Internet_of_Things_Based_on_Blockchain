<%@page import="java.sql.*"%>
<%try{
            String id=request.getParameter("id");
            String user=request.getParameter("user");
            String email=request.getParameter("email");
           
            String keyword=request.getParameter("keyword");
             String file=request.getParameter("file");
            String skey=request.getParameter("skey");
            String tkey=request.getParameter("tkey");
            String uid=session.getAttribute("id").toString();
            String uname=session.getAttribute("user").toString();
           
            
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/proxy","root","root");
            PreparedStatement ps=con.prepareStatement("insert into porequest(id,user,email,keyword,file,skey,tkey)values('"+id+"','"+user+"','"+email+"','"+keyword+"','"+file+"','"+skey+"','"+tkey+"')");
            System.out.println(ps); 
             ps.executeUpdate();
                out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Request Accepted  Successfully..\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("rereq.jsp");
            rd.include(request, response);  
            }
        catch(Exception e){
            System.out.println(e);
            out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Please Try Again.\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("rereq.jsp");
            rd.include(request, response);  
        }
    
%>