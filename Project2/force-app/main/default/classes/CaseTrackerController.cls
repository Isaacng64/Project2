public class CaseTrackerController {
    @AuraEnabled
    public static List<String> searchForIds(String searchText) {
    List<List<SObject>> results = [FIND :searchText IN ALL FIELDS  RETURNING Case(Id), Contact(Id), Lead(Id)];
    List<String> ids = new List<String>();
    for (List<SObject> sobjs : results) {
      for (SObject sobj : sobjs) {
        ids.add(sobj.Id);
      }
    }
    return ids;
}
}