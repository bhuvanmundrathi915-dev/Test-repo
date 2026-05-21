public class AuraMethodSearchAccounts {

    @auraEnabled
    public static List<Account> getAccounts(String searchkey)
    {
        
           return [select Name,Id,Industry,Phone from Account where Industry like : searchkey];
        
    }
}