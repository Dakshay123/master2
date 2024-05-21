public class accInsert {
    @auraEnabled
    public static account createAcc(String name, String website, String phone, boolean opp){
        try{
            Account acc=new Account();
            acc.Name= name;
            system.debug('name---'+name);
            
            acc.Website= website;
            system.debug('name---'+website);
            
            acc.Phone=phone;
            system.debug('name---'+phone);
            
           // acc.Opportunity__c=opp;
            system.debug('name---'+opp);
            insert acc;
            return acc;
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }
    }
}