@istest
public class EmailExtensionTest {

    @isTest
    public static void TP_insertContacts() {
        Test.startTest();
        	Contact newCon = new Contact(FirstName = 'Test', LastName = 'Contact');
        	ApexPages.StandardController sc = new ApexPages.StandardController(newCon);
        	EmailExtension ext = new EmailExtension(sc);
			PageReference pageRef = Page.EmailSubscription;
        	Test.setCurrentPage(pageRef);
        	ext.save();
        Test.stopTest();
    }
    
    @isTest
    public static void TRU_insertContacts() {
        User admin = [SELECT name FROM User WHERE Profile.name = 'System Administrator' LIMIT 1];
        Test.startTest();
        System.runAs(admin) {
        	Contact newCon = new Contact(FirstName = 'Test', LastName = 'Contact');
        	ApexPages.StandardController sc = new ApexPages.StandardController(newCon);
        	EmailExtension ext = new EmailExtension(sc);
			PageReference pageRef = Page.EmailSubscription;
        	Test.setCurrentPage(pageRef);
        	ext.save();
        }
        Test.stopTest();
    }
}