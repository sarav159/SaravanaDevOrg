@RESTResource(urlMapping ='/AccountVisitCreation/')
global class VisitAccountApI {
    
    @HttpPost
    global static void createAccountWithVisit(List<Details> data, List<VisitDate> visits){
        
        List<Account> accList = new List<Account>();
        
        for(Details ac  : data){
            Account acc = new Account();
            acc.Name = ac.accountName;
            acc.Phone = ac.phone;
            accList.add(acc);
        }
        insert accList;
        
        Integer count = 0;
        List<Visit__c> visitList = new List<Visit__c>();
        
        for(Details ac  : data){
            system.debug('accList'+ac);
            List<VisitDate> visit = ac.visits;
            for(VisitDate vs : visit){
                system.debug('visit'+vs);
                Visit__c vi = new Visit__c();
                vi.Name = vs.name; 
                vi.Visit_Date__c = vs.visitDate;
                vi.Account__c = accList.get(count).id;
                visitList.add(vi);    
            }
        }
        
        insert visitList;
       /* try
        {
            
            List<Id> accIds = new List<Id>();
            for(Account co : accList){
                accIds.add(co.Id);
            }
            
            GenericResponse response= new GenericResponse();
            response.id = accIds;
            return response; 
        }
        catch(Exception e)
        {
            GenericResponse response= new GenericResponse();
            response.error = e.getMessage();
            return response;
        }*/
    }
    global class GenericResponse{
        global List<Id> ids;
        global String error;
    }
    global class finalClass{
        global List<Details> data;
    }
    global class Details{
        global String accountName;
        global String phone;
        global List<VisitDate> visits;
        
    }
    
    global class VisitDate{
        global String name;
        global Date visitDate;
    } 
}