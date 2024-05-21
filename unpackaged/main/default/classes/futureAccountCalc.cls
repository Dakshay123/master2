public class futureAccountCalc {

    @future
    public static void countContact(List<Id> accId){
        List<Account> accList=[SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id In: accId];
        for(Account acc: accList){
            acc.CountContact__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}