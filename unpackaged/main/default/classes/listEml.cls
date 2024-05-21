public class listEml {

    public static void listString(){
        
        //creating String type of List
        
        List<String> newList=new List<String>();
        
        newList.add('red');
        newList.add('Green');
        newList.add('Black');
        newList.add('Blue');
        newList.add('yellow');
        
        System.debug('newList is : '+ newList);
        
        // add element in particular index of a list
        
        newList.add(1,'pink');
        System.debug('index 1 element added here : '+ newList);
        
        // use addAll to copy 1 list to another list
        
        List<String> newList2=new List<String>();
        newList2.add('purple');
        newList2.add('offWhite');
        
        newList2.addAll(newList);
        System.debug('copy list to another list : '+ newList2);
        
        //clone of list2 to list3
        
        List<String> newList3=new List<String>();
        newList3=newList2.clone();
        System.debug('clone of list 2 to list3 : '+ newList3);
        
                                  /*  Method  */
        //use clear keyword
        
        newList3.clear();
        System.debug('clear to list 3 : '+ newList3);
        
        // searching element using Contains keyword
               
        System.debug('searching element : '+ newList2.contains('Blue'));
        
        //fetch element in particular index
        
        System.debug('get index element : '+ newList2.get(4));
        
        //fetch index of element
        
        System.debug('fetch index of element : '+ newList2.indexOf('Blue'));
        
        //check empty of list
        
        System.debug('check list empty or not : '+ newList3.isEmpty());
        
        //same as for check list is equal or not through the EQUALS() keyword, size(), sort();  
    }
}