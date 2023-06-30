global with sharing class freshDeskDemo {

    public static Final STRING TICKET_ENDPOINT='https://cognizanttechnologysolutions.freshdesk.com/api/v2/tickets';
    public static Final STRING CONTACT_ENDPOINT='https://cognizanttechnologysolutions.freshdesk.com/api/v2/contacts';

        //This method is used for creating a contact with the required parameters
        public static void createContact(String name,String email,String phone,String mobile){
    
    
            // Declare an Error message 
            String errorMessage='';

            String endPoint=CONTACT_ENDPOINT;

            String requestBody='{'+
            {
                '"name": "'+name+'"',
                '"email": "'+email+'"',
                '"phone":"'+phone+'"',
                '"mobile":"'+mobile+'"'
            }
                                '}';
    
            // Creating a neww Http instance for request and response
            Http http=new Http();
            HttpRequest httpReq=new HttpRequest();
            httpReq.setMethod('POST'); //Method for performing action
            httpReq.setEndpoint(endPoint); //setting the endpoint
            httpReq.setHeader('Content-Type','application/json'); //Passing the headers as JSON 
            HttpResponse response=new HttpResponse(); //Responsible for storing the response
    
            try {
                response=http.send(httpReq); //Sending the request

            // Checking the status Code has success code
            if(response.getStatuscode()==200){
                String body=response.getBody(); //response is stored in the body
                System.debug(System.LoggingLevel.DEBUG, 'body' +body);
    
            }
            
            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
            }


            catch (System.Exception e) {
    
                if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                    errorMessage='Unauthorize endpoint an Administrator must go to setup -> '+
                     'Remote Site Settings and add ' + ' '+ endpoint +'Endpoint';
                }
    
                else {
                    errorMessage ='Unexpected Error While communicating with the openCage API'
                    + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                    System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
                }
    
                
            }
        }
    
        public static void reverseGeoCoding(){
    
        }
    }
