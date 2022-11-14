@IsTest
private class SetOperationsUtilityTest {
    @IsTest
    static void testUnion() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getUnion(firstSet, secondSet);
        System.assertEquals(true, result.contains(1));
        System.assertEquals(false, result.contains(1000));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testIntersection() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getIntersection(firstSet, secondSet);
       System.assertEquals(true,result.contains(1));
       System.assertEquals(false,result.contains(10));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testgetValuesInFirstButNotInSecond() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getValuesInFirstButNotInSecond(firstSet, secondSet);
        System.assertEquals(true, result.contains(14));
        System.assertEquals(false, result.contains(147));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetValuesInSecondButNotInFirst() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getValuesInSecondButNotInFirst(firstSet, secondSet);
        System.assertEquals(true, result.contains(147));
        System.assertEquals(false, result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllOddValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getAllOddValues(firstSet, secondSet);
        System.assertEquals(true, result.contains(1));
        System.assertEquals(false, result.contains(178));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllEvenValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getAllEvenValues(firstSet, secondSet);
        System.assertEquals(true, result.contains(14));
        System.assertEquals(false, result.contains(105));
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testGetSumOfAllMultiplesOfThreeValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Integer Val = SetOperationsUtility.getSumOfAllMultiplesOfThreeValues(firstSet, secondSet);
       System.assertEquals( Val,393);
       //System.assertEquals( Val,2100);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
    @IsTest
    static void testGetSumOfAllEvenValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Integer Val = SetOperationsUtility.getSumOfAllEvenValues(firstSet, secondSet);
        System.assertEquals( Val,214);
        //System.assertEquals(Val,1000);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
    @IsTest
    static void testGetSumOfAllOddValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Integer Val = SetOperationsUtility.getSumOfAllOddValues(firstSet, secondSet);
       System.assertEquals( Val,400);
        //System.assertEquals( Val,1000);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
}