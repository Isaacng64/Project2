//Purpose of this class was to have a before insert to update the warehouse description

public class InsertDescription 
{
    public static void Warehouse_Descript(List<Warehouse__c> Description_of_Warehouse)
    {
        for(Warehouse__c WD : Description_of_Warehouse)
        {
            System.debug(WD.Warehouse_Description__c);                        
        }
    }
}

/*
To execute the InsertDescription.apxc and WarehouseDescription.apxt files

List<Warehouse__c> My_Warehouses = [SELECT Warehouse_Description__c FROM Warehouse__c];
InsertDescription.Warehouse_Descript(My_Warehouses);
*/