public class oppWrapper {
    
    public bigWrapper bigObj{get;set;}
    public Boolean isChecked{ get; set; }
    public Account accc{get;set;}
    public oppWrapper(){
        accc = new Account();
        bigObj=new bigWrapper();
        List<oppList> oppsObj = new List<oppList>();
        isChecked=true;
        for(Opportunity opp:[SELECT Id, Name, StageName,CloseDate, LeadSource FROM Opportunity]){
            if(isChecked==true){
                oppList obj=new oppList();
                obj.oppName=opp.Name;
                obj.oppStage=opp.StageName;
                obj.oppDate=opp.CloseDate;
                obj.oppSource=opp.LeadSource;
                oppsObj.add(obj);
                
            }
        }
        bigObj.oppObj=oppsObj;
        
        System.debug('opp------'+bigObj);
    }
    public void saved(){
        insert accc;
    }
    public class bigWrapper{
        public List<oppList> oppObj{get;set;}
    }
    
    public class oppList{
        public String oppName{get;set;}
        public String oppStage{get;set;}
        public Date oppDate{get;set;}
        public String oppSource{get;set;}
    }
}