public class MyPalindrome {
    
    public Static void checkPalindrome(String input){
        
        String reverseString ='';
        reverseString = input.reverse();
        
        if(input.equals(reverseString)){
            system.debug('String is Palindrome');
        }
        else{
            system.debug('String is not Palindrome');
        }   
    }
    public static void isPalindrome(String input){
        
        
        String toLowerCaseString = input.toLowerCase();
        Integer lengthOfString = toLowerCaseString.length();
        
        String inputWithoutSpecialChars = '';
        
        for(Integer i=0; i<lengthOfString; i++){
            
            String checkSubstring = input.substring(i,i+1);
            //System.debug('isSubstring'+checkSubstring);
            
            Boolean isThisAlphaNumeric = checkSubstring.isAlphanumeric();
            
            if(isThisAlphaNumeric){
                inputWithoutSpecialChars = inputWithoutSpecialChars + checkSubstring; 
            }
            }
        System.debug('inputWithoutSpecialChars'+inputWithoutSpecialChars);
        
        if(inputWithoutSpecialChars == inputWithoutSpecialChars.reverse()){
            
            System.debug('Given String is Palindrome');  
            
        }
        else {
            System.debug('Given String is not palidrome');
        }
    }
    
    /* public static boolean PalindromeCheck(String input){
if(String.isBlank(input)){
return true;
}

String toLowerCaseString = input.toLowerCase();
Integer lengthOfString = toLowerCaseString.length();

String inputWithoutSpecialChars = '';

for(Integer i=0; i<lengthOfString; i++){

String checkSubstring = input.substring(0,i+1);
System.debug('isSubstring'+checkSubstring);

Boolean isThisAlphaNumeric = checkSubstring.isAlphanumeric();

if(isThisAlphaNumeric){
inputWithoutSpecialChars = inputWithoutSpecialChars + checkSubstring; 
}

}
System.debug('inputWithoutSpecialChars'+inputWithoutSpecialChars);

if(inputWithoutSpecialChars == inputWithoutSpecialChars.reverse()){
return true;
System.debug('Given String is Palindrome');  

}
else {
System.debug('Given String is not palidrome');
}
}*/
}