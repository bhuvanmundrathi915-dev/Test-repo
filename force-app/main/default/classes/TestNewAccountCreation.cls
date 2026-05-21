@isTest
public class TestNewAccountCreation {
    @isTest static void TestNewAccountCreationMethod(){
        NewAccountCreation testAccount = new NewAccountCreation ();
        testAccount.account =new Account(Name='Ramesh');
        testAccount.save();
        Account acc = new Account(Name='TestAcct');
        Insert acc;
        system.debug(''+acc);

        System.assert([Select Id From Account].size()==1);
    }
}