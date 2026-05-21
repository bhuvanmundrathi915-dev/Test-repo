public class TestErrrors {
    
    public static void testmain(){
           try{
        test1(); 
           test2(); 
           test3(); 
            system.debug('Test Main.........End');

        }catch(Exception e){
                   system.debug('Error Main ========>'+e.getMessage());
     
        }
    

         system.debug('MAINER===========');
    }
    public static void test1(){
    
            Integer c= new list<Integer>().get(0);
                system.debug('Test 1========>'+c);
    
    }
    public static void test2(){
       try{
                                system.debug('Test 2========>');

        }catch(Exception e){
                   system.debug('Error Test 2========>'+e.getMessage());
     
        }
    
    }
    public static void test3(){
      try{
                    system.debug('Test 3========>');
    
        }catch(Exception e){
                   system.debug('Error Test 3========>'+e.getMessage());
     
        }
     
    }
    
}