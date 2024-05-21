public class futureCountCaseOfOrigin {

    @Future
    public Static void countCase(List<Id> accId){
        list<Account> accList=[SELECT Id, CaseEmail__c, CasePhone__c, (SELECT Id, Origin FROM Cases) FROM Account WHERE Id In: accId];
        
        for(Account acc: accList){
            Integer Phone=0,Email=0;
            for(Case c:acc.Cases){
                if(c.Origin == 'Phone'){
                    Phone++;
                }else If(c.Origin == 'Email'){
                    Email++;
                }
            }
            acc.CaseEmail__c=Email;
            acc.CasePhone__c=Phone;
        }
        if(!accList.isEmpty()){
            Update accList;
        }
    }
}