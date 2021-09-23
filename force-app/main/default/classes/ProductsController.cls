public with sharing class ProductsController {
    @AuraEnabled
    public static List <Product2> readProducts() {
        //Query products
       List<Product2> prdList = [SELECT Id, Name, Description, ProductCode, Units__c, inStockQuantity__c 
                                    FROM Product2 
                                    WHERE IsActive = True];
        //return list of accounts
        return prdList;     
    }
}