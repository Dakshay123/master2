public class accValidate {
    @auraEnabled
    public static List<COntact> createAcc(String name, String email, String phone){
        List<Contact> conList=new List<Contact>();
        Contact con=new Contact();
        con.LastName= name;
        con.Email= email;
        con.Phone= phone;
        
        insert con;
        
        conList.add(con);
        
        system.debug('con---'+conList);
        
        return conList;
    }
}