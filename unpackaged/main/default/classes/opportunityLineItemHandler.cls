public class opportunityLineItemHandler {
    
    public static void deleteOpportunity(List<OpportunityLineItem> oppLine){
        List<Id> oppLineIds = new List<Id>();    
        List<Opportunity> oppList = new List<Opportunity>();     
        
        for (OpportunityLineItem oli3: oppLine){            
            oppLineIds.add(oli3.opportunityId);
        }        
        oppList=[Select Id, Name from Opportunity where Id IN:oppLineIds]; 
        
        if(!oppList.isEmpty()){
            delete oppList;
        }        
    }
    
    public static void createQuotaion(List<OpportunityLineItem> oppLine){
        set<Id> OppIds=new Set<Id>();
        List<Quote> quoteList=new List<Quote>();
        for(OpportunityLineItem oppLineObj:oppLine){
            OppIds.add(oppLineObj.OpportunityId);
        }
        
        List<opportunity> oppLIst=[SELECT Id, Name, Account.Name FROM Opportunity WHERE Id IN: OppIds];
        
        for(opportunity opp:oppList){
            Quote q=new Quote();
            q.OpportunityId= opp.id;
            q.name = opp.Account.Name;
            quoteList.add(q);
        }
        if(!quoteList.isEmpty()){
            Insert quoteList;
        }
    }
}