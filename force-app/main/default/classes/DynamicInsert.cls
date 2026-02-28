public class DynamicInsert {

    public static void insertRec(String name,String phone){
		Account acc = new Account(
        	Name=name,
            Phone=phone
        );
        insert acc;
    }
}