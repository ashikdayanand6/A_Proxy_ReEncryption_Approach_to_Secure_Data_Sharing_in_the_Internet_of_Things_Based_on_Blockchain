<%@page import="java.sql.*"%>
<%try{
            String id=request.getParameter("id");
            String user=request.getParameter("user");
            String keyword=request.getParameter("keyword");
            String file=request.getParameter("file");
            String skey=request.getParameter("skey");
            String tkey=request.getParameter("tkey");
            String uid=session.getAttribute("id").toString();
            String uname=session.getAttribute("user").toString();
            String emial=session.getAttribute("email").toString();
            
            int i=1;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/proxy","root","root");
           PreparedStatement ps=con.prepareStatement("insert into urequest(id,user,keyword,file,uid,uname,skey,tkey,email)values('"+id+"','"+user+"','"+keyword+"','"+file+"','"+uid+"','"+uname+"','"+skey+"','"+tkey+"','"+emial+"')");
             System.out.println(ps); 
             ps.executeUpdate();
                out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Request Send  Successfully..\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("file.jsp");
            rd.include(request, response);  
            }
        catch(Exception e){
            System.out.println(e);
            out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Please Try Again.\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("file.jsp");
            rd.include(request, response);  
        }
    
%>