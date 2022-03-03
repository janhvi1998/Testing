<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.io.OutputStream" %>
<%@page import="java.io.OutputStreamWriter" %>
<%@page import="java.net.HttpURLConnection" %>
<%@page import="java.net.MalformedURLException" %>
<%@page import="java.net.ProtocolException" %>
<%@page import="java.net.URL" %>
<%@page import="org.json.JSONObject" %>
<%@page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%



URL obj = new URL("http://www.infintrixindia.com/IGPortal/Service1.svc/InsertLead");
HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
postConnection.setRequestMethod("POST");
postConnection.setRequestProperty("userId", "a1bcdefgh");
postConnection.setRequestProperty("Content-Type", "application/json");
JSONObject sendreq=new JSONObject();
sendreq.put("City","1");
sendreq.put("CompanyName","InfintrixGlobal");
sendreq.put("CompanyType","IT");
sendreq.put("Country","1");
sendreq.put("Date","18-08-2021");
sendreq.put("Email","a@b.com");
sendreq.put("EnquirySource","1");
sendreq.put("FirstName","Tanvir");
sendreq.put("Interest","1");
sendreq.put("LastName","Dalal");
sendreq.put("Location","Mumbai");
sendreq.put("Mobile","1234567890");
sendreq.put("Mode","1");
sendreq.put("PrefferedTechnology","Android");
sendreq.put("Remarks","Remark");
sendreq.put("State","1");
sendreq.put("Status","1");
sendreq.put("Technology","Yes");
sendreq.put("Website","www.abc.com");
//sendreq.put("EnquiryFor","[iOS,APP,Website]");




System.out.print("sendreq"+sendreq);



postConnection.setDoOutput(true);
OutputStream os = postConnection.getOutputStream();
os.write(sendreq.toString().getBytes());
os.flush();
os.close();




int responseCode = postConnection.getResponseCode();
System.out.println("POST Response Code : " + responseCode);
System.out.println("POST Response Message : " + postConnection.getResponseMessage());



if (responseCode == 200) { //success

System.out.println("CREATED");
BufferedReader in = new BufferedReader(new InputStreamReader(
postConnection.getInputStream()));
String inputLine;
StringBuffer response1 = new StringBuffer();



while ((inputLine = in .readLine()) != null) {
response1.append(inputLine);
} in .close();



// print result
System.out.println("@@@"+response1.toString());


} else {
System.out.println("POST NOT WORKED");
}



%>
</body>
</html>