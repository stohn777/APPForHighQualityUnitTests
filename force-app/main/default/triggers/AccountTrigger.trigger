trigger AccountTrigger on Account (after insert)
{
    AccountService.newInstance().triggerHandler_afterInsert(Trigger.new);
}