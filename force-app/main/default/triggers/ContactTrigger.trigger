trigger ContactTrigger on Contact (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
      ContactTriggerHandler.countContacts( Trigger.new);  
    }
   
   /* if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isDelete){
              
        ContactTriggerHandler.countContacts( Trigger.new,Trigger.old) ;
        }
      
    }*/
    
}