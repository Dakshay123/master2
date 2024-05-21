public class wrapperAccount {
    
    public List<bigWrapper> bigObj{get;set;}
    public wrapperAccount(){
        
        bigObj=new List<bigWrapper>();
        List<accList> accObj = new List<accList>();
      //  List<conList> conObj = new List<conList>();
        for(Account acc:[SELECT Id,Name,Type,Rating,Industry FROM Account]){
            accList acchvv=new accList();
            acchvv.naam = acc.Name;
            acchvv.typ = acc.Type;
            acchvv.indus = acc.Industry;
            acchvv.rat = acc.Rating;
            accObj.add(acchvv);
           List<conList> conl=new List<conList>();

            for(Contact con:[SELECT Id, FirstName FROM Contact WHERE AccountId =: acc.Id]){
                conList cn = new conList();
                cn.conName=con.FirstName;
                conl.add(cn);
            }
            bigWrapper big=new bigWrapper();
            acchvv.innerwrapper2 = conl;
            big.innerwrapper = acchvv;
            bigObj.add(big);
            
        }
        system.debug('bigWrapper-----'+bigObj);
    }
    
    public class bigWrapper{
        public accList innerWrapper{get;set;}
    }
    public Class accList{
        public String naam{get;set;}
        public String typ{get;set;}
        public String indus{get;set;}
        public String rat{get;set;}
        public List<conList> innerWrapper2{get;set;}

        
    }
      public Class conList{
        public String conName{get;set;}
        
    }
}