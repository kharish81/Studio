public class ContactBatch implements Database.Batchable<Sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('select Id,AccountId from Contact where AccountId != null ');
    }
    
    public void execute(Database.BatchableContext bc,List<Contact> con){
        set<Id> accid = new set<Id>();
        for(Contact c: con){
           accid.add(c.AccountId); 
        }
        List<Account> updateAcc = new List<Account>();
        for(Account acc: [select Id,Active__c from Account where Id IN:accid]){
            acc.Active__c='No';
            updateAcc.add(acc);
        }
        
		update updateAcc;
    }
    
    public void finish(Database.BatchableContext bc){
		system.debug('account updated');
    }
}