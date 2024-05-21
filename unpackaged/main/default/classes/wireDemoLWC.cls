public class wireDemoLWC {
	@auraEnabled(cacheable=true)
    
    public static List<pp__c> getData(){
        List<pp__c> ppList=[SELECT Id, Name FROM pp__c];
        
        return ppList;
    }
}