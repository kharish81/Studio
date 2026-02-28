public class Demo {
    public static void insertCount(){

    Integer count =0;
    list<Student__c> record;
    lIst<Branch__c> branch;
    if(trigger.isBefore && trigger.isInsert){
        record=[select Branch__c from Student__c];
        branch=[select Name from Branch__c];
        for(Branch__c br:branch){
        for(Student__c std:record){
           if(std.Branch__c==br.Name){
                 count++;
            }
        }
		Branch__c b1=new Branch__c(No_of_Students__c=count);   
            insert b1;
            System.debug(b1);
        }   
    }
    }
}