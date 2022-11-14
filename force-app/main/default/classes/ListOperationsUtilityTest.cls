@IsTest
private class ListOperationsUtilityTest {
    @IsTest
    static void testUnion() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
        firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getUnion(firstList, secondList);
        System.assertEquals(true, result.contains(1));
        System.assertEquals(false, result.contains(1000));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testIntersection() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getIntersection(firstList, secondList);
       System.assertEquals(true,result.contains(1));
       System.assertEquals(false,result.contains(10));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testgetValuesInFirstButNotInSecond() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getValuesInFirstButNotInSecond(firstList, secondList);
        System.assertEquals(true, result.contains(14));
        System.assertEquals(false, result.contains(147));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetValuesInSecondButNotInFirst() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getValuesInSecondButNotInFirst(firstList, secondList);
        System.assertEquals(true, result.contains(147));
        System.assertEquals(false, result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllOddValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getAllOddValues(firstList, secondList);
        System.assertEquals(true, result.contains(1));
        System.assertEquals(false, result.contains(178));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllEvenValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getAllEvenValues(firstList, secondList);
        System.assertEquals(true, result.contains(14));
        System.assertEquals(false, result.contains(105));
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testGetSumOfAllMultiplesOfThreeValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllMultiplesOfThreeValues(firstList, secondList);
       System.assertEquals( Val,393);
       //System.assertEquals( Val,2100);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
    @IsTest
    static void testGetSumOfAllEvenValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllEvenValues(firstList, secondList);
        System.assertEquals( Val,214);
        //System.assertEquals(Val,1000);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
    @IsTest
    static void testGetSumOfAllOddValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllOddValues(firstList, secondList);
       System.assertEquals( Val,400);
        //System.assertEquals( Val,1000);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
}