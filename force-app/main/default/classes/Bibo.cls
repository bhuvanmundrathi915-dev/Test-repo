public class Bibo {

     Public Integer count;
     public zum zummer;
    public class zum{
        public Integer zz;
    }
     public list<Vevo> veevers;
    
    public class Vevo
    {
      public Integer sum;
        
    }
    
    
    
  public static  Bibo bbb=null;
    public static Bibo getInstance()
    {
        if(bbb==null)
        {
            bbb=new Bibo();
        }
       return bbb;
    }
    public Bibo()
    {
          Integer count=20;
        system.debug('count.....'+this.count+'   '+count);
        count++;
            
        
            
        
    }
    public  String getResult()
    {
       Integer resl= getFirst(100);
        test123();
        
        return String.valueOf(resl);
    }
    private void test123()
    {
        system.debug('hello........');
    }
    public static Integer getFirst(Integer vall)
    {
        vall+=2000;
        return vall;
    }
}