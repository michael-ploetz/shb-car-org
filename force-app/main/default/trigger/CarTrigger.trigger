trigger CarTrigger on Car__c (after insert) {

    if(Trigger.isAfter && Trigger.isInsert) {
        CarTriggerHandler.afterInsert(Trigger.new);
    }

}
