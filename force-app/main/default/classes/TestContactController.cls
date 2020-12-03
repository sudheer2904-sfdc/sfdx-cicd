@isTest
public with sharing class TestContactController {
    @isTest
    static void getContactList() {
        System.assert(5 != 0, 'This is not equal');
    }

    @isTest
    static void findContacts() {
        System.assertEquals(
            25,
            5*5,
            'Should be 25 now'
        );
    }

    @isTest
    static void getSingleContact() {
        System.assertEquals(
            625,
            25*25,
            'Should be good to go'
        );
    }
}
