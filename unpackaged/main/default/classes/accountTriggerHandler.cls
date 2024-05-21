public class accountTriggerHandler {
    
    public static void populateRating(List<Account> accList){
            for(Account acc:accList){
                if(acc.Industry != null && acc.Industry == 'Media'){
                    acc.Rating = 'Hot';
                }
            } 
    }
    
    public static void relatedOpportunty(List<Account> accList){
        
        if(!accList.isEmpty()){
            List<Opportunity> oppList=new List<Opportunity>();
            
            for(Account acc:accList){
                
                Opportunity opp=new Opportunity();
                
                opp.Name=acc.Name;
                opp.StageName='Closed Won';
                opp.CloseDate=System.today();
                opp.AccountId=acc.Id;
                oppList.add(opp);  
            }
            insert oppList;
        }
    }
    
    public static void updateAccountDiscription(List<Account> accList, Map<Id,Account> accOldMap){
        
        for(Account acc:accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description = 'Phone Updated';
            }
        }
    }
    
    public static void updatePhoneRelatedContact(List<Account> accList, Map<Id, Account> accOldMap){
     /*   List<Contact> conList=new List<Contact>();
        integer i=0;
        for(Contact con:[select id,name,phone,accountId from contact where accountId =: accOldMap.keyset()]){
            system.debug('i'+i);
            con.phone = accList[0].Phone;
            conList.add(con);
        }
        i=0;
        update conList;*/
         
        List<Contact> conList=new List<Contact>();
        Map<Id, Account> accListUpdate=new Map<Id, Account>();
        
        for(Account acc:accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                System.debug('Account data :- '+acc);
                accListUpdate.put(acc.Id,acc);
            }
        }
        
        for(Contact con:[SELECT Id,Phone,AccountId FROM Contact WHERE Id In:accListUpdate.keySet()]){					         
                con.Phone=accListUpdate.get(con.AccountId).Phone;
                System.debug('conList :- '+con);
                conList.add(con);            
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    /*  public static void updatePhoneRelatedContact_AlterNate(List<Account> accList, Map<Id, Account> accOldMap){

List<Contact> conList=new List<Contact>();
set<Id> accId=new set<Id>();

for(Account acc:accList){
if(acc.Phone != accOldMap.get(acc.Id).Phone){
accId.add(acc.Id);
}
}
for(Account acc:[SELECT Id,Phone, (SELECT Id,AccountId,Phone FROM Contacts) FROM Account WHERE Id In: accId]){
if(acc.Contacts != null){
for(Contact con:acc.Contacts){
con.Phone=acc.Phone;
conList.add(con);
}

}
}
if(!conList.isEmpty()){
update conList;
}
} */
    
    public static void copyAddress(List<Account> accList){
        List<Account> updatedList=new List<Account>();
        for(Account acc:accList){
            if(acc.addressCopy__c==true){
                System.debug('acc---'+acc);
                acc.ShippingCity= acc.BillingCity;
                acc.ShippingCountry=  acc.BillingCountry;
                acc.ShippingPostalCode= acc.BillingPostalCode;
                acc.ShippingState= acc.BillingState;
                acc.ShippingStreet= acc.BillingStreet;
                System.debug('acc---'+acc.ShippingStreet);  
            }
        }
    }
    
    public static void opportunityCreatedDate(List<Account> accList, Map<Id,Account> accOldMap){
        Set<Id> accSet=new Set<Id>();
        for(Account acc: accList){
            if(acc.Id != null || acc.Id != accOldMap.get(acc.Id).Id){
                accSet.add(acc.Id);
                System.debug('accId---'+acc.Id);
            }
        }
        List<Opportunity> oppList=new List<Opportunity>();
        for(Opportunity opp:[SELECT Id, StageName, AccountId From Opportunity WHERE AccountId In:accSet AND CreatedDate >= LAST_N_DAYS:30 Order BY CreatedDate]){
            System.debug('opp---'+opp);
            if(opp.StageName != 'Closed Won'){
                opp.StageName = 'Closed Lost';
                oppList.add(opp);
                System.debug('oppList---'+oppList);
            }
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }
    
    public static void clientContactLookup(List<Account> accList,MAp<Id,account> accMap){
        List<Contact> conList=new List<Contact>();
        List<Account> accList2=new List<Account>();
        for(Account acc:accList){
            if(acc.Id != null){
                Contact con=new Contact();
                con.LastName=acc.Name ;
                con.AccountId=acc.Id;
                // con.Id=acc.ClientContact__c;
                conList.add(con);
                
                
                
            }
        }
        
		list<account> accListUpdate=new list<account>();        
        Map<ID,account> mapVAriable = new MAP<id,account>(); 
        List<Account> accLis =[Select Id,Website from Account where Id in:accMap.keyset()];
        if(accLis.size()>0){
            for(Account acc:accLis){
                mapVariable.put(acc.Id,acc);
            }
        }
    //    if(conList.size()>0){
           
            for(Contact cObj:conList){
                if(mapVariable.containsKey(cObj.AccountId)){
                    Account aObj=mapVariable.get(cObj.AccountId);
                    aObj.Website=cObj.Id;
                    accListUpdate.add(aObj);
                }
                update accListUpdate;
            }
    //    }
        //Update the Account in which chnages has been done
        if(accListUpdate.size()>0){
            update accListUpdate;
        }
        if(!conList.isEmpty()){
            insert conList;
            //   update accList;
        }
    }
    
    public static void relatedContact(List<Account> accList){
        List<Contact> conList=new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName = acc.Name;
            con.AccountId =acc.Id;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    
    public static void checkBoxRelatedObjectInsert(List<account> accList){
        List<Contact> conList=new List<Contact>();
        List<Opportunity> oppList=new List<Opportunity>();
        
        For(Account acc: accList){
            if(acc.Contact__c == true){
                Contact con=new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                conList.add(con);
            }
            if(acc.Opportunity__c == true){
                Opportunity opp=new Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'Closed Won';
                opp.CloseDate = System.today();
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
        }
        if(!conList.isEmpty()){
            Insert conList;
        }
        if(!oppList.isEmpty()){
            Insert oppList;
        }
    }
    
    public static void checkBoxCopyBillingToShipping(List<Account> accList){
        
        for(Account acc:accList){
            if(acc.CopyBillingToShipping__c == true){
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry= acc.BillingCountry;
                acc.ShippingPostalCode= acc.BillingPostalCode;
                acc.ShippingState= acc.BillingState;
                    
            }
        }
    }
    
    public static void checkBoxCopyBillingToShipping(List<Account> accList, Map<Id,Account> accOldMap){
        
        for(Account acc:accList){
            if(acc.CopyBillingToShipping__c != accOldMap.get(acc.Id).CopyBillingToShipping__c
              && acc.CopyBillingToShipping__c == true){
                    acc.ShippingStreet = acc.BillingStreet;
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingCountry= acc.BillingCountry;
                    acc.ShippingPostalCode= acc.BillingPostalCode;
                    acc.ShippingState= acc.BillingState; 
                }
        }
    }
    
    public static void updateAccountBillingToContact(List<Account> accList, Map<Id,Account> accOldMap){
        Map<Id,Account> accMap=new Map<Id,Account>();
        List<Contact> conList=new List<Contact>();
        
        for(Account acc:accList){
            if(acc.BillingCity != accOldMap.get(acc.Id).BillingCity
              || acc.BillingCountry != accOldMap.get(acc.Id).BillingCountry
              || acc.BillingPostalCode != accOldMap.get(acc.Id).BillingPostalCode
              || acc.BillingState != accOldMap.get(acc.Id).BillingState
              || acc.BillingStreet != accOldMap.get(acc.Id).BillingStreet){
                accMap.put(acc.Id,acc);
                  System.debug('accMap---'+accMap);
            }
        }
        
        for(Contact con:[SELECT Id, AccountId FROM Contact WHERE AccountId In: accMap.keySet()]){
            if(accMap.containsKey(con.AccountId)){
                System.debug('con---'+con);
                con.MailingCity=accMap.get(con.AccountId).BillingCity;
                con.MailingCountry=accMap.get(con.AccountId).BillingCountry;
                con.MailingPostalCode=accMap.get(con.AccountId).BillingPostalCode;
                con.MailingState=accMap.get(con.AccountId).BillingState;
                con.MailingStreet=accMap.get(con.AccountId).BillingStreet;
                conList.add(con);
                System.debug('conList---'+conList);
            }
        }
        if(!conList.isEmpty()){
            UPDATE conList;
        }
    }
    
    public static void updateStageWhenAccountActiveUpdate(List<Account> accList, Map<Id,Account> accOldMap){
        Map<Id,Account> accMap=new Map<Id,Account>();
        for(Account acc:accList){
            if(acc.Active__c != accOldMap.get(acc.Id).Active__c){
                accMap.put(acc.Id,Acc);
            }
        }
        List<Opportunity> oppList=new List<Opportunity>();
        for(Opportunity opp:[SELECT Id,AccountId,StageName FROM Opportunity WHERE StageName != 'Closed Won' AND AccountId In:accMap.keySet()]){
            if(accMap.containsKey(opp.AccountId)){
                opp.StageName='Closed Lost';
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            Update oppList;
        }
    }
    
    public static void createContact(List<Account> accList){
        for(Account acc:accList){
            contact con=new Contact();
            con.LastName = acc.Name;
        }
    }
}