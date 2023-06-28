global with sharing class openCageDemo {
    
    @future(callout=true)
    public static void forwardGeoCoding(Id recordId){

        // Storing the key and endpoint in the variables
        String endPoint=System.Label.OpenCageEndPoint;
        String openKey=System.Label.OpenCageKey;

        // Declare an Error message 
        String errorMessage='';

        // Account data is stored in this variable
        Account acc=[SELECT Id,Name,Location__Longitude__s,Location__Latitude__s, ShippingStreet,ShippingCity,ShippingState,ShippingCountry,ShippingPostalCode FROM Account where Id =:recordId];

        //Storing the data in the address variable
        String address=acc.ShippingStreet+', '+acc.ShippingCity+', '+acc.ShippingState+','+acc.ShippingCountry+','+acc.ShippingPostalCode;

        //Encoded the string in UTF format
        String encodedString=EncodingUtil.urlEncode(address, 'UTF-8');

        // Final Endpoint url dynamically
        String finalEndPoint =endPoint+'q='+encodedString+'&key=' + openKey +'&pretty=1&limit=1';

        // Creating a neww Http instance for request and response
        Http http=new Http();
        HttpRequest httpReq=new HttpRequest();
        httpReq.setMethod('GET'); //Method for performing action
        httpReq.setEndpoint(finalEndPoint); //setting the endpoint
        httpReq.setHeader('Content-Type','application/json'); //Passing the headers as JSON 
        HttpResponse response=new HttpResponse(); //Responsible for storing the response

        try {
            response=http.send(httpReq); //Sending the request

            // Checking the status Code has success code
            if(response.getStatuscode()==200){
                String body=response.getBody(); //response is stored in the body

                //System.debug(System.LoggingLevel.DEBUG, 'body' +body); //Displaying the body  

                // Here in the openCageResultHandler will have the methods that we need to access and we are deserializing the data
                openCageResultHandler openCageData=(openCageResultHandler)System.JSON.deserialize(body,openCageResultHandler.class);

                //Here the result data is stored in the list format
                List<openCageResultHandler.results> results =openCageData.results;

                // Checking whether the result has some data or not
                if(results!=null && results.size()>0){

                    // Here we are accessing the first record
                    openCageResultHandler.results result=results.get(0);

                    // Here we are assigning the latitude and logitute
                    acc.Location__Latitude__s=result.geometry.lat;
                    acc.Location__Longitude__s=result.geometry.lng;

                    //Update the account after assigning the locations
                    update acc;

                    //Here we are displaying the data 
                    System.debug(System.LoggingLevel.DEBUG, 'result' +result); 
                }
            }

            // Whether any error will come and we will get the error message
            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
            }

            
        } catch (System.Exception e) {
            
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage='Unauthorize endpoint an Administrator must go to setup -> '+
                 'Remote Site Settings and add ' + ' '+ endpoint +'Endpoint';
            }

            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
            }

            System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
        }
    }

    public static void reverseGeoCoding(){

    }
}