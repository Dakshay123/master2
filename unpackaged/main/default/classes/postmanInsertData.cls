@RestResource(urlMapping='/DakshayUrl/*')

Global class postmanInsertData {

    @HttpPost
    Global Static String DataInsert(String name, String Phone, String Email){
        Contact con=new Contact();
        con.LastName=name;
        con.Phone=phone;
        con.Email=email;
        insert con;
        return con.Id;
    }
}