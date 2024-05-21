public class upsertTest {
    
    public static void method1(){
        List<Account> accList=new List<Account>([SELECT Id,Name From Account WHERE Rating = 'Hot']);
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Industry='Energy';
            }
        }
        for(Integer i=1;i<=2;i++){
            Account acc=new Account();
            acc.Name='Dakshay'+i;
            accList.add(acc);
        }
        upsert accList;
    }
}