public class updateParentRecord Implements Queueable{

   private id accParentId;
    private List<Account> accList;
    
    public updateParentRecord(List<Account> accRecords, id accId){
        this.accParentId=accId;
        this.accList=accRecords;
    }
    public void execute(QueueableContext Context){
        for(Account acc: accList){
            acc.ParentId=accParentId;
        }
        
        update accList;
    }
}