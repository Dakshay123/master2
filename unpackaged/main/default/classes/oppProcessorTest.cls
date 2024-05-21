@isTest
public class oppProcessorTest {

    @isTest
    Static void updateOppTest(){
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=1;i<=200;i++){
            Opportunity opp=new opportunity();
            opp.Name='Daksh'+i;
            Opp.CloseDate=System.today();
            Opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        
        oppProcessor opp=new oppProcessor();
        Id batchId=Database.executeBatch(opp);
        
        Test.stopTest();
        
        List<Opportunity> UpdatedOpp=new LIst<Opportunity>([SELECT Id, StageName From Opportunity
                                                           WHERE LeadSource = 'Web']);
        System.assertEquals(200, UpdatedOpp.size());
    }
}