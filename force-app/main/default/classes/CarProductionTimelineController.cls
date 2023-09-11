public with sharing class CarProductionTimelineController {

    @AuraEnabled
    public static Map<String, Object> getCarById (String carId) {
        return CarApi.getCarById(carId);
    }
}