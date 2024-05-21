@RestResource(urlMapping='/integrateNavdeepOrg/*')
global class integrateNavdeep {
    @HttpGet
    global static List<Contact> findContact() {
       RestRequest req = RestContext.request;
        system.debug('---20---'+req);
       RestResponse res = RestContext.response;
        system.debug('---22---'+res);
        string keyword = RestContext.request.params.get('keyword');
        system.debug('keyword >>>> '+keyword);
        String aa = '%'+keyword+'%';
        string queryStr = 'SELECT Id,Name FROm Contact WHERE Name like : aa';
        List<Contact> contList = database.query(queryStr);
        system.debug('con'+contList);
       // req.setBody(contList); 
       return contList;       
    }
}