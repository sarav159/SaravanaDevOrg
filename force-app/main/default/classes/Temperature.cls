public class Temperature {
    public static Decimal temperatureToCelcius(Decimal fh){
         Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}