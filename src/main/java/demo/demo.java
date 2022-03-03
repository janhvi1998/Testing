package demo;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class demo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try
	   {
	   var url="http://www.infintrixindia.com/IGPortal/Service1.svc/GetEnquiryForMaster";
	   var request=HttpRequest.newBuilder().POST(HttpRequest.BodyPublishers.ofString(url)).uri(URI.create(url)).build();
	   var client=HttpClient.newBuilder().build();
	   var response=client.send(request,HttpResponse.BodyHandlers.ofString());
	   System.out.println(response.statusCode()); 
	   System.out.println(response.body());
	    
	   }
		catch(Exception e)
		{
		System.out.println(e.getMessage());	
		}
	}
}
