public class leadTriggerHandler {
    
    private static boolean run = true;
    public static boolean runOnce(){
        if(run){
            run=false;
            return true;
        }else{
            return run;
        }
    }
    public static void insertDuplicateRecord(List<Lead> ldList){
        
        List<Lead> ldList2=new List<Lead>(ldList.deepClone());
        insert ldList2;
    }
}