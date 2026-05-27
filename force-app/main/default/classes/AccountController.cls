public with sharing class AccountController {
// to make changes on Accounts  
@AuraEnabled(cacheable=true)
    public static List<Account> getAllActiveAccounts() {
<<<<<<< HEAD
     //  my name is bhuvaneshwar
   return [SELECT Id,Name,Active__c,(select Id,FirstName,LastName from Contacts) FROM Account WHERE CreatedDate =today];
=======
     // my name is bhuvan
    return [SELECT Id,Name,Active__c,(select Id,FirstName,LastName from Contacts) FROM Account WHERE CreatedDate =today];
>>>>>>> vs-new-branch
  }
}
