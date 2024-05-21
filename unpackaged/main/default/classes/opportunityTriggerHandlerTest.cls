@isTest
public class opportunityTriggerHandlerTest {

    @isTest
    Static void hotOpportunityTest(){
        List<Opportunity> oppList=new List<Opportunity>();
        oppList=DataFacrtory.createOpprtunityRecord('Daksh',10,False);
        
        For(Opportunity opp:oppList){
            opp.Amount = 200000;
        }
        Test.startTest();
        Insert oppList;
        Test.stopTest();
        
      /*  List<Opportunity> updatedOpp=new List<Opportunity>([SELECT Id, Description, Amount FROM Opportunity
                                                           WHERE Id =: oppList[0].Id]);
        System.assertEquals('Hot opportunity', updatedOpp[0].Description);*/
    }
    
    @isTest
    Static void updateDescriptionInsertTest(){
        List<Opportunity> oppList=new List<Opportunity>();
        oppList=DataFacrtory.createOpprtunityRecord('Daksh',10,False);
        
        For(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        Test.startTest();
        Insert oppList;
        Test.stopTest();
        
        List<Opportunity> oppList2=new List<Opportunity>();
        oppList2=DataFacrtory.createOpprtunityRecord('Daksh',10,False);
        
        For(Opportunity opp2:oppList2){
            opp2.StageName='Closed Lost';
        }
        Insert oppList2;
        
        List<Opportunity> oppList3=new List<Opportunity>();
        oppList3=DataFacrtory.createOpprtunityRecord('Daksh',10,True);
        
    }
    @isTest
    Static void updateDescriptionUpdateTest(){
        
        List<Opportunity> oppList=new List<Opportunity>();
        oppList=DataFacrtory.createOpprtunityRecord('Daksh',10,True);
        
        For(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        
        update oppList;
        
        For(Opportunity opp:oppList){
            opp.StageName='Closed Lost';
        }
        
        update oppList;
        
        For(Opportunity opp:oppList){
            opp.StageName='Qualification';
        }
        
        update oppList;
    }
}