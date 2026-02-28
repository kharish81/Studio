public class AccInsert10rec {
    
    Public static void Acccreation(){
        List<Account> accList=new List<Account>();
        for(Integer i=0; i<10; i++){
            Account acc=new Account();
            acc.Name='Test Account';
            
            accList.add(acc);
        }
insert accList;
    }
    
}