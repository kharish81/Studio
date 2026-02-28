trigger ContactTrigger on Contact (before insert,after insert) {
    //one
    if(Trigger.isInsert && Trigger.isAfter){
		ContactTriggerHandler.accountActive(Trigger.new);
	}
    
    //two  
    if(Trigger.isAfter && Trigger.isUpdate){
		/*Map<Id,Id> oldCon = new Map<Id,Id>();
		for(Contact con:Trigger.old){
		 oldCon.put(con.Id,con.AccountId);
		}
		
		Set<Id> accId = new Set<Id>();
		for(Contact newCon:Trigger.new){
		 if(newCon.AccountId!=oldCon.get(newCon.Id)){
		   accId.add(newCon.AccountId);
		 }
		}*/

		Set<Id> accId = new Set<Id>();
		for(Contact newCon:Trigger.new){
		  Id oldCon = Trigger.oldMap.get(newCon.Id).AccountId;
		  if(newCon.AccountId!= null && newCon.AccountId!=oldCon){
			accId.add(newCon.AccountId);
		  }
		}
	
		if(!accId.isEmpty()){
		 List<Account> accToUpdate = new List<Account>();
		 for(Account acc:[select Id,Active__c from Account where Id IN:accId]){
		  acc.Active__c = 'Yes';
		  accToUpdate.add(acc);
		}

		if(!accToUpdate.isEmpty()){
		 Update accToUpdate;
		}
      }	 
	}
    
    //three
    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accIds = new Set<Id>();
          for(Contact con:Trigger.new){
            String oldPhone= Trigger.oldMap.get(con.Id).Phone;
            if(con.Phone!=oldPhone && con.AccountId != null){
              accIds.add(con.AccountId);
            }
          }
        
         //custom field error
         /* if(!accIds.isEmpty()){
              List<Account> accToUpdate = new List<Account>();
              for(Account acc:[select Id,Last_Contact_Updated__c from Account where Id IN:accIds]){
                acc.Last_Contact_Updated__c=System.now();
                accToUpdate.add(acc);
              }
            
              if(!accToUpdate.isEmpty()){
                update accToUpdate;
              }
	 	  }*/
    }
    
   //update count in related account field
	if(Trigger.isAfter){
	 
	 Set<Id> effectedContacts = new Set<Id>();

	 if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
		for(Contact con:Trigger.new){
		  if(con.AccountId!=null){
			effectedContacts.add(con.AccountId);
		  }
		}
	 }
        
     if(Trigger.isUpdate || Trigger.isDelete){
		for(Contact con:Trigger.old){
		  if(con.AccountId!=null){
			effectedContacts.add(con.AccountId);
		  }
		}
	 }

	

	 Map<Id,Integer> accMap = new Map<Id,Integer>();
        for(AggregateResult res:[select AccountId accId,Count(Id) cnt from Contact where AccountId IN:effectedContacts Group by AccountId]){
		accMap.put((Id) res.get('accId'),(Integer) res.get('cnt'));
	 }

	/*List<Account> accToUpdate = [select Id,TotalContacts__c from Account where Id IN:effectedContacts];
	for(Account acc : accToUpdate){
		acc.TotalContacts__c=accMap.containsKey(acc.Id)?accMap.get(acc.Id):0;
	}
	
	update accToUpdate;*/
	}


 
}