@RESTResource(urlMapping='/v1/Account/*')
global with sharing class apexRestGetDemo {

    // This is the post method and it is used for the updated information
    @httpPost

    // Here we are declaring the paramters that is passed in the method
    global static Account  postAccount(String accName, String accNumber, String description, String industry){

        // Creating a new Account Record and insert into the database
        Account accountRecord=new Account(Name = accName, AccountNumber=accNumber, Description=description,Industry=industry);

        insert accountRecord;

        // Returning the account record
        return accountRecord;
    }
    // Here the get method is used for getting the record data
    @httpGet
    global static AccountWrapper accountInformation(){

        // Here request is raised
        RestRequest req=RestContext.request;
        String requestURI=req.requestURI; //URI is a urlMapping in the RestResource line
        String accountId=requestURI.subStringAfterLast('/');	//It will get the Id 

        // For Account Object
        List<Account> accountList=[SELECT Id,Name,Rating,Industry from Account where Id=:accountId];
        
        // For Contact Object
        List<Contact> contactList=[SELECT Id,firstName,lastName,Email,Phone FROM Contact where AccountId=:accountId];
        
        // New AccountWrapper instance is created
        AccountWrapper wrapper=new AccountWrapper();

        // Here If the account list is not empty it will get the records
        if(!accountList.isEmpty()){
            wrapper.accountRecord=accountList.get(0);
            wrapper.contactList=contactList;

        }
        return wrapper;
    }

    // Wrapper class for account and contact object
    global class AccountWrapper{
        global Account accountRecord;
        global  List<Contact> contactList; 
    }
}