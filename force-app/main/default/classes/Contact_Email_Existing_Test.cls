@isTest
public class Contact_Email_Existing_Test 
{
	@testSetup
    public static void SetupTest()
    {
        List<Contact> CheckingEmail = new List<Contact>();
        
        for (Integer i = 0; i < 151; i++)
        {
            CheckingEmail.add(new Contact(email = 'a@d.com', LastName = 'Default Test', Account__c = '0015e00000KoBxnAAF'));
        }
        
        Insert CheckingEmail;
    }
    
    @isTest
    public static void TP_Contact_Email_Exister()
    {
        Test.startTest();
        
        List<Contact> Email_Check = Contact_Email_Existing_TestHelper.EmailChecker(10);
        Contact_Email_Existing.Contact_Email_Exister(Email_Check);
        
        Integer Check = 0;
        
        for(Contact EmailValidator : Email_Check)
        {
            if(EmailValidator.email != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(10, Check);
        
        //Contact emailCheck = Contact_Email_Existing_TestHelper.CheckTheEmail(1)[0];
        
        
        
        Test.stopTest();
    }
    
    @isTest
    public static void TN_Contact_Email_Exister()
    {
        Test.startTest();
        
        List<Contact> Email_Check = new List<Contact>();
        Contact_Email_Existing.Contact_Email_Exister(Email_Check);

		Integer Check = 0;
		
		for(Contact EmailValidator : Email_Check)
        {
            if(EmailValidator.email != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(0, Check);      
        
        Test.stopTest();
    }
    
    @isTest
    public static void TS_Contact_Email_Exister()
    {
        Test.startTest();
        
        List<Contact> Email_Check = Contact_Email_Existing_TestHelper.EmailChecker(1);
        Contact_Email_Existing.Contact_Email_Exister(Email_Check);
        
        Integer Check = 0;
        
        for(Contact EmailValidator : Email_Check)
        {
            if(EmailValidator.email != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(1, Check);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_Contact_Email_Exister()
    {
        Test.startTest();
        
        List<Contact> Email_Check = Contact_Email_Existing_TestHelper.EmailChecker(151);
        Contact_Email_Existing.Contact_Email_Exister(Email_Check);
        
        Integer Check = 0;
        
        for(Contact EmailValidator : Email_Check)
        {
            if(EmailValidator.email != null)
            {
                Check++;
            }
        }
        
        System.assertEquals(151, Check);
        
        Test.stopTest();
    }
    
    @isTest
    public static void TP_Is_Email_Existing()
    {
        Test.startTest();
        
        Contact Check_The_Email = Contact_Email_Existing_TestHelper.EmailChecker(1)[0];
        Boolean Checking = Contact_Email_Existing.Is_Email_Existing(Check_The_Email);
        
        System.assertEquals(true, Checking);
        
        /*
        Check_The_Email = null;
        Checking =Contact_Email_Existing.Is_Email_Existing(Check_The_Email);
        
        System.assertEquals(false, Checking);
		*/
        
        Test.stopTest();
    }
    
        @isTest
    public static void TN_Is_Email_Existing()
    {
        Test.startTest();
        
        /*Contact Check_The_Email = Contact_Email_Existing_TestHelper.EmailChecker(1)[0];
        Boolean Checking = Contact_Email_Existing.Is_Email_Existing(Check_The_Email);
        
        System.assertEquals(true, Checking);*/
        
        
        Contact Check_The_Email = new Contact();
        Boolean Checking =Contact_Email_Existing.Is_Email_Existing(Check_The_Email);
        
        
        System.assertEquals(false, Checking);
		        
        Test.stopTest();
    }
}