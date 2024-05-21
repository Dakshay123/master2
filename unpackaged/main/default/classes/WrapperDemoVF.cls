public class WrapperDemoVF {
    
    public bigWrapper bigObj{get;set;}
    
    public WrapperDemoVF(){
        bigObj=new bigWrapper();
        
        List<AccountWrapper> accList=new List<AccountWrapper>();
        List<contactWrapper> conList=new List<contactWrapper>();
        
        for(Account acc:[SELECT Id,Name,Type FROM Account]){
            AccountWrapper accObj=new AccountWrapper();
            accObj.accName=acc.Name;
            accObj.accType=acc.Type;
            conList = new List<contactWrapper>();
            for(Contact con:[SELECT Id, FirstName, LastName FROM Contact where accountID =: acc.Id]){
                contactWrapper conObj=new contactWrapper();
                conObj.conFirst=con.FirstName;
                conObj.conLast=con.LastName;
                conList.add(conObj);
            }
            accObj.conListObj=conList;
            accList.add(accObj);

            bigWrapper big=new bigWrapper();
            big.accListObj=accList;
            bigObj=big;
        }        
    }
    
    public class bigWrapper{
        public List<AccountWrapper> accListObj{get;set;}
    }
    
    public class AccountWrapper{
        public String accName{get;set;}
        public String accType{get;set;}
        public List<contactWrapper> conListObj{get;set;}
    }
    
    public class contactWrapper{
        public String conFirst{get;set;}
        public String conLast{get;set;}
    }
}