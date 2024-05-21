public class apexScenario {

    public static void accountRelatedContact(){
        List<Account> accList=new List<Account>([SELECT Id,Name,Phone,(SELECT Id,FirstName from Contacts) from Account WHERE Phone != null]);
        
        if(!accList.isEmpty()){
            for(Account acc:accList){
                System.debug(acc.Name+' has '+acc.Contacts.size()+' contacts related');
            }
        }
    }
    
    public static void opportunityRelatedContact(){
        
        //through the child to parent query:-
        
        List<Opportunity> oppList=new List<Opportunity> ([SELECT Id,AccountId,Name,Amount, Account.Name from opportunity WHERE Account.Phone != null]);
        
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                Decimal total=0;
                if(opp.Amount != null){
                	total=total+opp.Amount;
                System.debug(opp.Account.Name+' has ' + total + 'total opportunity amount ');
				}
            }
        }
    }
    
    public static void opportunityRelatedContact_Alternate(){
        
        //through the parent to child query:-
        
        List<Account> accList=new List<Account> ([SELECT Id,Name,(SELECT Id, Name,Amount FROM Opportunities) FROM Account WHERE Phone != null]);
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal total=0;
                for(Opportunity opp:acc.Opportunities){
                    if(opp.Amount != null){
                    total=total+opp.Amount;
                    }
                }
                System.debug(acc.Name + ' has '+ total +' worth opportunity ');
            }
        }
    }
    
    public static void updateDiscriptionOpp(){
        
        List<Opportunity> oppList=new List<Opportunity>([SELECT Id,StageName from Opportunity WHERE CreatedDate = THIS_YEAR]);
        
        if(!oppList.isEmpty()){
            for(Opportunity opp: oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Closed Won';
                }
               else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Closed Lost';
                }
                else{
                    opp.Description = ' open ';
                }
            }
            update oppList;
        }
    }
    
    public static void countContactRelatedAccount(){
        List<Account> accList=new List<Account>([SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE CreatedDate = THIS_YEAR]);
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Related_Contact_Count__c = acc.Contacts.size();
            }
            update accList;
        }
    }
    
    public static void updatePhoneContactRelatedAccount(){
        List<Contact> conList=new List<Contact>([SELECT Id,MobilePhone,Account.Phone FROM Contact WHERE CreatedDate = LAST_MONTH AND MobilePhone = null]);
        
        if(!conList.isEmpty()){
            for(Contact con:conList){
                if(con.Account.Phone != null){
                con.MobilePhone=con.Account.Phone;
                }
            }
            update conList;
        }
    }
}