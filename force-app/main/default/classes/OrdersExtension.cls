public with sharing class OrdersExtension 
{
    public Order TheOrders {get; set;}
    
    public OrdersExtension(ApexPages.StandardController sController)
    {
        PageReference currPage = ApexPages.currentPage();
        
        TheOrders = (Order)sController.getRecord();
    }	
    
    public PageReference save()
    {
        Account acc = new Account();
        TheOrders.AccountId = '0015e00000J5S8xAAF';
        
        date myDate = date.today();
        TheOrders.EffectiveDate = date.today();
        TheOrders.Status = 'Draft';
        
        Insert TheOrders;
        TheOrders.Status = 'Activated';
        upsert TheOrders;
        PageReference pgRef = ApexPages.currentPage();
        TheOrders = new Order();
                
        //TheOrders.StatusCode = 'D';
        //TheOrders.Status = 'Draft';
        //update TheOrders;
        
        return pgRef;
    }
    
    public static Integer CallMethods(Order currOrder)
    {
        Integer Ord = 0;
        if(LastNameValidator(currOrder.Last_Name__c))
        {
            Ord++;
        }
        
        if(CityValidator(currOrder.City__c))
        {
            Ord++;
        }
        
        if(StreetAddressValidator(currOrder.Street_Address__c))
        {
            Ord++;
        }
        
        if(AptNumberValidator(currOrder.Apt_Number__c))
        {
            Ord++;
        }
        
        return Ord;
    }
    
    public static Boolean LastNameValidator(String Last_Name)
    {
        Boolean Last_Name_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('[a-zA-Z0-9]+');
        
        Matcher MyMatcher = LastNamePattern.matcher(Last_Name);
        
        Last_Name_Valid = MyMatcher.matches();
        
        return Last_Name_Valid;
    }
    
    public static Boolean CityValidator(String City)
    {
        Boolean City_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('[a-zA-Z0-9]+');
        
        Matcher MyMatcher = LastNamePattern.matcher(City);
        
        City_Valid = MyMatcher.matches();
        
        return City_Valid;
    }
    
    public static Boolean StreetAddressValidator(String SA) //SA short for Street Address
    {
        Boolean SA_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('/^[a-zA-Z]+$/');
        
        Matcher MyMatcher = LastNamePattern.matcher(SA);
        
        SA_Valid = MyMatcher.matches();
        
        return SA_Valid;
    }
    
    public static Boolean AptNumberValidator(String AptNumber)
    {
        Boolean AptNumber_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('/^[a-zA-Z]+$/');
        
        Matcher MyMatcher = LastNamePattern.matcher(AptNumber);
        
        AptNumber_Valid = MyMatcher.matches();
        
        return AptNumber_Valid;
    }
    
    
       
}