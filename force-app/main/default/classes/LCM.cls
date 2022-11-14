public class LCM {
public  static Integer findLCM(Integer a, Integer b){
        Integer lcm;
        for(Integer i=a; i<=a*b; i=i+a){
            if(Math.mod(i,a)==0 && Math.mod(i,b)==0){
                lcm = i;
                break;

            }
        }
    System.debug('lcm of two numbers is '+lcm);
        return lcm;
    }
}