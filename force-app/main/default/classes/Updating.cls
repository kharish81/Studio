public class Updating {
    
    public static void updatingList(){
    String bId = [Select id,Name from Branch__c where Name='cse' Limit 1].id;
    list<Student__c> s = [Select Branch__c from Student__c];
    list<Student__c> s2= new list<Student__c>();
        for(Student__c s1: s){
            s1.Branch__c=bId;
            s2.add(s1);
        }
        update s2;
    }
    

}