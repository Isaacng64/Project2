public without sharing class AuraCartController {

    @AuraEnabled
    public static List<Product2> getProducts(){
        try {
            List<Product2> allProducts = [SELECT Name, ProductCode, Description FROM Product2];

            return allProducts;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    
    @AuraEnabled
    public static List<Product2> getCartProducts(String orderID){
        Order a = [SELECT id, (SELECT id, Product2Id FROM OrderItems) FROM Order WHERE id = :orderID];

        //List<String> productNames = new List<String>();

        List<Product2> cartProducts = new List<Product2>();
        
        for(integer i = 0; i < a.OrderItems.size(); i++){
            String theId = (String)a.OrderItems[i].get('Product2Id');
            Product2 prod = [SELECT ID, Name, ProductCode, Description FROM Product2 WHERE ID = :theId];
            //productNames.add(prod.Name);
            cartProducts.add(prod);
        }
        
        //System.debug(productNames);

        return cartProducts; // may want to return other info than strictly the product 2 sobjects if concerned about quantity, which is to do more with the orderitem actually
        // so perhaps, all you are actually concerned with in queryring the product2 for is the name after all, in which the commented out code is what you need
        
    }

    @AuraEnabled
    public static String initCart(){
        Order newCart = new Order();

        newCart.Status = 'Draft';
        newCart.AccountId = '0015f000003NEWxAAO'; // genericWebAcount
        newCart.MiningSite__c = 'a015f000002sb3HAAQ'; // space comet 2
        newCart.EffectiveDate = Date.today();

        Insert newCart;

        return newCart.id; // works!
    }

    @AuraEnabled
    public static Boolean getSameAddress(String orderID){
        Order a = [SELECT id, bSameAddress__c FROM Order WHERE id = :orderID];

        return a.bSameAddress__c;
    }
    
    @AuraEnabled
    public static void setSameAddress(String orderID, Boolean bool){
        Order a = [SELECT id, bSameAddress__c FROM Order WHERE id = :orderID];

        a.bSameAddress__c = bool;

        Update a;
    }


    public class Wrapper{

        public Product2 prod;
        public OrderItem oi;

        public Wrapper(Product2 prod, OrderItem oi){
            this.prod = prod;
            this.oi = oi;
        }
    }
    
}
