public class seachBoxLwc {

    @AuraEnabled
    public static List<account> getData(String accName){
        accName ='%' + accName + '%';
        List<Account> listAcc= [SELECT Id, Name, Industry, Phone, Type, (SELECT FirstName, LastName FROM contacts) From Account WHERE Name Like : accName];
        
        if(listAcc.isEmpty()){
            throw new AuraHandledException('No Record Found');
            
        }
        return listAcc;
    }
}