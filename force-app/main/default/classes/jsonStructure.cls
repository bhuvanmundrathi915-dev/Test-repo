public class jsonStructure {

    public jsonStructure()
    {
        myclasser myclass=new myclasser();
        myclass.name='raja';
                myclass.age='34';
            system.debug('json...'+JSON.serialize(myclass));
                             String boder=  JSON.serialize(myclass); 
           
                           Object obj=  (Object)  JSON.deserializeUntyped(boder);
                                 Map<String,Object> mapper=(Map<String,Object>) obj;

                            System.debug('val,,,........'+mapper.get('name')+'   '+mapper.get('age'));

    }
    
    public class myclasser{
        String name;
        String age;
    }
}