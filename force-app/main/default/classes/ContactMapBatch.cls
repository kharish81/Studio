public class ContactMapBatch implements Database.Batchable<Sobject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('select Id,AccountId from Contact where AccountId != null');
    }
    
    public void execute(Database.BatchableContext bc,List<Contact> con){
        Map<Id,Contact> cont = new Map<Id,Contact>();
        for(Contact c:con){
            cont.put(c.AccountId,c);
        }
        List<Account> a = new List<Account>();
        for(Account acc:[select Id,Active__c from Account where Id IN:cont.keySet()]){
            acc.Active__c='No';
            a.add(acc);
        }
        update a;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
	
}