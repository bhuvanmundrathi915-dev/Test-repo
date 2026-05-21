public class saveCheckListAccount {

    @AuraEnabled
    public static void insertAccounts(list<Account> accounts)
    {
          insert   accounts;
    }
}