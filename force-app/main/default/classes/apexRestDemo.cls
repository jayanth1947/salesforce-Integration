/*This is used for defining the apex rest
- urlMapping is used for the endpoint url
- After * we can put what ever we want 
- REST Service URL : Base URL/services/apexrest/v1/welcome/
  Example- https://empathetic-goat-jgrtil-dev-ed.lightning.force.com/services/apexrest/v1/welcome
*/
@RestResource(urlMapping='/v1/welcome/*')

/*global is used for accessing this class in another orgs as well */
global with sharing class apexRestDemo {

    // Here we are defining a string that is static in the entire program
    global final static String welcomeMessage='Hi There! It is a good day';

    // This method is used for getting the message from the variable that we defined
    @httpGet
    global static String message(){
        return welcomeMessage;
    }
    
    @httpPost
    global static String postmessage(){
        return welcomeMessage;
    }

    @httpPatch
    global static String patchmessage(){
        return welcomeMessage +' How do you do?';
    }
    
    
}