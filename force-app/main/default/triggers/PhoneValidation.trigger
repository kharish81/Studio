trigger PhoneValidation on Account (before insert) {
	
    if( trigger.isBefore && trigger.isInsert){
        if(!trigger.new.isEmpty()){
            system.debug(trigger.new);
            for(Account acc:trigger.new){
                if(acc.Phone == null || acc.Phone == ''){
					acc.addError('enter the correct phone number');
                }
            }
        }
    }
}