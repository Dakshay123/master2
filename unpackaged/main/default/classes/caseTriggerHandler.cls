public class caseTriggerHandler {

    public static void latestCaseNumberOnAccount(List<Case> caseList){
        List<Account> accList=new List<Account>();
        for(Case c:caseList){
            Account acc=new Account();
            if(c.Id != null && c.AccountId != null){
                acc.Id = c.AccountId;
                acc.latest_case_number__c =decimal.valueOf(c.CaseNumber) ;
                accList.add(acc);
                System.debug('acc---'+accList);
            }
        }
        if(!accList.isEmpty()){
          UPDATE accList;
        }
    }
}