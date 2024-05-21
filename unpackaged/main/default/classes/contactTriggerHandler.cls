public class contactTriggerHandler {
    
    public static void emailSendTemplete(List<Contact> conList){
        
        List<Messaging.SingleEmailMessage> emailList=new List<Messaging.SingleEmailMessage>();
        
      	emailTemplate emailTemp=[SELECT Id,Subject,Body FROM emailTemplate WHERE developerName='contactEmail'];
        
        for(Contact con:conList){
            Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
            
            if(con.Email != null && con.FirstName!= null){
                Mail.setTargetObjectId(con.Id);
                Mail.setTemplateId(emailTemp.Id);
                
                List<String> sendTo=new List<String>();
                sendTo.add(con.Email);
                mail.setToAddresses(sendTo);
                emailList.add(mail);
            }
        }
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
    }
    
    public static void duplicateRecord(List<Contact> conList){
        Set<String> emailSet=new Set<String>();
        Set<String> phoneSet=new Set<String>();
        
        for(Contact con:conList){
            if(con.Email != null){
                System.debug('Email---'+con.Email);
               emailSet.add(con.Email); 
            }
            if(con.Phone != null){
                System.debug('Phone---'+con.Phone);
                phoneSet.add(con.Phone);
            }
        }
        Map<String,String> newMap=new Map<String,String>();
        List<Contact> deleteList=new List<Contact>();
        List<Contact> updatedList=new List<Contact>();
        
        for(Contact con2:[SELECT Id,Email,Phone FROM Contact WHERE Email In:emailSet AND Phone In: phoneSet order by createddate]){
            System.debug('Contact ---'+con2);
            if(newMap.containsKey(con2.Email+con2.Phone)){
                System.debug('delete List: '+con2);
                deleteList.add(con2);
            }
            else{
                newMap.put(con2.Email+con2.Phone,'test');
                System.debug('update List: '+con2);
                updatedList.add(con2);
            }
        }
        if(!deleteList.isEmpty()){
            delete deleteList;
        }
        if(!updatedList.isEmpty()){
            update updatedList;
        }
    }

 /*   public static void deleteContact(List<Contact> conList){
        
        for(Contact con:conList){
            List<Contact> conList2=[SELECT Id FROM Contact WHERE Id =:con.id];
            if(conList.Size()>5){
                con.addError('Cant delete');
            }
        }
    }*/
}