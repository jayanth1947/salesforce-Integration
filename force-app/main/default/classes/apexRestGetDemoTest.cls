@isTest
public with sharing class apexRestGetDemoTest {
    public static testMethod void getAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId;

        RestRequest request =new RestRequest();
        request.requestURI=url;
        request.httpMethod='GET';

        RestContext.request=request;

        Test.startTest();
        apexRestGetDemo.AccountWrapper wrapper= apexRestGetDemo.accountInformation();
        System.assertNotEquals(null,wrapper);
        Test.stopTest();

    }

    public static testMethod void updateAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId;

        RestRequest request =new RestRequest();
        request.requestURI=url;
        request.httpMethod='PATCH';

        RestContext.request=request;

        Test.startTest();
        apexRestGetDemo.patchAccount('Cold','ACC2023','This is a Test Description');
        Test.stopTest();

    }

    public static testMethod void deleteAccountTest(){

        String recordId=createTestRecord(); //Id is stored in the variable
        
        String url='/service/apexrest/v1/Account/'+recordId;

        RestRequest request =new RestRequest();
        request.requestURI=url;
        request.httpMethod='DELETE';

        RestContext.request=request;

        Test.startTest();
        apexRestGetDemo.deleteAccount();
        
        Test.stopTest();

    }

    

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