public with sharing class CarTriggerHandler {

    public static void afterInsert (List<Car__c> newCars) {
        Set<Id> carIds = new Set<Id>();
        for (Car__c car : newCars) {
            carIds.add(car.Id);
        }

        CarApi.sendPostRequest(carIds);
    }

}