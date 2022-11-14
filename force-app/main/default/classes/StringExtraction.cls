public class StringExtraction {
    
    public Static void  splitEmail(String email) {
        
        String leftPart = email.substringBefore('@');
        String[] leftPartSplitted = leftPart.split('\\.');
        
        if(leftPartSplitted.size() == 2){
            String firstName =leftPartSplitted[0];
            String lastName = leftPartSplitted[1];
           system.debug('The First and Last name of the String is:'+firstName.capitalize()+lastName.capitalize());
        }
        
        /* string email1 = 'saravana.ts@gmail.com';

String firstName = email.split('@').get(0);
String lastName = email.split('@').get(1);

System.debug('==uname=='+firstName+lastName);
// System.debug('==domain=='+domain);*/
        
    }
}