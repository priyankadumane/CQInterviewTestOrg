trigger AccountTrigger on Account (before insert,before update) {
    if((Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
        AccountTriggerHandler.updateInfo(trigger.newMap, trigger.oldMap);
    }
}