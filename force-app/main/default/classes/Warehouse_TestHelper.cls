@isTest
public class Warehouse_TestHelper 
{
	public static void InsertDescription(Integer Descript)
    {
        List<Warehouse__c> DescriptInsert = new List<Warehouse__c>();
        
        for (Integer i = 0; i < Descript; i++)
        {
            DescriptInsert.add(new Warehouse__c(name = 'Test Description' +i ));
        }
        
        Insert DescriptInsert;
    }
    
    public static List<Warehouse__c> CreateDescription(Integer Descript)
    {
        List<Warehouse__c> ReturnDescription = new List<Warehouse__c>();
        
        for (Integer i = 0; i < Descript; i++)
        {
            ReturnDescription.add(new Warehouse__c(name = ' ' + i));
        }
        
        return ReturnDescription;
    }
}