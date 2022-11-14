@isTest
private class LeadProcessorTest {
    @isTest
    static void testLead(){
        List<Lead> leadlist = new  List<Lead>();
        for(integer i = 0; i<200;i++){
            Lead le = new Lead();
            le.LastName = 'TestLead' + i;
            le.Company = 'TCS';
            leadlist.add(le);
        }
        insert leadlist;
        
        Test.startTest();
        LeadProcessor lee = new LeadProcessor();
        Database.executeBatch(lee);
        Test.stopTest();
        
        List<Lead> leads =[SELECT Id, Name From Lead WHERE LeadSource = 'DreamForce'];
        System.assertEquals(200, leads.size());
    }
    
    
}