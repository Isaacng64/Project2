@isTest
public class InsertDescriptionTest 
{
	@testSetup
    public static void SetupTest()
    {
        List<Warehouse__c> Description_to_Insert = new List<Warehouse__c>();
        for (Integer i = 0; i < 151; i++)
        {
            Description_to_Insert.add(new Warehouse__c(name = 'Test Warehouse Description' + i));
        }
        
        Insert Description_to_Insert; 
    }
    
    @isTest
    public static void TP_Warehouse_Descript()
    {
        Test.startTest();
        
        List<Warehouse__c> someDescription = Warehouse_TestHelper.CreateDescription(2);
        
        InsertDescription.Warehouse_Descript(someDescription);
        
        
        Integer WD = 0;
        
        for (Warehouse__c Description_of_Warehouse : someDescription)
        {
            WD++;
        }
        
        System.assertEquals(2, WD);
        
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_Warehouse_Descript()
    {
        Test.startTest();
        
        List<Warehouse__c> someDescription = [SELECT Name FROM Warehouse__c];
        
        InsertDescription.Warehouse_Descript(someDescription);
        
        
        Integer WD = 0;
        
        for (Warehouse__c Description_of_Warehouse : someDescription)
        {
            WD++;
        }
        
        System.assertEquals(0, WD);
        
        
        Test.stopTest();
    }
    
    @isTest
    public static void TS_Warehouse_Descript()
    {
        Test.startTest();
        
        List<Warehouse__c> someDescription = Warehouse_TestHelper.CreateDescription(1);
        
        InsertDescription.Warehouse_Descript(someDescription);
        
        
        Integer WD = 0;
        
        for (Warehouse__c Description_of_Warehouse : someDescription)
        {
            WD++;
        }
        
        System.assertEquals(1, WD);
                
        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_Warehouse_Descript()
    {
        Test.startTest();
        
        List<Warehouse__c> someDescription = Warehouse_TestHelper.CreateDescription(1);
        
        InsertDescription.Warehouse_Descript(someDescription);
        
        
        Integer WD = 0;
        
        for (Warehouse__c Description_of_Warehouse : someDescription)
        {
            WD++;
        }
        
        System.assertEquals(2, WD);
        
        Test.stopTest();
    }
}