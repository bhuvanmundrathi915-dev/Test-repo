public class RecipeVF {

   public String id {get;set;}
  
    public RecipeVF() {
 
		id = ApexPages.currentPage().getParameters().get('id');
        
    }
    @AuraEnabled(cacheable=true)
    public static list<Address__c> getAddress()
    {
        return [select Name,Account__r.Name,Contact__r.LastName, Description__c from Address__c limit 10];
    }
      @AuraEnabled(cacheable=true)
    public static Map<String,String> getAddressMap()
    {
   //     Map<ID, Contact> m = new Map<ID, Contact>([SELECT Id, LastName FROM Contact]);

       list<Address__c> addd= [select Name,Account__r.Name,Contact__r.LastName, Description__c from Address__c ];
        Map<String,String> maper=new Map<String,String>();
      //   for(Address__c add : addd)
       //  {
       //   maper.put(add.Id, add);     
       //  }
      maper.put('Name','venkat');
              maper.put('Address','HANAMKONDA');

        return maper;
    }
  
    @AuraEnabled
    public static void insertRecipe(String parentId,list<Address__c> address)
    {
          list<Recipe_List__c> recipelist=new list<Recipe_List__c>();
         for(Address__c ad : address)
         {
             recipelist.add(new Recipe_List__c(Address__c=ad.Id,State__c=parentId));
         }
        if(!recipelist.isEmpty())
        {
            insert recipelist;
      }
    }

}