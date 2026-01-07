public with sharing class AccountTriggerHandler extends TriggerHandler {
    
    public override void afterInsert(){
        system.enqueueJob(new SupabaseQueueable(Trigger.newMap.keySet()));
    }
}