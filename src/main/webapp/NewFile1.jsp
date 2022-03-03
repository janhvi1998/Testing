    <%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.net.URI" %>
    <%@page import="java.net.http.HttpClient"%>
    <%@page import="java.net.http.HttpRequest" %>
    <%@page import="java.net.http.HttpResponse" %> 
    <%@page import="org.json.JSONObject" %>
    <%@page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String url="http://www.infintrixindia.com/IGPortal/Service1.svc/GetEnquiryForMaster";
HttpRequest request1=HttpRequest.newBuilder().POST(HttpRequest.BodyPublishers.ofString(url)).uri(URI.create(url)).build();
HttpClient client=HttpClient.newBuilder().build();
HttpResponse<String> response1=client.send(request1,HttpResponse.BodyHandlers.ofString());
JSONObject jsonObject=new JSONObject(response1.body().toString());
JSONArray jsonarray = new JSONArray(jsonObject.getString("data"));
for (int i = 0; i < jsonarray.length(); i++) {
JSONObject jsonobject = jsonarray.getJSONObject(i);
String name = jsonobject.getString("Name");
String id = jsonobject.getString("ID");
out.println(id+"  "+name+"<br>");
}
%>
</body>
</html>