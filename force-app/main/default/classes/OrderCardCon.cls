public with sharing class OrderCardCon {
    @AuraEnabled
    public static Order GetOrder(String orderTN) {
     	System.debug(orderTN);
        orderTN = orderTN + '%';
        order ret;

        ret = [SELECT Id, TrackingNumber__c, OrderNumber, TotalAmount, Status, LastLocation__c FROM Order WHERE TrackingNumber__c LIKE :orderTN LIMIT 1];
        
        return ret;
	}   
}