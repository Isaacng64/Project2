@isTest
public class OrdersExtensionTest 
{
	@isTest
    public static void TP_OrderTest()
    {
        Test.startTest();
        
        Order TestOrder = new Order(Last_Name__c = '');
        ApexPages.StandardController sc = new ApexPages.StandardController(TestOrder);
        OrdersExtension OrderExtent = new OrdersExtension(sc);
        
        
        Test.stopTest();
    }
}