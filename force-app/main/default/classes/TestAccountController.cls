@isTest
public class TestAccountController {
    public static User adminUser = [SELECT Id, Username, Name FROM User where username='sudheer.sfdc2904@gmail.com'];
    public static void createAccounts(Integer amount) {
        List<Account> accounts = new List<Account>();

        for (Integer i = 1; i <= amount; i++) {
            accounts.add(new Account(Name = 'Name ' + i));
        }
        System.runAs(adminUser){
            insert accounts;
        }
    }

    @isTest
    static void getAccountList() {
        TestAccountController.createAccounts(10);

        System.runAs(adminUser){
            Test.startTest();
            List<Account> accts = AccountController.getAccountList();
            Test.stopTest();
        }

        System.assertEquals(accts.size(), 10);
    }

    @isTest
    static void getSingleAccount() {
        TestAccountController.createAccounts(1);

        System.runAs(adminUser){
            Test.startTest();
            Account acc = AccountController.getSingleAccount();
            Test.stopTest();
        }

        System.assertEquals(acc.Name, 'Name 1');
    }
}
