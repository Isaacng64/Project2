@isTest
public class CaseExtensionTest {
    
    @isTest
    public static void TP_InsertNewCase(){
        Case testCase = new Case();
        ApexPages.StandardController sc = new ApexPages.StandardController(testCase);
        CaseExtension extension = new CaseExtension(sc);
        
        Test.startTest();
        PageReference page = Page.CasePage;
        Test.setCurrentPage(page);
        extension.save();
        Test.stopTest();
    }
    
    @isTest
    public static void TP_CheckUser(){
        Test.startTest();
        PageReference page = new PageReference('https://bossbidet-developer-edition.na163.force.com/s/');
        System.assertEquals(page, CaseExtension.checkUser());
        Test.stopTest();
    }
    
}