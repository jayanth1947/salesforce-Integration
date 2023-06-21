@RESTResource(urlMapping='/v1/Account/*')
global with sharing class apexRestGetDemo {

    // Here the get method is used for getting the record data
    @httpGet
    global static AccountWrapper accountInformation(){

        RestRequest req=RestContext.request;
        String requestURI=req.requestURI; //URI is a urlMapping in the RestResource line
        String accountId=requestURI.subStringAfterLast('/');	//It will get the Id 

        // For Account Object
        List<Account> accountList=[SELECT Id,Name,Rating,Industry from Account where Id=:accountId];
        
        List<Contact> contactList=[SELECT Id,firstName,lastName,Email,Phone FROM Contact where AccountId=:accountId];
        

        AccountWrapper wrapper=new AccountWrapper();

        if(!accountList.isEmpty()){
            wrapper.accountRecord=accountList.get(0);
            wrapper.contactList=contactList;

        }
        return wrapper;
    }

    global class AccountWrapper{
        global Account accountRecord;
        global  List<Contact> contactList; 
    }
}