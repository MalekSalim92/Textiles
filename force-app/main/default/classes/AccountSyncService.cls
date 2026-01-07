public with sharing class AccountSyncService {

  
    public static void insertSupabaseAccounts(){
        List<SupabaseClient.SupabaseWrapper> supabaseAccounts = SupabaseClient.getRecords('Client');
        List<Account> accounts = buildAccounts(supabaseAccounts);
        insert accounts;
    }

    private static List<Account> buildAccounts(List<SupabaseClient.SupabaseWrapper> supabaseAccounts){
        List<Account> accounts = new List<Account>();
        for(SupabaseClient.SupabaseWrapper supabaseAccount : supabaseAccounts){
            accounts.add(new Account(
                Name = supabaseAccount.Name
            ));
        }
        return accounts;
    }
}