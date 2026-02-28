trigger CountOfStudents on Student__c (before insert) {
    //Integer count =0;
    list<Student__c> record;
    lIst<Branch__c> branch;
    
    map<id,integer> branchCount = new map<id,integer>();
    if(trigger.isBefore && trigger.isInsert){
        for(Student__c st : [select Branch__c from Student__c where id IN :Trigger.new] ){
            if(branchCount.containsKey(st.Branch__c)){
				integer countt = branchCount.get(st.Branch__c);
                countt = countt+1 ;
                branchCount.put(st.Branch__c,countt);
            }else{
                branchCount.put(st.Branch__c,1);
            }
            
        }
        
      for(list<Branch__c> br : [select id,No_of_Students__c from Branch__c where id IN :branchCount.keySet()] ){

        
		        
      } 
        
        
        
        
        
        /*
        for(Branch__c br:branch){
        for(Student__c std:record){
           if(std.Branch__c==br.Name){
                 count++;
            }
        }
		Branch__c b1=new Branch__c(No_of_Students__c=count);   
            insert b1;
        }   
*/
        
    }
}