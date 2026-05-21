@isTest
public class CustomLookupLwcControllerTest {

    @isTest
    static void test1()
    {
        list<Account> aclist=new list<Account>();
        for(Integer i=0;i<20;i++)
        {
                    Account account=new Account();
                  account.Name='United'+i;
            aclist.add(account);
        }
          if(!aclist.isEmpty())
          {
                  insert aclist;
              }
        Test.startTest();
        list<sObject> objlist= CustomLookupLwcController.fetchLookupData('United', 'Account');
        system.assert(!objlist.isEmpty());
        Test.stopTest();
        
    }
    @isTest
    static void test2()
    {
        list<Account> aclist=new list<Account>();
        for(Integer i=0;i<20;i++)
        {
                    Account account=new Account();
                  account.Name='United'+i;
            aclist.add(account);
        }
          if(!aclist.isEmpty())
          {
                  insert aclist;
              }
        Test.startTest();
        sObject obj= CustomLookupLwcController.fetchDefaultRecord(aclist.get(0).Id, 'Account');
          Account ac=(Account) obj;
        system.assert(ac.Name!=null);
        Test.stopTest();
        
    }
}