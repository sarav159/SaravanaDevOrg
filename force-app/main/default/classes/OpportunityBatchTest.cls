@isTest
private class OpportunityBatchTest {
    @isTest
    static void testOpp(){
        List<Opportunity> opplist = new  List<Opportunity>();
        for(integer i = 0; i<200;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opplist.add(opp);
        }
        insert opplist;
        
        Test.startTest();
        OpportunityBatch opp = new OpportunityBatch();
        Database.executeBatch(opp);
        Test.stopTest();
        
        List<Opportunity> opps =[SELECT Id, Name From Opportunity WHERE LeadSource = 'web'];
        System.assertEquals(200, opps.size());
    }
    
    
}