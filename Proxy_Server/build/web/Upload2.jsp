<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%    
try {
String paname=request.getParameter("user");
String keyword=request.getParameter("keyword");
String tkey=request.getParameter("tkey");
String skey =request.getParameter("skey");
String user=session.getAttribute("user").toString();
String id=session.getAttribute("id").toString();
String email=session.getAttribute("email").toString();
String mobile=session.getAttribute("mobile").toString();
System.out.println(paname+ "Test" +email);
String sno=request.getParameter("sno");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proxy","root","root");                
                    PreparedStatement query=con.prepareStatement("update urequest set tkey='"+tkey+"' , skey='"+skey+"' where id='"+id+"' and user='"+user+"' and keyword='"+keyword+"'");
                    System.out.println(query);
                    query.executeUpdate();
                    System.out.println(query);
                    out.println("<script>"); 			
                    out.println("alert(\"Update Proxy Re-Encryption Key Succesfully\")");
                    out.println("</script>");

                    RequestDispatcher rd=request.getRequestDispatcher("proupload.jsp");
                    rd.include(request,response);		
		}
                catch(Exception e){
                    out.println("<script>"); 			
                    out.println("alert(\"Please Try Again..\")");
                    out.println("</script>");

                    RequestDispatcher rd=request.getRequestDispatcher("proupload.jsp");
                    rd.include(request,response);
                }

%>