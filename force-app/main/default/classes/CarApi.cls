public class CarApi {

    private static final String CAR_API_ENDPOINT = 'https://shb-api-challenge-0284e20e1a72.herokuapp.com';
    private static final String ROUTE_POST_CARS = '/cars';
    private static final String ROUTE_GET_CAR = '/cars/';

    @Future(Callout=true)
    public static void sendPostRequest(Set<Id> carIds) {
        // Create a list of Car__c records to process
        List<Car__c> cars = [SELECT Id FROM Car__c WHERE Id IN :carIds];

        // Iterate through the Car__c records and send a POST request for each
        for (Car__c car : cars) {
            HttpRequest request = new HttpRequest();
            request.setEndpoint(CAR_API_ENDPOINT + ROUTE_POST_CARS);
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');
            String requestBody = '{"sfId":"' + car.Id + '"}';
            request.setBody(requestBody);

            Http http = new Http();
            HttpResponse response = http.send(request);

            // Handle the response as needed
            if (response.getStatusCode() == 200) {
                System.debug(response.getBody());
            } else {
                System.debug(response.getBody());
            }
        }
    }

    // Method to retrieve a specific car by sfId
    public static Map<String, Object> getCarById(String sfId) {
        // Construct the full URL for the GET request
        String endpoint = CAR_API_ENDPOINT + ROUTE_GET_CAR + sfId;

        // Create an HTTP request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        // Send the request and get the response
        HttpResponse response = http.send(request);

        // Parse the response JSON
        if (response.getStatusCode() == 200) {
            // Successful response
            Map<String, Object> car = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            return car;
        } else {
            // Handle errors or return null if the car is not found
            return null;
        }
    }
}