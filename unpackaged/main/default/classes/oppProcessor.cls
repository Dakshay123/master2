public class oppProcessor Implements Database.Batchable<sObject>, Database.stateful{

    public Integer countRecord=0;
    
    public database.QueryLocator start (database.BatchableContext bc){
        return database.getQueryLocator([SELECT Id, LeadSource FROM Opportunity]);
    }
    
    public void execute (database.BatchableContext bc, List<Opportunity> oppList){
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                opp.LeadSource='Web';
            }
            update oppList;
            countRecord=countRecord+oppList.size();
        }
    }
    
    public void finish (database.BatchableContext bc){
        System.debug('total---'+countRecord);
    }
}