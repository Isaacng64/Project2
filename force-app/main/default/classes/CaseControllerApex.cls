public with sharing class CaseControllerApex {
    
@AuraEnabled
public static List<Case> getCases(){
    Id myId = UserInfo.getUserId();
    System.debug('myId+++++++++++'+myId);

    List<Case> clist = [Select Id, Subject, Type, Origin, Status From Case];

    System.debug('clist++++++++++'+cList.size());
    return cList;
}

@AuraEnabled
public static Case saveCase(String caseJSON) {
    Case newCase = (Case)JSON.deserialize(caseJSON, Case.class);

    upsert newCase;
    return newCase;
}
}