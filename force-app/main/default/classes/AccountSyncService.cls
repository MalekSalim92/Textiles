public with sharing class AccountSyncService {

    public static void insertAccountsToSalesforce(){
        List<SupabaseClient.SupabaseWrapper> supabaseAccounts = SupabaseClient.getRecords(ConstantsService.INTEGRATION.TABLE_MAPPING.CLIENT);
        List<Account> accounts = buildAccounts(supabaseAccounts);
        upsert accounts Integration_Id__c;
    }

    private static List<Account> buildAccounts(List<SupabaseClient.SupabaseWrapper> supabaseAccounts){
        List<Account> accounts = new List<Account>();
        for(SupabaseClient.SupabaseWrapper supabaseAccount : supabaseAccounts){
            accounts.add(new Account(
                Name = supabaseAccount.name,
                Integration_Id__c = 'SUPA-' + supabaseAccount.Id
            ));
        }
        return accounts;
    }
    
    public static void insertAccountsToSupabase(List<Account> accountsToInsert){
        SupabaseClient.postRecords(accountsToInsert, ConstantsService.INTEGRATION.TABLE_MAPPING.CLIENT);
    }
    
}