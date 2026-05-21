public class AccountSave {

    @auraEnabled
    public static String saveAccount(Account accc)
    {
        
           insert accc;
          return accc.Id;
    }
    
@AuraEnabled(cacheable=true)
    public static list<Account> getAccounts()
    {
        system.debug('acc.....'+JSON.serialize([select Name from Account limit 25]));
        return [select Name from Account limit 25];
    }
}