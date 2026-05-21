public class NewAccountCreation {
public Account account{get;set;}
public void save(){
Account acc = new Account();
// User enter values in vf page and we are capturing and creating account
acc.name = account.Name;
//acc.address = account.adress;
Insert acc;
}
}