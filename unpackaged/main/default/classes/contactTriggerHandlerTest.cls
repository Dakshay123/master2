@isTest
public class contactTriggerHandlerTest {

    @isTest
    static void emailSendTempleteTest(){
        List<Contact> conList=new List<Contact>();
        for(integer i=1;i<=10;i++){
            Contact con=new Contact();
            con.LastName='Daksh'+i;
            con.Email='Dakshukumar28@gmail.com';
            conList.add(con);
        }
        Test.startTest();
        insert conList;
        Test.stopTest();
    }
    
    @isTest
    Static void duplicateRecordTest(){
        List<Contact> conList=new List<Contact>();
        for(integer i=1;i<=10;i++){
            Contact con=new Contact();
            con.LastName='Daksh'+i;
            con.Email='Dakshukumar28@gmail.com';
            con.Phone='1234567890';
            conList.add(con);
        }
        Test.startTest();
        insert conList;
        Test.stopTest();  
    }
}