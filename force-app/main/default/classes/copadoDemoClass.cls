public with sharing class copadoDemoClass {
    public static void getAccounts() {
         List<Account> acc=[SELECT Id,Name FROM Account];
        for (Account acList : acc) {

            System.debug('Account Details '+ acList);
        }
    }
}