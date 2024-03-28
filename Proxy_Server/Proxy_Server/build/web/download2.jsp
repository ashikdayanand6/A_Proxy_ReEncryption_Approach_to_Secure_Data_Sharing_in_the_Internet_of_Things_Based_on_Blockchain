
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%
   
    String tkey=request.getParameter("tkey");
    String skey=request.getParameter("skey");
    String dke=request.getParameter("dke");
    String ske=request.getParameter("ske");
    String file
            =request.getParameter("file");
    System.out.println(skey);
    String id=session.getAttribute("id").toString();
    String name=session.getAttribute("user").toString();
    Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proxy","root","root");
                        PreparedStatement query=con.prepareStatement("select * from urequest where tkey='"+tkey+"' and skey='"+skey+"'and status='Accept'  ");
                        ResultSet rs=query.executeQuery();
                        System.out.println(query);
                        if(rs.next())
                        {
                            String filename=rs.getString("file");
                            System.out.println("wlocme");
     String filePath = "C:\\files\\"+filename;   
System.out.println(filePath);
      File downloadFile = new File(filePath);
   FileInputStream inStream = new FileInputStream(downloadFile);
    
   // if you want to use a relative path to context root:
   String relativePath = getServletContext().getRealPath("");
   System.out.println("relativePath = " + relativePath);
    
   // obtains ServletContext
   ServletContext context = getServletContext();
    
   // gets MIME type of the file
   String mimeType = context.getMimeType(filePath);
   if (mimeType == null) {        
       // set to binary type if MIME mapping not found
       mimeType = "application/octet-stream";
   }
   System.out.println("MIME type: " + mimeType);
   
   // modifies response
   response.setContentType(mimeType);
   response.setContentLength((int) downloadFile.length());
    
   // forces download
   String headerKey = "Content-Disposition";
   String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
   response.setHeader(headerKey, headerValue);
    
   // obtains response's output stream
   OutputStream outStream = response.getOutputStream();
    
   byte[] buffer = new byte[4096];
   int bytesRead = -1;
    
   while ((bytesRead = inStream.read(buffer)) != -1) {
       outStream.write(buffer, 0, bytesRead);
   }    
   inStream.close();
   outStream.close();
 PreparedStatement query1=con.prepareStatement("Update urequest set Dstatus='Delivery' where uid='"+id+"' and uname='"+name+"'and tkey='"+tkey+"' and skey='"+skey+"'and status='Accept'  ");
 System.out.println(query1); 
 query1.executeUpdate();               
     
      out.println("<script>"
				+"alert('File download....')"
				+"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("download.jsp");
    rd.include(request, response);
    }
    else
    {
    out.println("<script>"
				+"alert('You Enter the Wrong Key.....')"
				+"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("download.jsp");
    rd.include(request, response);
    }
%>