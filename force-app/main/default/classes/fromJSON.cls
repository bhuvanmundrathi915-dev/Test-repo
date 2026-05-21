public class fromJSON{
@auraEnabled
   
    public cls_recipes[] recipes;

   public class cls_recipes {
	@auraEnabled
     
       public boolean vegetarian;
	@auraEnabled
       public boolean vegan;
		public boolean glutenFree;
		public boolean dairyFree;
		public boolean veryHealthy;
		public boolean cheap;
		public boolean veryPopular;
		public boolean sustainable;
		public Integer weightWatcherSmartPoints;	//7
		public String gaps;	//no
		public boolean lowFodmap;
		public Integer aggregateLikes;	//13
		public Integer spoonacularScore;	//68
		public Integer healthScore;	//20
		public String creditsText;	//Foodista.com – The Coo
	}
	public static fromJSON parse(String json){
		return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
	}

/*	static testMethod void testParse() {
		String json=		'{"recipes":[{"vegetarian":true,"vegan":true,"glutenFree":false,"dairyFree":true,"veryHealthy":false,"cheap":false,"veryPopular":false,"sustainable":false,"weightWatcherSmartPoints":7,"gaps":"no","lowFodmap":false,"aggregateLikes":13,"spoonacularScore":68.0,"healthScore":20.0,"creditsText":"Foodista.com – The Coo"}]}';
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}
*/
}