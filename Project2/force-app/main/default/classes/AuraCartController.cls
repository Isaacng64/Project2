public without sharing class AuraCartController {

    @AuraEnabled
    public static void removeItem(String orderID, String productOrOrderItemID){

        List<OrderItem> items = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE id = :productOrOrderItemID AND orderId = :orderID];

        if (items.size() == 0){
            items = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE product2id = :productOrOrderItemID AND orderId = :orderID];
        }

        try{
            OrderItem item = items[0];
            Delete item;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    //manually add a product in the cart basically instead of using the catalog interface
    @AuraEnabled
    public static void addProductByCode(String orderID, String productCode){

        try{
            List<Product2> prods = [SELECT Id, ProductCode FROM Product2 WHERE ProductCode = :productCode];

            if(prods.size() > 0){

                Product2 prod = prods[0];
                ID prId = prod.Id;
                //updateCart(orderID, prod.Id, 1);

                // literally copy pasted since you can't call an auraenabled function from another RIP RIP RIP RIP

                List<PricebookEntry> entries = [SELECT id, Product2id, Pricebook2Id FROM PricebookEntry WHERE Product2id = :prId];
                PricebookEntry entry;
                if (entries.size() == 1){

                    if(entries[0].Pricebook2Id != [SELECT ID FROM Pricebook2 WHERE IsStandard = true][0].Id){
                        entry = new PricebookEntry();
                        entry.Pricebook2Id = [SELECT Id, IsStandard FROM Pricebook2 WHERE IsStandard = true][0].Id;
                        entry.Product2Id = prId;
                        entry.UnitPrice = 10;
                        entry.IsActive = true;
                        Insert entry;
                    }else{
                        entry = entries[0];
                    }
                }else{
                    entry = new PricebookEntry();
                    entry.Pricebook2Id = [SELECT Id, IsStandard FROM Pricebook2 WHERE IsStandard = true][0].Id;
                    entry.Product2Id = prId;
                    entry.UnitPrice = 10;
                    entry.IsActive = true;
                    Insert entry;
                }
                OrderItem item;
                item = new OrderItem();
                item.quantity = 1;
                item.product2id = prId;
                item.orderId = orderID;
                item.pricebookentryid = entry.Id;
                item.unitprice = 1;

                Insert item;
            }
        }catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    // weird paramemeter names but don't change them, this function is to 'add new item' to the cart
    @AuraEnabled
    public static void updateCart(String orderID, String productOrOrderItemID, Integer amount){

        //List<OrderItem> items = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE id = :productOrOrderItemID AND orderId = :orderID];
        OrderItem item;

        List<PricebookEntry> entries = [SELECT id, Product2id FROM PricebookEntry WHERE Product2id = :productOrOrderItemID];
        PricebookEntry entry;
        if (entries.size()>0){
            entry = entries[0];
        }else{
            entry = new PricebookEntry();
            entry.Pricebook2Id = [SELECT Id, IsStandard FROM Pricebook2 WHERE IsStandard = true][0].Id;
            entry.Product2Id = productOrOrderItemID;
            entry.UnitPrice = 10;
            entry.IsActive = true;
            Insert entry;
        }

        item = new OrderItem();
        item.quantity = amount;
        item.product2id = productOrOrderItemID;
        item.orderId = orderID;
        item.pricebookentryid = entry.Id;
        item.unitprice = 1;

        try{
            Insert item;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void changeCartAmount(String orderID, String orderItemID, Integer amount){

        OrderItem item = [SELECT id, quantity, product2id, orderId FROM OrderItem WHERE id = :orderItemID AND orderId = :orderID];

        // item already in cart at least once
        item.quantity = amount;

        try{
            Update item;
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

        List<Account> accs = [SELECT id, name FROM Account WHERE name = 'GeneralWebPurchases'];

        Account acc;

        if(accs.size() == 0){
            acc = new Account();
            acc.Name = 'GeneralWebPurchases';
            try{
                Insert acc;
            }catch(Exception e){
                throw new AuraHandledException(e.getMessage());
            }
        }else{
            acc = accs[0];
        }

        newCart.Status = 'Draft';
        newCart.AccountId = acc.Id; // GenericWebPurchases
        newCart.Pricebook2Id = [SELECT Id, IsStandard FROM Pricebook2 WHERE IsStandard = true][0].Id;

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
            Name = prod.Name;
            Description = prod.Description;
            ProductCode = prod.ProductCode;
            Quantity = (integer)oi.Quantity;
            OrderItemID = oi.Id;
            ProductID = prod.Id;
        }
    }
    
}