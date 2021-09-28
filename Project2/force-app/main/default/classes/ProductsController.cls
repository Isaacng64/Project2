public with sharing class ProductsController {
    @AuraEnabled
    public static List <Product2> readProducts() {
        //Query products
       List<Product2> prdList = [SELECT Id, Name, Description, ProductCode, Units__c, inStockQuantity__c, ProductImg__c
                                    FROM Product2 
                                    WHERE IsActive = True]; //  AND inStockQuantity__c > 0
        //return list of accounts
        return prdList;     
    }
}