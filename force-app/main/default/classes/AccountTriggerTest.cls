@IsTest
private class AccountTriggerTest
{
    @IsTest
    private static void test()
    {
        AccountService.setMock(new MockAccountService());
    
        Account acct = new Account(Name='lsjlfjlksjd');

        Test.startTest();
        insert acct;
        Test.stopTest();
    }

    private class MockAccountService
        implements IAccountService
    {
        public void createOrderForNewAccountSwag(List<Account> accountList)
        {
            // Intentionally blank
        }

        public void sendEmailToAccountsManager(List<Account> accountList)
        {
            // Intentionally blank
        }

        public void triggerHandler_afterInsert(List<Account> newAccountList)
        {
            // Intentionally blank
        }
    }
}
