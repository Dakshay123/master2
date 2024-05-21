public class DataFacrtory {

    public static List<Account> createAccountRecord(String Name, Integer Count, Boolean isInsert){
        List<Account> accList=new List<Account>();
        For(Integer i=1;i<=Count;i++){
            Account acc=new Account();
            acc.Name=Name +i;
            accList.add(acc);
        }
        if(isInsert == True){
            insert accList;
        }
        return accList;
    }
    
    public static List<Opportunity> createOpprtunityRecord(String Name, Integer Count,Boolean isInsert){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=Count;i++){
            Opportunity opp=new Opportunity();
            opp.Name=Name+i;
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        if(isInsert == True){
            Insert oppList;
        }
        return oppList;
    }
}