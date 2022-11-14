@IsTest
public class PersonHandlerTest {
    @IsTest
    private static void testAddPerson(){
        PersonHandler pers =  new PersonHandler();
        person p1 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p2 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p3 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p4 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p5 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p6 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p7 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p8 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p9 = new person('saravana','ts','kanyakumari','tanilnadu');
        person p10 = new person('saravana','ts','kanyakumari','tanilnadu');
        
        pers.add(P1);
        pers.add(P2);
        pers.add(P3);
        pers.add(P4);
        pers.add(P5);
        pers.add(P6);
        pers.add(P7);
        pers.add(P8);
        pers.add(P9);
        pers.add(P10);
      System.debug('before'+pers);  
        String JSONString = JSON.serialize(pers);
         System.debug('after'+JSONString); 
        List<person>  result = pers.personList;
        System.assertEquals(10, result.size());
    }
    
}