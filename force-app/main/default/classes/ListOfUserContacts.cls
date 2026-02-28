public class ListOfUserContacts {
    
    public static void get(){
        
        Map<Id, List<Contact>> contactsByOwner = new Map<Id, List<Contact>>();

        for (Contact c : [SELECT Id, FirstName, LastName, OwnerId FROM Contact]) {
            if (!contactsByOwner.containsKey(c.OwnerId)) {
                contactsByOwner.put(c.OwnerId, new List<Contact>());
            }
       	  contactsByOwner.get(c.OwnerId).add(c);
     	} 
        
    }
}