public class ContactTriggerHandler {
    public static void accountActive(List<Contact> con){
	    List<Id> conId = new List<Id>(); 
        for(Contact c:con){
            if(c.AccountId!=null){
				conId.add(c.AccountId);
       		}
        }
        List<Account> acc = new List<Account>();
        for(Account a:[select Id,Active__c from Account where Id IN :conId]){
            a.Active__c='Yes';
            acc.add(a);
        }
        update acc;
    }

}