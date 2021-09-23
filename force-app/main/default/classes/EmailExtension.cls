public without sharing class EmailExtension {
    Contact newCon;
    public EmailExtension(ApexPages.StandardController con) {
          this.newCon = (Contact)con.getRecord();
    }
    public pagereference save(){
      Account a = New Account(Name = newCon.FirstName + ' ' + newCon.LastName);
      Insert a;
      newCon.AccountID = a.id;
      insert newCon;
      Pagereference pr = New PageReference('/' + a.id);
      return pr;
   }
}