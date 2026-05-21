public class AccountList {

    @auraEnabled(cacheable=true)
    public static Map<Object,Object> getAccounts()
    {
      Map<Id,Account> mp=  new Map<Id,Account>([select Id,Name from Account limit 10]);
              
        return new Map<Object,Object>{'account'=>mp,'contact'=>new Map<String,String>{'contact1'=>'ramesh','contact2'=>'sathish','contact3'=>'jay'}};
    }
    @auraEnabled(cacheable=true)
    public static List<SObject> getRecords(String name)
    {
        list<SObject> records;
        
          if(name=='Account')
          {
              records=[select Id,Name from Account limit 10];
          }
           else if(name=='Student')
               {
                           records=[select Id,Name from State__c limit 10];
      
               }
          return records;              
    }
    @auraEnabled
    public static Id saveContact(Contact contact)
    {
        Database.insert(contact,false);
        return contact.Id;
            
        
    }
    @auraEnabled
    public static Id verifyUser(String email,String password)
    {
          State__c user = [select Email__c,Password__c from State__c where Email__c=:email AND Password__c=: password limit 1 ];
        return user.Id;
            
        
    }
    
    @auraEnabled
    public static Integer generateOtp()
    {
      
      Integer otp=   Math.round((Math.random() * (900000) + 100000));
   List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();

      Messaging.SingleEmailMessage mail = 
      new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add('advancedconcepts915@gmail.com');
      mail.setToAddresses(sendTo);
    
      // Step 3: Set who the email is sent from
      mail.setReplyTo('advancedconcepts915@gmail.com');
      mail.setSenderDisplayName('BHUVAN MUNDRATHI');
    
     
      // Step 4. Set email contents - you can use variables!
      mail.setSubject('URGENT BUSINESS PROPOSAL');
      String body = 'Dear ' + 'Bhuvan Mundrathi' + ', ';
      body += 'your Otp is '+String.valueOf(otp);
      mail.setHtmlBody(body);
          mails.add(mail);

      // Step 5. Add your email to the master list
   
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
         return otp;
        
    }
    
}