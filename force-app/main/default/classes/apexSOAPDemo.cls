global with sharing class apexSOAPDemo {
    
    webservice static String fullName(String firstName, String lastName){
        String message='Welcome ' + firstName + ' ' +lastName;
        return message;
    }
}