@RestResource(urlMapping='/contactDetails/*')
global class demo6 {

    @HttpGet
    global static List<Contact> getContact(){
        RestRequest req=RestContext.request;
        
        map<String,String> paranMap= RestContext.request.params;
        String conLasTName=paranMap.get('LastName');
        
        List<Contact> conList=[SELECT Id,FirstName,LastName FROM Contact WHERE LastName =: conLasTName];
        return conList;
    }
}