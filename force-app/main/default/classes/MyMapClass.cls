public class MyMapClass {
    public static Map<String, String> displayValuesAsNewMap(Map<String, String> numeralsMap, Map<String, String> romanNumeralsMap) {
        Map<String, String> combinedMap = new  Map<String, String> ();
        
        for(String str : numeralsMap.keySet()){
            combinedMap.put(numeralsMap.get(str), romanNumeralsMap.get(str));
            System.debug('The combinedMap is'+combinedMap);
        }
        return combinedMap;
        
    }
    public static Map<Integer, string> reverseTheMap(Map<String, Integer> numeralMap) {
        Map<Integer, String> reverseMap = new  Map<Integer, String> ();
        
        for(String st : numeralMap.keySet()){
            reverseMap.put(numeralMap.get(st),st); 
            //System.debug('The reversed map is'+reverseMap);
        }
         System.debug('The reversed map is'+reverseMap);
        return reverseMap;  
    }
}