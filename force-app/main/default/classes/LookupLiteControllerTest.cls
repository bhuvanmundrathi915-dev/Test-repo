@isTest
public class LookupLiteControllerTest {

    @isTest
    static void test1()
    {
        list<Account> accounts=new list<Account>();
         for(Integer val=0;val<20;val++)
         {
             Account account=new Account();
             account.Name='Test '+String.valueOf(val);
             accounts.add(account);
         }
        insert accounts;
        Test.startTest();
      list<Account> acclist=  LookupLiteController.fetchRecords('Account','Name',null,'Test');
        system.assert(!acclist.isEmpty());
        Test.stopTest();
    }
    @isTest
    static void test2()
    {
        list<Payee_Distribution__c> payeelist=new list<Payee_Distribution__c>();
        Payee_Distribution__c payee=new Payee_Distribution__c();
        payee.Name='Test PAYee';
        payee.Allocation_Percentage__c=20;
        insert payee;
        payeelist.add(payee);
        Test.startTest();
        LookupLiteController.insertPayeeDistribtion(payeelist);
         System.assert([select Id from Payee_Distribution__c where Id =:payee.Id].size()>0);
        Test.stopTest();
    }
}