public class smsBoxLwc {
	@AuraEnabled
    public static String sendSMS(String phoneNumber, String sms, String recordId){
        system.debug('phoneNumber---'+phoneNumber);
        system.debug('sms---'+sms);
       	system.debug('id---'+recordId);
        String num='';
        List<Contact> con=[SELECT LastName,Phone FROM COntact WHERE Id =: recordId];
        SYstem.debug('con--'+con);
        num=con[0].Phone;
        
        return num;
    }
}