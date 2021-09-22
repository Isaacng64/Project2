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
    
}
