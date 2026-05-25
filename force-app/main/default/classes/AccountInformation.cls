public with sharing class AccountInformation {
    public AccountInformation() {
      //all
    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(String searchkey){
        try {
            
            return [select Id,Name from Account where Name like : searchkey];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
     
}
