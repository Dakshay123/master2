public class insertAssetOnOppLineHandler {
    
    public static void createAsset(List<OpportunityLineItem> oppLineList){
        set<Id> OpportunityIdSet=new set<Id>();
        List<Asset> assetList=new List<Asset>();
        
        for(OpportunityLineItem oppLine: oppLineList){
            OpportunityIdSet.add(oppLine.OpportunityId);
            system.debug('opportunity id---'+OpportunityIdSet);
        }
        
        List<Opportunity> oppList=[SELECT Id, Name, Account.Name, AccountId FROM Opportunity WHERE Id =: OpportunityIdSet];
        System.debug('opportunity list----'+oppList);
        
        for(Opportunity opp: oppList){
            Asset ast=new Asset();
            
            ast.Name = opp.Account.Name;
            ast.AccountId = opp.AccountId;
            assetList.add(ast);
            System.debug('asset List----'+assetList);
        }
        
        if(!assetList.isEmpty()){
            Insert assetList;
        }
    }
    
    public static void countProductQuantity(List<OpportunityLineItem> oppLineList){
        set<Id> OpportunityIdSet=new set<Id>();
        set<Id> oppLineIds=new set<Id>();
        Set<ID> accIds = new set<Id>();
        
        for(OpportunityLineItem oppLine: oppLineList){
            OpportunityIdSet.add(oppLine.OpportunityId);
            oppLineIds.add(oppLine.Id);
            
            System.debug('OpportunityIdSet---'+OpportunityIdSet);
            system.debug('oppLineIds------'+oppLineIds);
        }
        Map<String, Integer> accIdCountMap = new Map<String, Integer>();
        
        List<Opportunity> oppList = [SELECT Id, Name, AccountID FROM Opportunity
                                     WHERE id IN: OpportunityIdSet];
        for(Opportunity opp: oppList){
            accIds.add(opp.AccountID);
        }    
        
        List<Account> accList=[SELECT Id,Name,Total_sales_quantities__c FROM Account WHERE Id IN: accIds];
        
        for(Opportunity opp: [SELECT Id, Name, AccountID, (Select id from OpportunityLineItems) FROM Opportunity
                              WHERE AccountId IN: accIds]){
                                  
                                  accIdCountMap.put(opp.AccountID, opp.OpportunityLineItems.size());
                              }  
        for(Account acc:accList){
            if(accIdCountMap.containsKey(acc.id)){
                acc.Total_sales_quantities__c=accIdCountMap.get(acc.id);
            }
        }
        if(!accList.IsEmpty()){
            update accList;
        }
    }
}