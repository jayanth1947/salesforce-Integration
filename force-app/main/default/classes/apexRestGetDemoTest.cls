@isTest
public with sharing class apexRestGetDemoTest {

    // This method is used for GET Method
    public static testMethod void getAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId; // Preparing the url

        RestRequest request =new RestRequest(); //Here we are making a new request
        request.requestURI=url; // Assigning the URL
        request.httpMethod='GET'; //Adding the GET Method

        RestContext.request=request; //Storing the request

        Test.startTest();

        // Testing the class with the method
        apexRestGetDemo.AccountWrapper wrapper= apexRestGetDemo.accountInformation();

        // Here we will check the account should not contain any null values
        System.assertNotEquals(null,wrapper);
        Test.stopTest();

    }

    // This method is for PATCH action
    public static testMethod void updateAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId;

        RestRequest request =new RestRequest();
        request.requestURI=url;
        request.httpMethod='PATCH';

        RestContext.request=request;

        Test.startTest();

        // Here the parameters are given
        apexRestGetDemo.patchAccount('Cold','ACC2023','This is a Test Description');
        Test.stopTest();

    }

    // This method is for DELETE action
    public static testMethod void deleteAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId;

        RestRequest request =new RestRequest();
        request.requestURI=url;
        request.httpMethod='DELETE';

        RestContext.request=request;

        Test.startTest();

        //Delete method is called
        apexRestGetDemo.deleteAccount();
        
        Test.stopTest();

    }

    
    // This method will return the Id of the Account
    static Id createTestRecord(){
        //Create a new Test Account
        Account testAcc=new Account(Name ='Test Account');
        insert testAcc;

        //Create a new Test Contact
        Contact testCon=new Contact(LastName='Test', AccountId=testAcc.id);
        //Returning the Id of the account
        return testAcc.Id;
    }
}