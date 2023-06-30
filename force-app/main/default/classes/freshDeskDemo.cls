global with sharing class freshDeskDemo {

    // Endpoints for ticket and contact
    public static Final STRING TICKET_ENDPOINT='https://cognizanttechnologysolutions.freshdesk.com/api/v2/tickets';
    public static Final STRING CONTACT_ENDPOINT='https://cognizanttechnologysolutions.freshdesk.com/api/v2/contacts';

        //This method is used for creating a contact with the required parameters
        public static void createContact(String name,String email,String phone,String mobile){
    
    
            // Declare an Error message 
            String errorMessage='';

            //Here the endpoint is assigned for contact creation
            String endPoint=CONTACT_ENDPOINT;

            // We are assigning the customLabel of freshdesk for authentication purpose
            String credential=System.Label.FreshDeskKey; //base64 encoded

            //Here the request body is assigned dynamically
            String requestBody='{'+
                '"name": "'+name+'",'+
                '"email": "'+email+'",'+
                '"phone":"'+phone+'",'+
                '"mobile":"'+mobile+'"'+
                                '}';
    
            // Creating a neww Http instance for request and response
            Http http=new Http();
            HttpRequest httpReq=new HttpRequest();
            httpReq.setMethod('POST'); //Method for performing action

            // Here we are setting the authentication as basic and also encode for base64
            // base64Encode(inputBlob) - Converts a Blob to an unencoded String representing its normal form.
            httpReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(credential)));
            httpReq.setEndpoint(endPoint); //setting the endpoint 
            httpReq.setBody(requestBody);
            httpReq.setHeader('Content-Type','application/json'); //Passing the headers as JSON 
            HttpResponse response=new HttpResponse(); //Responsible for storing the response
    
            try {
                response=http.send(httpReq); //Sending the request
                // Checking the status Code has success code
                if(response.getStatuscode()==201){
                    String responseBody=response.getBody(); //response is stored in the body
                    System.debug(System.LoggingLevel.DEBUG, 'body' +responseBody);
        
                }
            
            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
            }

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

        // This method is used for creating a ticket and it has the required parameters
        public static void createTicket(String sub,String email,String description,Integer priority,Integer status,Integer source){
    
    
            // Declare an Error message 
            String errorMessage='';

            //Here the endpoint is assigned for contact creation
            String endPoint=TICKET_ENDPOINT;

            // We are assigning the customLabel of freshdesk for authentication purpose
            String credential=System.Label.FreshDeskKey; //base64 encoded

            //Here the request body is assigned dynamically
            String requestBody='{'+
                '"subject": "'+sub+'",'+
                '"email":"'+email+'",'+
                '"description": "'+description+'",'+
                '"priority":'+priority+','+
                '"status":'+status+','+
                '"source":'+source+
                                '}';
    
            // Creating a neww Http instance for request and response
            Http http=new Http();
            HttpRequest httpReq=new HttpRequest();
            httpReq.setMethod('POST'); //Method for performing action

            // Here we are setting the authentication as basic and also encode for base64
            // base64Encode(inputBlob) - Converts a Blob to an unencoded String representing its normal form.
            httpReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(credential)));
            httpReq.setEndpoint(endPoint); //setting the endpoint
            httpReq.setBody(requestBody);
            httpReq.setHeader('Content-Type','application/json'); //Passing the headers as JSON 
            HttpResponse response=new HttpResponse(); //Responsible for storing the response
    
            try {
                response=http.send(httpReq); //Sending the request
                // Checking the status Code has success code
                if(response.getStatuscode()==201){
                    String responseBody=response.getBody(); //response is stored in the body
                    System.debug(System.LoggingLevel.DEBUG, 'body' +responseBody);
        
                }
            
            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
            }

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


        // This method will return the contact records
        public static void getContacts(){
            // Declare an Error message 
            String errorMessage='';

            //Here the endpoint is assigned for contact creation
            String endPoint=CONTACT_ENDPOINT;

            // We are assigning the customLabel of freshdesk for authentication purpose
            String credential=System.Label.FreshDeskKey; //base64 encoded
    
            // Creating a neww Http instance for request and response
            Http http=new Http();
            HttpRequest httpReq=new HttpRequest();
            httpReq.setMethod('GET'); //Method for performing action
            httpReq.setEndpoint(endPoint); //setting the endpoint

            // Here we are setting the authentication as basic and also encode for base64
            // base64Encode(inputBlob) - Converts a Blob to an unencoded String representing its normal form.
            httpReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(credential)));
            httpReq.setHeader('Content-Type','application/json'); //Passing the headers as JSON 
            HttpResponse response=new HttpResponse(); //Responsible for storing the response
    
            try {
                response=http.send(httpReq); //Sending the request
                // Checking the status Code has success code
                if(response.getStatuscode()==200){
                    String responseBody=response.getBody(); //response is stored in the body
                    System.debug(System.LoggingLevel.DEBUG, 'body' +responseBody);
                    //List<freshDeskResult> contacts=(List<freshDeskResult>)System.JSON.deserialize(responseBody,List<freshDeskResult>.class);
                    
        
                }
            
            else {
                errorMessage ='Unexpected Error While communicating with the openCage API'
                + 'Status' + response.getStatus()+ 'and status Code' + response.getStatuscode();
                System.debug(System.LoggingLevel.DEBUG,'Exception Executed' + errorMessage);
            }

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

    
    }


