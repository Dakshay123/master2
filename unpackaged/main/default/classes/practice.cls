public class practice {
    
    public static void insert5Accounts(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='daksh3'+i;
            acc.Phone='1234567890';
            accList.add(acc);
            System.debug('created:- '+acc);
        }
        insert accList;
    }
    public static void insertOpp(){
        
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='daksh'+i;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        Insert oppList;
    }
    
    public static void insertRelated(){
        Account acc=new Account();
        acc.Name='dakshayKumar';
        insert acc;
        
        Contact con=new Contact();
        con.LastName=acc.Name;
        con.AccountId=acc.Id;
        insert con;
    }
    
    public static void insert5AccountsRelated(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='kk'+i;
            accList.add(acc);
        }
        insert accList;
        
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=0;i<5;i++){
            Opportunity opp=new Opportunity();
            opp.AccountId=accList[i].id;
            opp.Name=accList[i].Name;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        insert oppList;
        
        List<Contact> conList=new List<Contact>();
        
        for(Integer i=0;i<5;i++){
            Contact con=new Contact();
            con.AccountId=accList[i].id;
            con.LastName=accList[i].Name;
            conList.add(con);
        }
        insert conList;
    }
}