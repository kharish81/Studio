public class DeleteBranch {
    
    public static void deleteDuplicate(){
        list<Branch__c> branch = new list<Branch__c>();
        branch = [select Name from Branch__c where Name='jbsbvu'];
        delete branch;
    }
}