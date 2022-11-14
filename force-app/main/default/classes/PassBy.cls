public class PassBy {
    public static void multiplyByPi(Double radius){
        Double area;
        Double pi = 3.14;
        area = 3.14*radius*radius;
        System.debug('Area of curcle is '+area);
    }
    Public static void getFirstTwoChar(String Name){
        System.debug('My name is '+Name);
        
        System.debug('My name is '+Name.substring(0,2)); 
    }
    Public static void stringSet(Set<String>Sports){
        //Set<String> sport = new Set<String>();
        sports.add('badminton');
        System.debug('The required set is '+ sports);
    }
}