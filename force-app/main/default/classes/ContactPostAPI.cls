@RESTResource(urlMapping ='/contactCreation/')
global class ContactPostAPI {
    
    @httpPost
    global static GenericResponse postContactRequest(List<dataDetails> data,addressDetails address) {
        List<Contact> contactList = new List<Contact>();
         Contact con = new Contact();
        for(dataDetails de : data){
           
            con.FirstName = de.firstName;
            con.LastName = de.lastName;
            con.Email = de.email;
           
        }
            con.MailingStreet = address.streetName;
            con.MailingCity = address.city;
            con.MailingPostalCode = address.postcode;
            contactList.add(con);
        
        try
        {
            insert  contactList;
            List<Id> conIds = new List<Id>();
            for(Contact co : contactList){
                conIds.add(co.Id);
            }
            
            GenericResponse response= new GenericResponse();
            response.id = conIds;
            return response; 
        }
        catch (Exception e)
        {
            GenericResponse response= new GenericResponse();
            response.error = e.getMessage();
            return response;
        }
    }
    
    global class GenericResponse{
        global List<Id> id;
        global String error;
    }
    global class ContactWrapper{
        global List<dataDetails> data;
        global addressDetails address;
    }
    global class dataDetails{
        global String firstName;
        global String lastName;
        global String email;
    }
    global class  addressDetails{
        global String streetName;
        global String city;
        global String postcode;
    }
    
}