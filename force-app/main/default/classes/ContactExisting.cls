//Purpose of this class is to check to see if the Account has an existing Contact.

public class ContactExisting 
{
    public static void ContactExister(List<Account> ContactExists)
    {
        for(Account ContactValidator : ContactExists)
        {
            if(!Is_Existing(ContactValidator))
            {
                System.debug(ContactValidator.name);
            }
            
            else
            {
             	//ContactValidator.name += ' Is Existing.';   
            }
        }
    }
    
    @testVisible private static Boolean Is_Existing(Account ContactValidator)
    {
        String name = ContactValidator.name;
        return name != null;
    }
}

/*
To execute the ContactExisting.apxc and the ContactEsistance.apxt files

List<Account> CheckContactExisting = [SELECT Name FROM Account];
ContactExisting.ContactExister(CheckContactExisting);
*/