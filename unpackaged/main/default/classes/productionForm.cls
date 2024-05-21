public class productionForm {
	@auraEnabled
    public static List<ProductionForm__c> getData(){
        List<ProductionForm__c> proList = [SELECT RL_GSM__c,RL_REEL__c,RL_WEIGHT__c,RL_WIDTH__c,FP_GSM__c,FP_REEL__c,FP_WEIGHT__c,
                                          FP_WIDTH__c,ORD_REEL__c,ORD_WIDTH__c,ORD_WEIGHT__c,ORD_LM__c,BNAME__c,BCODE__c,AVG__c,
                                          LINESPEED__c,OVENTEMP__c,START__c,STOP__c,SCRAP__c,COREBALANCE__c FROM ProductionForm__c];
        return proList;
    }
    @auraEnabled
    public static String saveData (String proData){
        try{
            system.debug(proData);
            List<ProductionForm__c> pList=(List<ProductionForm__c>)JSON.deserialize(proData, List<ProductionForm__c>.class);
            insert pList;
        }
        catch(exception e){
            
        }
        return 'success From APEX';
    }
}