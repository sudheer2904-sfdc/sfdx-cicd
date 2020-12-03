@isTest
public with sharing class TestContactController {
    public static User adminUser = [SELECT Id, Username, Name FROM User where username='sudheer.sfdc2904@gmail.com'];
    public static void createContacts(Integer amount) {
        List<Contact> contacts = new List<Contact>();

        for (Integer i = 1; i <= amount; i++) {
            contacts.add(
                new Contact(
                    FirstName = 'First ' + i,
                    LastName = 'Last ' + i,
                    Picture__c = 'test'
                )
            );
        }

        System.runAs(adminUser){
            insert contacts;
        }
    }

    @isTest
    static void getContactList() {
        TestContactController.createContacts(10);

        System.runAs(adminUser){
            Test.startTest();
            List<Contact> conts = ContactController.getContactList();
            Test.stopTest();
        }

        System.assertEquals(
            10,
            conts.size(),
            'The contact list size should be 10'
        );
    }

    @isTest
    static void findContacts() {
        TestContactController.createContacts(10);

        System.runAs(adminUser){
        Test.startTest();
        List<Contact> conts = ContactController.findContacts('Last');
        Test.stopTest();
        }

        System.assertEquals(
            10,
            conts.size(),
            'The contacts retrieved by search should be 10'
        );
    }

    @isTest
    static void getSingleContact() {
        TestContactController.createContacts(1);

        System.runAs(adminUser){
        Test.startTest();
        Contact cont = ContactController.getSingleContact();
        Test.stopTest();
        }
        System.assertEquals(
            'First 1 Last 1',
            cont.Name,
            'The contact name should be: First 1 Last 1'
        );
    }
}
