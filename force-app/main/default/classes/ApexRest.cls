public class ApexRest {

    public static final String APIKEY='?apiKey=d2540222920b4dd9885ea713aeeadb6f';
    public static final String URL='https://api.spoonacular.com/recipes/random';

    @auraEnabled(cacheable=true)
    public static List<Map<String,String>>  getRecipe()
    {
        Http http=new Http();
        HttpRequest httpre=new HttpRequest();
         httpre.setMethod('GET');
        httpre.setEndpoint(URL+APIKEY);
      HttpResponse httpres= http.send(httpre);
        List<Map<String,String>> listv=new List<Map<String,String>>();
        Map<String,String> mp=new Map<String,String>();
        mp.put('vegetarian', 'kkkkk');
        mp.put('vegan', 'vvv');
               listv.add(mp);
                  listv.add(mp);

        
    //  fromJSON v=  fromJSON.parse(httpres.getBody());
            //    System.debug('responce.....'+v.recipes);
                        System.debug('responce.2222....'+listv);

        return listv;

        //return v.recipes;
        
        
    }
}