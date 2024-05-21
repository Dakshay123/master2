public class practiceUpsert {
    
    public static void method1(){
        List<Account> accList=new List<Account>([SELECT Id,Phone,Name FROM Account WHERE Phone ='0987654321']);
        
        for(Account acc: accList){
            acc.Phone='1234567890';
        }
        
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='kkk'+i;
            accList.add(acc);
        }
        upsert accList;
    }
    
    public static void method2(){
        List<Opportunity> oppList=new List<Opportunity>([SELECT Id,Name,StageName, CloseDate FROM Opportunity WHERE CreatedDate = LAST_MONTH]);
        
        for(Opportunity oppObj: oppList){
            oppObj.StageName='Closed Won';
        }
        
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='dk'+i;
            opp.StageName='Closed Won';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        upsert oppList;
    }
}