public with sharing class MapClass {
    public static void MapClass() {
        Map<Integer, List<String>> studentMap = new Map<Integer, List<String>>();
        
        studentMap.put(1, new List<String>{'ClassX','ClassY'});
        studentMap.put(2, new List<String>{'ClassX','ClassY'});
        studentMap.put(3, new List<String>{'ClassX','ClassY'});
        studentMap.put(44, new List<String>{'ClassX','ClassY'});
        studentMap.put(43, new List<String>{'ClassX','ClassY'});
        studentMap.put(49, new List<String>{'ClassX','ClassY'});
        studentMap.put(88,new List<String>{'ClassX','ClassY'});
        studentMap.put(93, new List<String>{'ClassX','ClassY'});
        studentMap.put(98, new List<String>{'ClassX','ClassY'});
        
        system.debug('studentMap=='+studentMap);
        
        
        system.debug('studentMap=='+studentMap.keySet());
        
        
        system.debug('studentMap=='+studentMap.values());        
        
               
        for(Integer rollnumber : studentMap.keySet()){
            
            if(math.mod(rollnumber,2)==0){
                studentMap.put(rollnumber, new List<String>{'ClassY','ClassX','ClassZ'});
            }
            else if(math.mod(rollnumber,2)!=0){
                 studentMap.put(rollnumber, new List<String>{'ClassX','ClassA','ClassB'});
            }
                  
        }
        system.debug('All even to Class X & Z, Odd to Class A & B==='+ studentMap);
        
    }
}