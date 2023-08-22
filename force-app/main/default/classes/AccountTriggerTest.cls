@isTest
public class AccountTriggerTest {
    @isTest 
    public static void TestInsertRcords(){
        List<Account> accList = new List<Account>();
        
        for(Integer i=0;i<200;i++){
            Account accounts=new Account(Name='Test'+i,BillingState='CA');
            accList.add(accounts);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> TestAccount=[SELECT ShippingState FROM Account];
        for(Account acc:TestAccount){
            System.assertNotEquals('CA', acc.ShippingState,'Incorrect');
        }
    }
}