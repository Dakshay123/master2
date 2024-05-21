public class practiceQuery {
    
    public static void createOppLastWeek(){
        List<Account> accList=new List<Account>([SELECT Id, Name FROM Account WHERE CreatedDate = LAST_WEEK]);
        List<Opportunity> oppList=new List<Opportunity>();
      	 if (!accList.isEmpty()){
            for(Integer i=1;i<=accList.size();i++){
                Opportunity opp=new Opportunity();
                
                opp.AccountId=accList[i].Id;
                opp.Name=accList[i].Name;
                opp.StageName='Prospecting';
                opp.CloseDate=System.today();
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}