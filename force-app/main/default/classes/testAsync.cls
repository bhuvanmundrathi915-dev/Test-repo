public class testAsync {

     public static void test()
     {
         system.debug('name......111111111111');
         test1('ram');
          system.debug('name......3333333333');

     }
    @future
    public  static void test1(String name)
    {
           for(Integer i=0;i<1000;i++)
           {
               if(i==999)
               {
                            system.debug('name......222222');
     
               }
           }
               
       
    }
}