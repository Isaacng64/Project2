@isTest
public class Contact_Email_Existing_TestHelper 
{
    public static void EmailCheck(Integer CheckEmail)
    {
        List<Contact> CheckingEmail = new List<Contact>();
        
        for(Integer i = 0; i < CheckEmail; i++)
        {
            CheckingEmail.add(new Contact(email = 'EmailNeeded@email.com' + i));
        }
        
        Insert CheckingEmail;
    }
    
    public static List<Contact> EmailChecker(Integer CheckEmail)
    {
        List<Contact> ReturnEmail = new List<Contact>();
        
        for(Integer i = 0; i < CheckEmail; i++)
        {
            ReturnEmail.add(new Contact(email = 'EmailNeeded@email.com' + i));
        }
        
        return ReturnEmail;
    }
}