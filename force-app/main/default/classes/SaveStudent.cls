public with sharing class SaveStudent{
    
	@AuraEnabled
    public static string saveStudentDetails(string name,string id,string hod){
        try{
        Branch__c branch = new Branch__c();
            branch.Name = name;
        	branch.B_id__c = id;
        	branch.Hod__c = hod;
            
            insert branch;
            system.debug(branch.Id);
            return 'success: record id - '+ branch.Id;
            
        }
        catch(Exception e){
            throw new AuraHandledException('Failed: '+ e.getMessage());
        }
        
    }
}