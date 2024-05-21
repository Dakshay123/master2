@isTest
public class futureAccountCalcTest {

    @isTest
    Static void countContactTest(){
        List<Account> accList=new List<Account>();
        List<Contact> conList=new List<Contact>();
        List<Id> accId=new List<Id>();
        
        for(Integer i=1;i<=30;i++){
           Account acc=new Account();
            acc.Name='Dalsh'+i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            accId.add(acc.Id);
            conList.add(con);
        }
        insert conList;
        
        futureAccountCalc.countContact(accId);
        Test.stopTest();
    }
}