@isTest
public class TemperatureTest {
@isTest
    private static void tempTest(){
        decimal res = Temperature.temperatureToCelcius(70);
       System.assertequals(21.11,res); 
    }
}