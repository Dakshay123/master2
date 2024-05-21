public class AccBillToCon implements database.Batchable<sObject>, database.stateful{

    public Integer countRecord=0;
    public database.QueryLocator start (database.BatchableContext bc){
        return database.getQueryLocator([SELECT Id, BillingStreet,BillingCity,BillingCountry, BillingPostalCode,BillingState,
                                         (SELECT Id, MailingStreet,MailingCity,MailingCountry, MailingPostalCode,MailingState FROM Contacts)
                                        FROM Account]);
    }
    public void execute(database.BatchableContext bc, List<Account> accList){
        List<Contact> conList=new List<Contact>();
        for(Account acc: accList){
            for(Contact con:acc.Contacts){
                con.MailingState=acc.BillingState;
                con.MailingCity=acc.BillingCity;
                con.MailingCountry=acc.BillingCountry;
                con.MailingPostalCode=acc.BillingPostalCode;
                con.MailingStreet=acc.BillingStreet;
                conList.add(con);
            }
        }
            update conList;
            countRecord=countRecord+conList.size();
        }
        public void finish(database.BatchableContext bc){
            system.debug('records---'+countRecord);
        }
}