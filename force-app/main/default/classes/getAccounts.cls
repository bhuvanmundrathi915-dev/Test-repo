public with sharing class getAccounts {
    public getAccounts() {

    }
    @AuraEnabled(cacheable=true)
    public  static List<Account>  getaccs(String search){
        try {
            
            return [select Name,Id from Account where Name like :  search+'%'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}