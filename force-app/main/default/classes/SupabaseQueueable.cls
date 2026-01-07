public with sharing class SupabaseQueueable implements Queueable , Database.AllowsCallouts{
    private Set<Id> recordIds;

    public SupabaseQueueable(Set<Id> recordIds){
        this.recordIds = recordIds;
    }
    public void execute(QueueableContext qc){
        AccountSyncService.insertAccountsToSupabase(AccountSelector.getInstance().selectById(recordIds));
        
    }
}