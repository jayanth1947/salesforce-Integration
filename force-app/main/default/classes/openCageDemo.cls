global with sharing class openCageDemo {
    
    public static void forwardGeoCoding(){

        // Storing the key and endpoint in the variables
        String endPoint=System.Label.OpenCageEndPoint;
        String openKey=System.Label.OpenCageKey;

        // Declare an Error message 
        String errorMessage='';

        // Final Endpoint url dynamically
        String finalEndPoint =endPoint+ 'q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key=' + openKey +'&pretty=1';
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
                System.debug(System.LoggingLevel.DEBUG, 'body' +body); //Displaying the body  
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