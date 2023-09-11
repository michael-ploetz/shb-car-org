trigger CarTrigger on Car__c (after insert) {

    if(Trigger.isAfter && Trigger.isInsert) {
        afterInsert(Trigger.new);
    }

    // Trigger handler for after insert event
    public static void afterInsertHandler(List<Car__c> newCars) {
        Set<Id> carIds = new Set<Id>();
        for (Car__c car : newCars) {
            carIds.add(car.Id);
        }

        CarApi.sendPostRequest(carIds);
    }

    // Trigger event
    public static void afterInsert(List<Car__c> newCars) {
        System.debug('after insert');
        afterInsertHandler(newCars);
    }
}
