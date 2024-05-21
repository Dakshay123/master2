public class opportunityTriggerHandler {

    public static void oppLimeItemCreate(List<Opportunity> oppList){
        
        for(opportunity op:oppList){
           // Opportunity op2=[select id,name,Pricebook2Id from opportunity where Pricebook2Id != NULL LIMIT 1];
            op.Pricebook2Id = '01s5i00000FkdCRAAZ';
            OpportunityLineItem oli = new OpportunityLineItem(OpportunityID=op.ID,TotalPrice=100);

            oli.Quantity=2;
            insert oli;
        }
        
    }
    
    public static void hotOpportunity(List<Opportunity> oppList){
        for(Opportunity opp:oppList){
            System.debug('opp---'+opp);
            if(opp.Amount != null && opp.Amount >= 100000 && opp.Amount <=500000){
                opp.Description ='Hot opportunity';
                system.debug('desp---'+opp.Description);
            }
        }
    }
    
    public static void recentOpportunityAmount(List<Opportunity> oppList){
        List<Account> updateAcc=new List<Account>();
        for(Opportunity opp:oppList){
            System.debug('oppList---'+opp);
            if(opp.Amount != null && opp.AccountId != null){
                Account acc=new Account();
                acc.Id=opp.AccountId;
                acc.recent_opportunity_amount__c = opp.Amount;
                System.debug('accAmount---'+acc.recent_opportunity_amount__c);
                updateAcc.add(acc);
                System.debug('accList---'+updateAcc);
            }
        }
        if(!updateAcc.isEmpty()){
            UPDATE updateAcc;
        }
    }
    
    public static void updateDescription(List<Opportunity> oppList){
        for(Opportunity opp: oppList){
            if(opp.StageName == 'Closed Won'){
                opp.Description = 'Closed Won';
            }
           else if(opp.StageName == 'Closed Lost'){
                opp.Description = 'Closed Lost';
            }
            else{
                opp.Description = 'stage open';
            }
        }
    }
    public static void updateDescription(List<Opportunity> oppList, Map<Id,Opportunity> oppOldMap){
        
        for(Opportunity opp: oppList){
            if(opp.StageName != oppOldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Closed Won';
                }
                else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Closed Lost';
                }
                else{
                    opp.Description = 'stage open';
                } 
            }
        }
    }
    
    public static void createTaskWhenStageUpdate(List<Opportunity> oppList, Map<Id,Opportunity> oppOldMap){
        List<Task> taskList=new List<Task>();
        for(Opportunity opp: oppList){
            if(opp.StageName != oppOldMap.get(opp.Id).StageName){
                Task tsk=new Task();
                tsk.WhatId=opp.Id;
                tsk.Priority = 'Normal';
                tsk.Status='Not Started';
                tsk.OwnerId = userinfo.getuserId();
                tsk.Subject='test';
                taskList.add(tsk);
            }
        }
        if(!taskList.isEmpty()){
           INSERT taskList;
        }
    }
    
    public static void rollAmountInAccountRevenue(List<Opportunity> oppList){
        set<Id> oppSet=new set<Id>();
        for(Opportunity opp: oppList){
            oppSet.add(opp.AccountId);
        }
        Decimal amt=0.00;
        List<Account> accList2=new List<Account>();
        for(Account acc:[SELECT Id, AnnualRevenue, (SELECT Id,AccountId,Amount FROM Opportunities) FROM Account Where Id In: oppSet]){
            System.debug('acc---'+acc);
            for(Opportunity acc3:acc.Opportunities)  {
                amt=amt+acc3.Amount;
                System.debug('AMt---'+amt);
            }
            acc.AnnualRevenue = amt;
            accList2.add(acc);
            System.debug('accList---'+accList2);
        }
        if(!accList2.isEmpty()){
            UPDATE accList2;
        }
    }
    public static void rollAmountInAccountRevenue(List<Opportunity> oppList2, Map<Id,Opportunity> oppOldMap){
        
       set<Id> oppSet=new set<Id>();
        for(Opportunity opp: oppList2){
            if(opp.AccountId != oppOldMap.get(opp.Id).AccountId){
                oppSet.add(opp.AccountId);
                oppSet.add(oppOldMap.get(opp.Id).AccountId);
            }
        }
         Decimal amt=0.00;
        List<Account> accList2=new List<Account>();
        for(Account acc:[SELECT Id, AnnualRevenue, (SELECT Id,AccountId,Amount FROM Opportunities) FROM Account Where Id In: oppSet]){
            System.debug('acc---'+acc);
            for(Opportunity acc3:acc.Opportunities)  {
                amt=amt+acc3.Amount;
                System.debug('AMt---'+amt);
            }
            acc.AnnualRevenue = amt;
            accList2.add(acc);
            System.debug('accList---'+accList2);
        }
        if(!accList2.isEmpty()){
            UPDATE accList2;
        }
    }
    
   /* public static void rollAmountInAccountRevenue(List<Opportunity> oppList3){
        set<Id> oppSet=new set<Id>();
        for(Opportunity opp: oppList3){
            oppSet.add(opp.AccountId);
        }
        Decimal amt=0.00;
        List<Account> accList2=new List<Account>();
        for(Account acc:[SELECT Id, AnnualRevenue, (SELECT Id,AccountId,Amount FROM Opportunities) FROM Account Where Id In: oppSet]){
            System.debug('acc---'+acc);
            for(Opportunity acc3:acc.Opportunities)  {
                amt=amt+acc3.Amount;
                System.debug('AMt---'+amt);
            }
            acc.AnnualRevenue = amt;
            accList2.add(acc);
            System.debug('accList---'+accList2);
        }
        if(!accList2.isEmpty()){
            UPDATE accList2;
        }
    }*/
}