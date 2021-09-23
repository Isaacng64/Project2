//The purpose of this class is to check to see if the email exist in Contacts

public class Contact_Email_Existing 
{
    public static void Contact_Email_Exister(List<Contact> Contact_Email_Exists)
    {
        for(Contact EmailValidator : Contact_Email_Exists)
        {
            if(!Is_Email_Existing(EmailValidator))
            {
                EmailValidator.email = ' EmailNeeded@email.com';
            }
           
        }
    }
    
    @testVisible private static Boolean Is_Email_Existing(Contact EmailValidator)
    {
        String email = EmailValidator.email;
        if(email == null)
        {
            return false;
        }
        return email == '';
    }
}


/*

To execute the Contact_Email_Existing.apxc and the Contact_Email_Existance.apxt files

List<Contact> CheckEmailExisting = [SELECT Email FROM Contact];
Contact_Email_Existing.Contact_Email_Exister(CheckEmailExisting);
*/