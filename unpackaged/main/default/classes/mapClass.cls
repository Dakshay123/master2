public class mapClass {

    public static void method1(){
        Map<Id,Account> newMap=new Map<Id,Account    >([SELECT Id, Name from Account LIMIT 4]);
      //  List<Account> newList=new List<Account>();
        
       // for(Account acc: newList){
           // newMap.put(acc.Id,acc);
      //  }
        System.debug('map is here : '+ newMap);
    }
    
    public static void method2(){
      /*  set<Account> newSet=new set<Account>([SELECT Id from Account]);
        List<Contact> newCon=new List<Contact>([SELECT Id, (SELECT Id,Email from Contact) from Account]);
        
        map<Account , list<Contact>> accToCon=new Map<Account,List<Contact>>();
        for(Account acc: newCon){
            accToCon.put(acc.Id);
        }
        System.debug(accToCon);*/
        
        
        Map<Id, List<Contact>> maponobject = new Map<Id, List<Contact>>();
        
        List<Contact> conList=new List<Contact>([SELECT Id,Email, AccountId from contact where AccountId != null LIMIT 4]);
        
        for(Contact con:conList){
            if(!maponobject.containsKey(con.AccountId)){
                maponobject.put(con.AccountId, new List<Contact>{con});
            }
        }
        System.debug('account with Contact is : '+maponobject);
    }
}