global class contactsave {

    @auraEnabled
    public static ContactWrapper  saveContact(Contact cc)
    {
        
      String  nam = 'bhuannnnnnnnnn';
         insert cc;
        ContactWrapper contactwrap=new ContactWrapper();
        contactwrap.name=nam;
                contactwrap.idd=cc.Id;
        list<Contactinfo> ccc=new list<Contactinfo>();
        Contactinfo coninf=new Contactinfo();
        coninf.address='hyderabad';
        coninf.phone='09999999';

   Contactinfo coninf1=new Contactinfo();
        coninf1.address='warangal';
        coninf1.phone='67999999';

        ccc.add(coninf);
         ccc.add(coninf1);
contactwrap.contactinfo=ccc;
        contactwrap.contactinfo_single=coninf1;

        return contactwrap;
        
    }
    public class ContactWrapper
    {
        
        
     @auraEnabled public  String name;
        
     @auraEnabled public    String idd;
     @auraEnabled public    List<Contactinfo> contactinfo;
      @auraEnabled public    Contactinfo contactinfo_single;

    }
       public class  Contactinfo{
         @auraEnabled public  String address;
        
     @auraEnabled public    String phone;
        
          
        }
   
    
}