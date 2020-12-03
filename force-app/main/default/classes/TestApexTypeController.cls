@isTest
public with sharing class TestApexTypeController {
    @isTest
    static void checkApexTypes() {
        User adminUser = [SELECT Id, Username, Name FROM User where username='sudheer.sfdc2904@gmail.com'];
        CustomWrapper wrapper = new CustomWrapper();
        wrapper.someInteger = 33;
        wrapper.someString = 'someMockString';
        wrapper.someList = new List<CustomWrapper.InnerWrapper>();

        System.runAs(adminUser){
            Test.startTest();
            String result = ApexTypesController.checkApexTypes(wrapper);
            Test.stopTest();
        }

        System.assertEquals(
            'You entered "someMockString" as String, and "33" as Integer value. The list contained 0 items.',
            result,
            'checkApexTypes doesn\'t return the expected string'
        );
    }
}
