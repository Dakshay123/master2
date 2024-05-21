@isTest
public class futureCountCaseOfOriginTest {

    @isTest
    public static void countCaseTest(){
        List<Account> accList=new List<Account>();
        List<Id> accId=new List<Id>();
        List<Case> caseList=new List<Case>();
        For(Integer i=0;i<10;i++){
            Account acc=new Account();
            acc.Name='Dkahs'+i;
            accList.add(acc);
        }
        Test.startTest();
        Insert accList;
        for(Account acc: accList){
            accId.add(acc.Id);
        }
        For(Integer i=0;i<10;i++){
            Case c=new Case();
            if(i<5){
                c.Status='New';
                c.Origin='Phone'; 
                c.AccountId=accList[i].Id;
            }
            else{
                c.Status='New';
                c.Origin='Email';
                c.AccountId=accList[i].Id;
            }
           caseList.add(c); 
        }
        Insert caseList;
        futureCountCaseOfOrigin.countCase(accId);
        Test.stopTest();
      /*  
        List<Account> updateCase=[SELECT Id,CaseEmail__c, CasePhone__c FROM Account
                                  Where Id =: accId];
        System.assertEquals(1, updateCase[0].CaseEmail__c);*/
    }
}