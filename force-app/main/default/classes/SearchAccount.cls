public class SearchAccount {

  @auraEnabled
    public static List<Account> searchAccounts(string searchKey){ 
        return [SELECT Id,Name,Phone,Industry FROM Account WHERE Industry =: searchKey]; 
    }

}