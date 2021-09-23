public class CaseExtension {

    public Case newCase {get; set;}
    
    public CaseExtension(ApexPages.StandardController controller){
        newCase = (Case)controller.getRecord();
    }
    
    public static PageReference checkUser(){
        Id currentUser = ApexPages.currentPage().getparameters().get('id');
        if(currentUser == null){
			PageReference homePage = new PageReference('https://bossbidet-developer-edition.na163.force.com/s/');
            homePage.setRedirect(true);
            return homePage;
        }
        return ApexPages.currentPage();
    }
    
    public PageReference save(){
        Insert newCase;
        PageReference p = ApexPages.currentPage();
        newCase = new Case();
        return p;
    }
}