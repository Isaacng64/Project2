public with sharing class OrderSearchCon {
    
    @AuraEnabled
    public static Order GetOrder(string orderTN) {
        System.debug(orderTN);
        orderTN = orderTN + '%';
        order ret;

        ret = [SELECT Id, TrackingNumber__c, OrderNumber, TotalAmount, Status, LastLocation__c, Lat__c, Lon__c, AccountId FROM Order WHERE TrackingNumber__c LIKE :orderTN LIMIT 1];
        
        return ret;
    }
}