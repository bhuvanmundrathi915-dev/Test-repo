public class AccountTerritoryTriggerHandler {

    public static void sendEmailAlert(list<Account> accounts)
    {
          
      List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();
  
  for (Account account : accounts) {
    if (account.OwnerId != null) {
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail = 
      new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(account.OwnerId);
      mail.setToAddresses(sendTo);
    
      // Step 3: Set who the email is sent from
      mail.setSenderDisplayName(account.Name);
    
    
      // Step 4. Set email contents - you can use variables!
      mail.setSubject('New Account Created');
      String body = 'Hi ' + account.Name + ', ';
            body += 'New Account Created in the Org';
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);
    }
  }
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);

        
    }
}