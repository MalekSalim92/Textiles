public with sharing class AccountSelector {

    private static final AccountSelector INSTANCE = new AccountSelector();
    private AccountSelector() {}
    public static AccountSelector getInstance(){
        return INSTANCE;
    }


    public List<Account> selectById(Set<Id> accountIds){
        return [SELECT Id,Name FROM Account WHERE Id IN :accountIds];
    }   
}