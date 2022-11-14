
public with sharing class SetOperationsUtility {
    public static Set<Integer> getUnion(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            result.add(val);
        }
        for(Integer val : secondSet) {
            result.add(val);
        }
        return result;
    }
    public static Set<Integer> getIntersection(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        
        for(Integer val1 : firstSet) {
            if(secondSet.contains(val1)){
               result.add(val1);
            }
        }
       
        return result;
    }

    public static Set<Integer> getValuesInFirstButNotInSecond(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val1 : firstSet) {
            if(!secondSet.contains(val1)){
               result.add(val1);
            }
        
    }
        return result;
    }

    public static Set<Integer> getValuesInSecondButNotInFirst(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val1 : secondSet) {
            if(!firstSet.contains(val1)){
               result.add(val1);
            }
        
    }
        return result;
    }
    
    public static Set<Integer> getAllOddValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
       for(Integer val : firstSet) {
           if(math.mod(val,2)!=0){
            result.add(val);
        }
       }
        for(Integer val : secondSet) {
            if(math.mod(val,2)!=0){
            result.add(val);
        }
        }
        return result;
    }
    
    public static Set<Integer> getAllEvenValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
           
        }
        for(Integer val : secondSet) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
            
        }
        return result;
    }

    public static Integer getSumOfAllEvenValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        integer Val=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)==0){
            Val = Val + first;
           }
        }
       for(Integer second : secondSet) {
            if(math.mod(second,2)==0){
                Val = Val + second;
        }
        }
        return Val;
    }
    public static Integer getSumOfAllOddValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        integer Val=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)!=0){
            Val = Val + first;
           }
        }
       for(Integer second : secondSet) {
            if(math.mod(second,2)!=0){
                Val = Val + second;
        }
        }
        return Val;
    }

    public static Integer getSumOfAllMultiplesOfThreeValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        integer Val=0;
        for(Integer first : firstSet) {
           if(math.mod(first,3)==0){
            Val = Val + first;
           }
        }
       for(Integer second : secondSet) {
            if(math.mod(second,3)==0){
                Val = Val + second;
        }
        }
        return Val;
    }



}