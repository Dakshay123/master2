public class apexIntegrateClass {
    public static void getAccount(){
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('Callout:demoApex/services/apexrest/accountmgmnt/');
        req.setMethod('GET');
      //  req.setHeader('content-Type', 'application/JSON;charSet=UTF-8');
        HttpResponse res=http.send(req);
        System.debug('res---'+res.getBody());
        System.debug('res---'+res.getStatusCode());
    }
}