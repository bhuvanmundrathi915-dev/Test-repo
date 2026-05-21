public class contactsController {

        public List<Contact>cons {get;set;}
            public List<String> string_cons {get;set;}
   public String json_val {get;set;}

    private ApexPages.StandardSetController standardController;
    private Set <Id> contactIds = new Set <Id>();
   public  Boolean renderMe {get;set;}

    public contactsController( ApexPages.StandardSetController standardController ) {
 
        this.standardController = standardController;
        cons = new List<Contact>();
        string_cons = new List<String>();
        

        for (Contact contact : ( List <Contact> )standardController.getSelected() ){ 
 
            contactIds.add( contact.Id );
 
        }
 
        cons = [ SELECT Id, LastName FROM Contact WHERE Id IN: contactIds ];
         for(Contact c : cons)
         {
             string_cons.add(c.Id);
         }
           json_val= Json.serialize(cons);
                System.debug('contacts.......'+json_val);
        if(string_cons.isEmpty())
        {
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'No Contacts Selected')); 

        }
        else{
            renderMe=true;
               
        }
        
           }
 
}