public with sharing class AccountController {
@AuraEnabled(cacheable=true)
    public static List<Account> getAllActiveAccounts() {
     // MMMMMM
   return [SELECT Id,Name,Active__c,(select Id,FirstName,LastName from Contacts) FROM Account WHERE CreatedDate =today];
  }
}
