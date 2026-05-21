public with sharing class AccountManager {
 
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(Integer con)
    {
        try {
            
           return [select Name,Phone from Account limit  : con];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
     
    }
}