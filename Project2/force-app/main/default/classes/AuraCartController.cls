public without sharing class AuraCartController {

    @AuraEnabled
    public static void removeItem(String orderID, String productOrOrderItemID){
        OrderItem item = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE id = :productOrOrderItemID AND orderId = :orderID];

        try{
            Delete item;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateCart(String orderID, String productOrOrderItemID, Integer amount){

        OrderItem item = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE id = :productOrOrderItemID AND orderId = :orderID];

        if (item != null){
            // item already in cart at least once
            item.quantity = amount;

        }else{
            //item not at all in cart yet
            item = new OrderItem();
            item.quantity = amount;
            item.product2id = productOrOrderItemID;
            item.orderId = orderID;
        }
        try{
            Upsert item;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }

    
    @AuraEnabled
    public static List<Wrapper> getCartProducts(String orderID){
        Order a = [SELECT id, (SELECT id, Product2Id, Quantity FROM OrderItems) FROM Order WHERE id = :orderID];

        //List<String> productNames = new List<String>();

        //List<Product2> cartProducts = new List<Product2>();

        List<Wrapper> wrappers = new List<Wrapper>();
        
        for(integer i = 0; i < a.OrderItems.size(); i++){
            String theId = (String)a.OrderItems[i].get('Product2Id');
            Product2 prod = [SELECT ID, Name, ProductCode, Description FROM Product2 WHERE ID = :theId];
            //productNames.add(prod.Name);
            //cartProducts.add(prod);
            wrappers.add(new Wrapper(prod, a.OrderItems[i]));
        }

        return wrappers;
        
        //System.debug(productNames);

        //return cartProducts; // may want to return other info than strictly the product 2 sobjects if concerned about quantity, which is to do more with the orderitem actually
        // so perhaps, all you are actually concerned with in queryring the product2 for is the name after all, in which the commented out code is what you need
        
    }

    @AuraEnabled
    public static String initCart(){
        Order newCart = new Order();

        newCart.Status = 'Draft';
        newCart.AccountId = '0015f000005eMt0AAE'; // GenericWebPurchases

        newCart.EffectiveDate = Date.today();

        try{
            Insert newCart;
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }

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

    //public static Integer numWrappers = 0;
    public class Wrapper{

        /*
        @AuraEnabled
        public Product2 prod; // what is difference from this and using/not using {set;get;} ????
        @AuraEnabled
        public OrderItem oi;
        */

        @AuraEnabled
        public String Name;
        @AuraEnabled
        public String Description;
        @AuraEnabled
        public String ProductCode;
        @AuraEnabled
        public Integer Quantity;
        @AuraEnabled
        public String OrderItemID;
        @AuraEnabled
        public String ProductID;
        @AuraEnabled
        public String id;

        public Wrapper(Product2 prod, OrderItem oi){
            //numWrappers += 1;
            //id = 'osifd0923a' + numWrappers;

            //this.prod = prod;
            //this.oi = oi;

            Name = prod.Name;
            Description = prod.Description;
            ProductCode = prod.ProductCode;
            Quantity = (integer)oi.Quantity;
            OrderItemID = oi.Id;
            ProductID = prod.Id;
        }
    }
    
}