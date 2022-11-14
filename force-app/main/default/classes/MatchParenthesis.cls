public class MatchParenthesis {
    
    
    public  static Boolean balancedBrackets(String input) {
        Map<String, String> opening = new Map<String, String>();
        opening.put('(', ')');
        opening.put('[', ']');
        opening.put('{', '}');
        
    return true;
    }
    
    }  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*public  static Boolean balancedBrackets(String input) {
        Map<String, String> opening = new Map<String, String>();
        opening.put('(', ')');
        opening.put('[', ']');
        opening.put('{', '}');
        
        Set<String> closing = new Set<String>(opening.values());
        
        List<String> stack = new List<String>();
        Boolean isValid ;
        
        for (String character : input.split('')) {
            if (opening.containsKey(character)) {
                stack.add(opening.get(character));
                isValid = true;
            }
            else if (closing.contains(character)) {
                
                String s = stack.isEmpty() ? null : stack.remove(stack.size()-1);
                if (character != s) {
                    
                    isValid = false;
                }
            }
        }
        
        return isValid ;
    }*/