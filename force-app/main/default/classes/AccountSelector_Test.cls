@isTest
public with sharing class AccountSelector_Test {
    private static final Integer count = 200;
    @TestSetup
    static void makeData(){
     TestDataFactory.account().withName('Inserted Account').count(count).save().build();
     TestDataFactory.account().withName('Not Inserted Account').count(count).build();
    }

    @isTest
    static void selectByIds_Test(){
        Map<Id,Account> accountById = new Map<Id,Account>([SELECT Id FROM Account]);
        Set<Id> accountIds = accountById.keySet();
        Test.startTest();
        List<Account> returnedAccounts = AccountSelector.getInstance().selectById(accountById.keySet());
        Test.stopTest();

        System.assertEquals(returnedAccounts.size(), count);
        for(Account account : returnedAccounts){
            Assert.isTrue(accountIds.contains(account.Id));
        }
    }
    }