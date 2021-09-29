@isTest
public without sharing class TestAuraCartController {
    @TestSetup
    static void makeData(){

        Product2 prod = new Product2();
        prod.Description = 'dest';
        prod.Name = 'name';
        prod.IsActive = true;
        prod.Units__c = 'Bold White Chrome';
        prod.ProductCode = '3209587xksa';

        Insert prod;
        
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;

        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = prod.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        //Insert pbe;

    }

    @isTest
    public static void testCart(){
        Id i = AuraCartController.initCart();
         
        List<Order> orders = [SELECT ID FROM Order WHERE ID = :i];

        System.assert(orders.size() > 0, 'No order was created');
    }

    @isTest
    public static void testAddItem(){

        ID orderID = AuraCartController.initCart();

        List<Product2> products = [SELECT ID FROM Product2];

        ID prodID = products[0].Id;

        AuraCartController.updateCart(orderID, prodID, 1);

        Order ord = [SELECT Id, (SELECT id, Product2Id, Quantity FROM OrderItems) FROM Order WHERE Id = :orderID];

        System.assert(ord.OrderItems.size() > 0, 'Did not add order item to order');
    }

    @isTest
    public static void testRemoveItem(){

        testAddItem();

        List<Product2> products = [SELECT ID FROM Product2];

        ID prodID = products[0].Id;

        Order ord = [SELECT Id FROM Order];

        AuraCartController.removeItem(ord.ID, prodID);

        List<OrderItem> its = [SELECT Id FROM OrderItem];

        System.assert(its.size() == 0, 'Did not remove all order items');
    }

    @isTest
    public static void testRemoveItem2(){

        testAddItem();

        List<OrderItem> items = [SELECT ID FROM OrderItem];

        ID orderItemID = items[0].Id;

        Order ord = [SELECT Id FROM Order];

        AuraCartController.removeItem(ord.ID, orderItemID);

        List<OrderItem> its = [SELECT Id FROM OrderItem];

        System.assert(its.size() == 0, 'Did not remove all order items');
    }

    @isTest
    public static void testChangeQuantityandGetCartProducts(){

        testAddItem();

        ID ord = [SELECT Id FROM Order][0].Id;
        ID item = [SELECT Id FROM OrderItem][0].Id;

        AuraCartController.changeCartAmount(ord, item, 15);

        List<AuraCartController.Wrapper> wrap = AuraCartController.getCartProducts(ord);

        if(wrap.size() == 1){
            System.assert(wrap[0].Quantity == 15, 'Did not change quantity to 15');
        }else{
            System.assert(false, 'Did not change quantity to 15');
        }

    }

    @isTest
    public static void testSameAddress(){
        ID ord = AuraCartController.initCart();

        Order ordr = [SELECT Id, bSameAddress__c FROM Order WHERE Id = :ord];

        System.assert( ! ordr.bSameAddress__c);

        AuraCartController.setSameAddress(ord, true);

        ordr = [SELECT Id, bSameAddress__c FROM Order WHERE Id = :ord];

        System.assert(ordr.bSameAddress__c);
    }

    @isTest
    public static void testAddItemViaCode(){
        ID ord = AuraCartController.initCart();

        Product2 a = [SELECT ID, ProductCode FROM Product2][0];

        AuraCartController.addProductByCode((String)ord, (String)a.ProductCode);

        Order ordr = [SELECT Id, (SELECT id, Product2Id, Quantity FROM OrderItems) FROM Order WHERE Id = :ord];

        System.assert(ordr.OrderItems.size() > 0, 'Did not add order item to order');

        Boolean val = false;
        for(OrderItem item : ordr.OrderItems){
            if(item.Product2Id == a.Id){
                val = true;
            }     
        }
        System.assert(val, 'Did not add correct product');
    }

}
