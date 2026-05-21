public with sharing class AccountInformation {
    public AccountInformation() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(String searchkey){
        try {
            //test
            return [select Id,Name from Account where Name like : searchkey];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
     
}
