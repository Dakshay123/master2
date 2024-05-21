public class test1 {
    public static void method1(){
        List<String> ls=new List<String>();
        ls.add('dakshay');
        ls.add('kumar');
        /*    System.debug('list is'+ls);*/
        
        for(String s:ls){
            System.debug('list is '+s);
        }
        
        List<Integer> ls2=new List<Integer>();
        ls2.add(1);
        ls2.add(2);
        ls2.add(3);
        for(Integer i=0; i< ls2.size();i++){
            
            System.debug('list is '+ls2[i]);
            // break;
        }
        
        set<Integer> st=new set<Integer>();{
            st.add(1);
            st.add(1);
            st.add(2);
            st.add(2);
            st.add(3);
            st.add(4);
            st.add(4);
            
            for(Integer i:st){
                System.debug('set is here '+ i);
            }
        }
        
        Map<Integer,String> newMap=new Map<Integer,String>();
        newMap.put(1, 'Dakshay');
        newMap.put(2, 'kumar');
        newMap.put(3, 'jatin');
        newMap.put(4, 'navneet');
        for(String i:newMap.values()){
            System.debug('map is here '+ i);
        }
        
      set<AggregateResult> newSet=new set<AggregateResult>([SELECT Issue_Date__c, Count(Name) ct from Account GROUP By Issue_Date__c]);
        
        for(AggregateResult i:newSet){
            
            System.debug('1 Account Id is '+ i.get('ct'));
            
        }
        
        
        
      /*  for(Account acc:[SELECT Id,Name from Account LIMIT 3]){
            newSet.add(acc);
            System.debug('2 Account Id is '+ acc.Name);
        }*/
        
    }
}