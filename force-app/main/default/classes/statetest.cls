@isTest
public class statetest
{
public TestMethod static void createState_method()
{
State__c state=New State__c();
state.Name='Test';
state.Code__c=100;
Insert state;
City__c city=New City__c();
city.Name='Test city';
    city.Code__c=09;
city.State__c=state.Id;
Insert city;
    state.Code__c=200;
Test.startTest();
    update state;
    city=[select Code__c from City__c where id =: city.Id];
system.assertEquals(200,city.Code__c);
Test.stopTest();
}
}