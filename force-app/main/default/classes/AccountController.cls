public with sharing class AccountController {
// to make changes on Accounts  
@AuraEnabled(cacheable=true)
    public static List<Account> getAllActiveAccounts() {
     // my name is bhuvan kumar
    return [SELECT Id,Name,CreatedData Active__c,(select Id,FirstName,LastName from Contacts) FROM Account WHERE CreatedDate =today];
  }
}
