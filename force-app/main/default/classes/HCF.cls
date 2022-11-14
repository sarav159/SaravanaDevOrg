public class HCF {
public Integer findHCF(Integer a, Integer b){
        while(a!=b)
        {
        if(a>b)
        a=a-b;
        else
        b=b-a;
        }
        return a;

    }
}