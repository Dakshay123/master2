public class practice2Update {
    
    public static void updatePhone(){
        List<Account> accList=new List<Account>([SELECT Id,Phone from Account Where Phone ='1234567890']);
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Phone='0987654321';
            }
        }
        update accList;
    }
    
    public static void updateEmail(){
        List<Contact> conList=new List<Contact>([SELECT Id, Email FROM Contact WHERE Email != null]);
        
        for(Contact con:conList){
            con.Email='test@test.com';
        }
        update conList;
    }
}