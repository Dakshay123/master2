public class practiceDelete {

    public static void checkDelete(){
        List<Account> accList=new List<Account>([SELECT Id,Phone FROM Account WHERE Phone='1234567890']);
        
        delete accList;
    }
    
    public static void checkDelete2(){
        List<Opportunity> accList=new List<Opportunity>([SELECT Id,Name,StageName, CloseDate FROM Opportunity WHERE CreatedDate = LAST_MONTH AND StageName = 'Close Lost']);
        
        delete accList;
    }
}