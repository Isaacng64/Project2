public with sharing class OrderMapController {
    
    @AuraEnabled
    public static Order getOrderLocation(string orderTN) {
        System.debug(orderTN);
        orderTN = orderTN + '%';
        order ret;

        ret = [SELECT TrackingNumber__c, Lat__c, Lon__c FROM Order WHERE TrackingNumber__c LIKE :orderTN LIMIT 1];
        
        return ret;
    }
    // currently the lightning map works on order IDs, need to find away to do the same with order number
}