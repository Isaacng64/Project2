@isTest
public class ContactExisting_TestHelper 
{
	public static void TestContactExisting(Integer TestContacts)
    {
        List<Account> TestExisting = new List<Account>();
        
        for (Integer i = 0; i < TestContacts; i++)
        {
            TestExisting.add(new Account(name = 'Check Contacts' + i));
        }
        
        Insert TestExisting;
    }
    
    public static List<Account> CheckingTheContacts(Integer ContactCheck)
    {
        List<Account> ReturnContact = new List<Account>();
        
        for(Integer i = 0; i < ContactCheck; i++)
        {
            ReturnContact.add(new Account(name = 'Contacts'+ i));
        }
        
        return ReturnContact;
    }
}