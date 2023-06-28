global with sharing class openCageDemo {
    
    public static void forwardGeoCoding(){

        // Storing the key and endpoint in the variables
        String endPoint=System.Lable.OpenCageEndPoint;
        String openKey=System.Lable.OpenCageKey;

        // Declare an Error message 
        String errorMessage='';

        // Creating a neww Http instance for request and response
        Http http=new Http();
        HttpRequest httpReq=new HttpRequest();
        HttpResponse httpRes=new HttpResponse(); //Responsible for storing the response

        try {
            
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