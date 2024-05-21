public class assetTriggerHandler {
    public static void createOpp_OppLine(List<Asset> assetList){
        Set<Id> accIds=new Set<Id>();
        List<Opportunity> oppList=new List<Opportunity>();
        Set<Id> OppIds=new Set<Id> ();
        Set<Id> ProIds=new Set<Id> ();
        List<OpportunityLineItem> oppLineList=new List<OpportunityLineItem>();
        
        for(Asset ast: assetList){
            accIds.add(ast.AccountID);
            ProIds.add(ast.Product2Id);
            system.debug('accIds----'+accIds);
        }
        List<Account> accList=[SELECT Id, Name FROM Account WHERE Id In : accIds];
        system.debug('accList----'+accList);
        
        for(Account acc:accList){
            Opportunity opp=new Opportunity();
            opp.AccountId = acc.Id;
            Opp.CloseDate=system.today();
            opp.Name=acc.Name;
            opp.StageName='Closed Won';
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            Insert oppList;
        }
        system.debug('oppList----'+oppList);
        
        List<Opportunity> oppList2=[SELECT Id, Name, AccountId,Pricebook2Id FROM Opportunity WHERE AccountId IN: accIds];
        system.debug('oppList2----'+oppList2);
        
        for(Opportunity opp2: oppList2){
            OpportunityLineItem oppLine=new OpportunityLineItem();
            oppLine.OpportunityId = opp2.Id;
            oppLine.Quantity=20;
            oppLine.Product2Id=opp2.Pricebook2Id;
         /*   oppLine.Product2Id=*/
            oppLine.TotalPrice=112;
            oppLineList.add(oppLine);
        }
        if(!oppLineList.isEmpty()){
            Insert oppLineList;
        }
        system.debug('oppLineList----'+oppLineList);
    }
}