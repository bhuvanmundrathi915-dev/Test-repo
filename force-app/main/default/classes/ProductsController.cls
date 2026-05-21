public class ProductsController {

    @AuraEnabled(cacheable=true)
    public static list<Product2> getProducts()
    {
        return [select Id,Name from Product2 limit 10];
    }
}