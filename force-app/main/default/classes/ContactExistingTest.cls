@isTest
public class ContactExistingTest 
{
    @testSetup
    public static void SetupTest()
    {
     	List<Account> Contact_to_Account = new List<Account>();
    	for (Integer i = 0; i < 151; i++)
   		{
        	Contact_to_Account.add(new Account(name = 'Test Account' + i));
    	}
    
    	Insert Contact_to_Account;   
    }
    
    @isTest
    public static void TP_ContactExister()
    {
        Test.startTest();
        
        List<Account> CheckingContact = ContactExisting_TestHelper.CheckingTheContacts(16);
        ContactExisting.ContactExister(CheckingContact);
        
        Integer Check = 0;
        
        for(Account ContactValidator : CheckingContact)
        {
            if(ContactValidator.name != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(3, Check);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_ContactExister()
    {
        Test.startTest();
        
        List<Account> CheckingContact = [Select name FROM Account];
        ContactExisting.ContactExister(CheckingContact);
        
        Integer Check = 0;
        
        for(Account ContactValidator : CheckingContact)
        {
            if(ContactValidator.name != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(0, Check);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TS_ContactExister()
    {
        Test.startTest();
        
        List<Account> CheckingContact = ContactExisting_TestHelper.CheckingTheContacts(1);
        ContactExisting.ContactExister(CheckingContact);
        
        Integer Check = 0;
        
        for(Account ContactValidator : CheckingContact)
        {
            if(ContactValidator.name != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(1, Check);

        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_ContactExister()
    {
        Test.startTest();
        
        List<Account> CheckingContact = ContactExisting_TestHelper.CheckingTheContacts(16);
        ContactExisting.ContactExister(CheckingContact);
        
        Integer Check = 0;
        
        for(Account ContactValidator : CheckingContact)
        {
            if(ContactValidator.name != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(2, Check);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TP_Is_Existing()
    {
        Test.startTest();
        
        Account testAccountChecking = ContactExisting_TestHelper.CheckingTheContacts(1)[0];
        Boolean result = ContactExisting.Is_Existing(testAccountChecking);
        
        System.assertEquals(true, result);
        
        testAccountChecking.name = null;
        result = ContactExisting.Is_Existing(testAccountChecking);
        
        System.assertEquals(false, result);
        
        Test.stopTest();
    }
}