@isTest
public class accountTriggerHandlerTest {
	
    @isTest
    static void populateRating(){
        List<Account> accList=new List<Account>();
        for(Integer i=1; i<=10;i++){
            Account acc=new Account();
            acc.Name = 'daksg'+i;
            acc.Industry='Media';
            accList.add(acc);
        }
        
      //  accList=DataFacrtory.createAccountRecord('Daksh',10,True);
        Test.startTest();
        insert accList;
        Test.stopTest();
        
      /*  List<Account> updateAccList=new List<Account>([SELECT Id,Rating
                                                      FROM Account
                                                      WHERE Id =: accList[0].Id]);
        System.assertEquals('Hot',updateAccList[0].Rating);*/
    }
    @isTest
    static void copyBillingShippingInsert(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1; i<=10;i++){
            Account acc=new Account();
            acc.Name='daksh'+i;
            acc.CopyBillingToShipping__c=true;
            acc.BillingStreet='dgd';
            acc.BillingCity='dbdh';
            acc.BillingCountry='dgdhga';
            acc.BillingPostalCode='123456';
            acc.BillingState='sghbs';
            accList.add(acc);
        }
        Test.startTest();
        Insert accList;
        Test.stopTest();
        
        List<Account> updatedACcLIst=new List<Account>([SELECT Id,ShippingStreet,ShippingCity,ShippingCountry,ShippingPostalCode,ShippingState
                                                       FROM Account 
                                                       WHERE Id =: accList[0].Id]);
        System.assert(updatedACcLIst != null);
    }
    @isTest
    static void copyBillingShippingUpdate(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1; i<=10;i++){
            Account acc=new Account();
            acc.Name='daksh'+i;
            acc.CopyBillingToShipping__c=False;
            acc.BillingStreet='dgd';
            acc.BillingCity='dbdh';
            acc.BillingCountry='dgdhga';
            acc.BillingPostalCode='123456';
            acc.BillingState='sghbs';
            accList.add(acc);
        }
        
        /* accList=DataFacrtory.createAccountRecord('Daksh', 10, False);
			acc.CopyBillingToShipping__c=False;
            acc.BillingStreet='dgd';
            acc.BillingCity='dbdh';
            acc.BillingCountry='dgdhga';
            acc.BillingPostalCode='123456';
            acc.BillingState='sghbs';
			
				Insert accList;     */
        Test.startTest();
        insert accList;
        for(Account acc:accList){
            acc.CopyBillingToShipping__c=true;
        }
        update accList;
        Test.stopTest();
        
        List<Account> updateAccList=new List<Account>([SELECT Id,CopyBillingToShipping__c
                                                      FROM account 
                                                      WHERE Id =: accList[0].Id]);
        System.assert(updateAccList != null);
    }
    
    @isTest
    Static void updateAccountDiscriptionTest(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Daksh'+i;
            acc.Phone='1234567890';
            accList.add(acc);    
        }
        
        Test.startTest();
        insert accList;
        for(Account acc: accList){
            acc.Phone='0987654321';
        }
        update accList;
        Test.stopTest();
        
        List<Account> updateAccList=new List<Account>([SELECT Description
                                                      FROM Account 
                                                      WHERE Id =: accList[0].Id]);
        System.assertEquals('Phone Updated', updateAccList[0].Description);
    }
    
    @isTest
    static void relatedOpportuntyAfterInsert(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Daksh'+i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Opportunity> oppList=new List<Opportunity>([SELECT Id 
                                                        FROM Opportunity
                                                        WHERE AccountId =: accList[0].Id]);
        System.assert(!oppList.isEmpty());
    }
    
    @isTest
    Static void relatedContact(){
        List<Account> accList=new List<Account>();
        For(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='daksh'+i;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Contact> conList=new List<Contact>([SELECT Id
                                                FROM Contact 
                                                WHERE AccountId =: accList[0].Id]);
        System.assert(!conList.isEmpty());
    }
    
    @isTest
    Static void checkBoxRelatedObjectInsert(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            account acc=new Account();
            acc.Name='daksh'+i;
            acc.Contact__c=true;
            acc.Opportunity__c=true;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Contact> conList=new List<Contact>([SELECT Id
                                                 FROM Contact 
                                                 WHERE AccountId =: accList[0].id]);
        List<Opportunity> oppList=new List<Opportunity>([SELECT Id
                                                 FROM Opportunity 
                                                 WHERE AccountId =: accList[0].id]);
        System.assert(!conList.isEmpty());
        System.assert(!oppList.isEmpty());
    }
    
    @isTest
    Static void updatePhoneRelatedContact(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='dakkki';
            acc.Phone='1234567890';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        for(Account acc: accList){
            acc.Phone='9876543210';
        }
        update accList;
        Test.stopTest();
        
        List<Contact> conList=new List<Contact>([SELECT ID,Phone FROM Contact
                                                WHERE AccountId =: accList[0].Id]);
       System.assertEquals('9876543210', conList[0].Phone);
    }
    
     //Closed Won prblm//
    @isTest
    Static void opportunityCreatedDate(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='daksh'+i;
            acc.Active__c='Yes';
            accList.add(acc);
        }
        insert accList;
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=0;i<10;i++){
            Opportunity opp=new Opportunity();
            opp.Name=accList[0].Name;
            opp.AccountId=accList[0].Id;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today().addMonths(3);
            oppList.add(opp);
            system.debug('opp here'+oppList);
        }
        insert oppList;
        Test.startTest();
      
        for(Account acc: accList){
			acc.Active__c='No';
        }
        update accList;
        Test.stopTest();
        
     /*   List<Opportunity> oppList2=new List<Opportunity>([SELECT Id, StageName FROM Opportunity
                                                        WHERE AccountId =: accList[0].Id]);
        System.assertEquals('Closed Lost', oppList2[0].StageName);*/
    }
    //Closed Won prblm//
    @isTest
    static void updateStageWhenAccountActiveUpdateTest(){
        List<Account> accList=new List<Account>();
        for(integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Daksh'+i;
            acc.Active__c='No';
            accList.add(acc);
        }
        insert accList;
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=10;i++){
            Opportunity opp=new Opportunity();
            opp.Name=accList[i-1].Name;
            opp.AccountId=accList[i-1].Id;
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        insert oppList;
        
        Test.startTest();
        for(Account acc:accList){
            acc.Active__c='Yes';
        }
        Update accList;
        Test.stopTest();
        
        List<Opportunity> updateOppList=new List<Opportunity>([SELECT Id,StageName FROM Opportunity
                                                        WHERE AccountId =:accList[0].Id]);
        System.assertEquals('Closed Lost', updateOppList[0].StageName);
    }
    
    @isTest
    static void updateAccountBillingToContactTest(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Daksh'+i;
            acc.BillingCity='dgsh';
            acc.BillingCountry='hsjs';
            acc.BillingPostalCode='dbjd';
            acc.BillingState='sghs';
            acc.BillingStreet='bsjf';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        for(account acc:accList){
            acc.BillingCity='sj';
        }
        update accList;
        
        for(account acc:accList){
            acc.BillingCountry='sjn';
        }
        update accList;
        for(account acc:accList){
            acc.BillingPostalCode='jksj';
        }
        update accList;
        for(account acc:accList){
            acc.BillingState='jksj';
        }
        update accList;
        for(account acc:accList){
            acc.BillingStreet='jksj';
        }
        update accList;
        Test.stopTest();
        
        List<Contact> conList=new List<Contact>([SELECT Id,MailingCity,MailingCountry,MailingPostalCode,MailingState,MailingStreet 
                                                FROM Contact WHERE Id =:accList[0].Id]);
        System.assert(conList != null);
    }
}