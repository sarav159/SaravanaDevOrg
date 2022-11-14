public class CollectionsDemo {
    public  static void methodCollections(){
        Map<Integer, String> studentMap = new Map<Integer, String>();
        
        studentMap.put(1, 'ClassX');
        studentMap.put(2, 'ClassX');
        studentMap.put(3, 'ClassX');
        studentMap.put(44, 'ClassX');
        studentMap.put(43, 'ClassX');
        studentMap.put(49, 'ClassY');
        studentMap.put(88, 'ClassY');
        studentMap.put(93, 'ClassX');
        studentMap.put(98, 'ClassY');
        
        system.debug('studentMap=='+studentMap);
        
        
        system.debug('studentMap=='+studentMap.keySet());
        
        
        system.debug('studentMap=='+studentMap.values());        
        
      
        
        for(Integer rollnumber : studentMap.keySet()){
            
            if(math.mod(rollnumber,2)==0){
                studentMap.put(rollnumber,'ClassY');
            }
            else if(math.mod(rollnumber,2)!=0){
                studentMap.put(rollnumber,'ClassX');
            }
            
        }
        system.debug('All even to Class Y, Odd to Class X==='+ studentMap);
        
        
    }
}