@isTest
public class AccBillToConTest {

    @isTest
    public static void addressCopyTest(){
        List<Account> accList=new List<Account>();
        List<Contact> conList=new List<Contact>();
        for(Integer i=0;i<10;i++){
            Account acc=new Account();
            acc.Name='Daksh'+i;
            acc.BillingCity='gsgs0';
            acc.BillingCountry='gsgs0';
            acc.BillingPostalCode='gsgs0';
            acc.BillingState='gsgs0';
            acc.BillingStreet='gsgs0';
            accList.add(acc);
        }
        insert accList;
        
        for(Integer i=0;i<10;i++){
            Contact con=new Contact();
            con.LastName='njnx'+i;
            con.AccountId=accList[i].Id;
            conList.add(con);
        }
        insert conList;
        id jobId=database.executeBatch(new AccBillToCon());
    }
}