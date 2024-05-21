public class Sqaure {

    public static void createAccount(){
    Account acc=new Account();
    acc.Name='dakki2';
    insert acc;
        
     	Contact con=new Contact();
        con.LastName = acc.Name;
        con.AccountId=acc.Id;
        insert con;
        
        Opportunity opp=new Opportunity();
        opp.Name=acc.Name;
        opp.StageName='Closed Won';
        opp.CloseDate=System.today();
        opp.AccountId=acc.Id;
        insert opp;
    }
}