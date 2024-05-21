public class contactInsertWrapper {
    
    public ContactWrapper conWrap{get;set;}
    Contact con=new Contact();
    public contactInsertWrapper(){
        conWrap=new ContactWrapper();
        ContactWrapper conWrapObj=new ContactWrapper();
        con.FirstName=  conWrapObj.conFirst; 
        con.LastName=  conWrapObj.conLast; 
        // conWrap.add(con)
    }
    public Contact save(){
        insert con;
        return Con;
    }
    
    public class ContactWrapper{
        public String conFirst{get;set;}
        public String conLast{get;set;}
        public ContactWrapper(){
            this.conFirst='';
            this.conLast='';
        }
    }
}