public with Sharing class accountController {
    
    public List<accConWrapper> accConList {get;set;}
    public accountController()
    {
        //newStyle='';
        accConList= new List<accConWrapper>();
        for(Account acc:[SELECT Id, Name, Type, Rating, Phone, Industry FROM Account]){
           accConWrapper wrapperObj = new accConWrapper();
			wrapperObj.accName  = acc;
            List<Contact> conList = [SELECT Id, FirstName, Email FROM Contact WHERE AccountId =: acc.id];
			wrapperObj.conNames= conList;  
            accConList.add(wrapperObj);
        }
        system.debug('ithe '+accConList);
    }
    public void stylechanger(){
        //system.debug('click hua');
      // newStyle='';
	}
    public class accConWrapper{
        public Account accName{get;set;}
        public List<Contact> conNames{get;set;}
        public accConWrapper(){
            this.accName = new Account();
            this.conNames = new List<Contact>();
		}
    }
}