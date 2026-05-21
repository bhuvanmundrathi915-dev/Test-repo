public  class newACC {
    public newACC() {

    }
    @AuraEnabled
    public static Id  insertacc(Account acc)
     {
 
          insert acc;
            return acc.Id;          
    }
}