public class FirstContact {
  
    @auraEnabled
    public static Contact getContact()
    {
        return [select Name,AccountId ,Account.Industry from Contact limit 1];
        
    }

}