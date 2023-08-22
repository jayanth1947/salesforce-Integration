@isTest
public with sharing class copadoDemoTestClass {
    
    @isTest
    public static void testAccount(){
        List<Account> testAcc = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            testAcc.add(new Account(Name='Test Account' + i));
            
        }
        insert testAcc;
    }
}