<%@page import="mail.mail"%>
<%@page import="algo.CipherHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    String id=request.getParameter("id");
    String user=request.getParameter("user");
    String file=request.getParameter("file");
    String l=request.getParameter("email");
   
    
     String tkey="";
     String skey="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proxy","root","root");
   PreparedStatement pas=con.prepareStatement("select *from upload where  id='"+id+"' and user='"+user+"' and file='"+file+"' ");
   System.out.println(pas);
   ResultSet rs1=pas.executeQuery();
   System.out.println(pas);
    if(rs1.next()){
        
        tkey=rs1.getString("tkey");
      skey=rs1.getString("skey");
        System.out.println(skey);
    PreparedStatement ps=con.prepareStatement("Update urequest SET tkey='"+tkey+"',skey='"+skey+"' where  id='"+id+"' and user='"+user+"' and file='"+file+"'   "); 
    ps.executeUpdate();
    System.out.println(ps);
    mail m=new mail();
    String subject="Decryption key and Secret key ";
    String m1="Decryption key : "+tkey;
    String m2="Secret Key: "+skey;
    String m3="File NAme : "+file;
    String mall=m1+" "+m2+" "+m3;
    System.out.println(m1);
    System.out.println(m2);
    m.sendFromGMail("otpsendermessage@gmail.com", "wshjzpbeflqsobqc",l, subject,mall);
    }
    out.println("<script>"
                            +"alert('Key Generated to User Mail Id.')"
                            +"</script>");        
    RequestDispatcher rd=request.getRequestDispatcher("sendkey.jsp");
    rd.include(request, response);
%>