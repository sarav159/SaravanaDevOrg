trigger ContactTriggerAPI on Contact (after insert){
    System.debug('This trigger is working');
    new ContactTriggerHandler().run();
   
}