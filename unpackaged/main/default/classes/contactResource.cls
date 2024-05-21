@RestResource(urlMapping='/contactApi/*')						//Setting up Request Url
global with sharing class contactResource {

    @HttpGet
    global static List<Contact> getContact(){
        RestRequest req=RestContext.request;					//Initializing the request parameter with the incoming request
        
        String reqURI = req.requestURI;							//getting request URI
        Integer contactLimit = Integer.valueOf(
        	reqURI.substring(reqURI.lastIndexOf('/')+1));		//Fetch LIMIT From URI
        
        List<Contact> conList=[SELECT Id,Name FROM Contact LIMIT:contactLimit];
        return conList;
    }
}