public class DriverObjectClass {
        public static void driverMethod(List<Driver__c> DriverNew){
    
     for(Driver__c d : DriverNew)
        {
            if(d.Age__c != NULL) {
                
                if(d.Age__c == '18 - 25') {
                d.Discont__c= 0;
            }
             else if(d.Age__c == '25 - 36') {
                d.Discont__c= 10;
            }
            else if(d.Age__c == '36 - 45') {
                d.Discont__c= 20;
               
            }
           else if(d.Age__c == 'above 45') {
                d.Discont__c= 30;
            }
        }
        
    
}
}
}