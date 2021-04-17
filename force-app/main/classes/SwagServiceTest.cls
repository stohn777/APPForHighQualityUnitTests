@IsTest
private class SwagServiceTest
{
    @IsTest
    private static void test()
    {
        Account acct = new Account(
            Id = TestUtilities.generateMockId(Account.SObjectType),
            Description = 'default'
        );

        DatabaseWrapperMock mock = new DatabaseWrapperMock();
        ServiceFactory.setMock(IDatabaseWrapper.class, mock);

        SwagService.newInstance().sendNewAccountSwag(new List<Account> {acct});

        System.assertEquals(1, mock.inserted_sobjects.size());
        System.assertNotEquals(acct.Description, ((Order) mock.inserted_sobjects.get(0)).Description);
    }
}
