<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<a href="graph1.jsp">Click back</a>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proxy", "root", "root");
PreparedStatement p=con.prepareStatement("SELECT COUNT(uid)AS cou,uid,uname,file FROM urequest GROUP BY file ");
ResultSet r=p.executeQuery();
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
while(r.next()){
    String filename=r.getString("file");
    int rank=r.getInt("cou");
    map = new HashMap<Object,Object>(); map.put("label", filename); map.put("y", rank); list.add(map);
}
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Result Based on File Request"
	},
	data: [{
		type: "pie",
		toolTipContent: "<b>{label}</b>: {y}%",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>          

