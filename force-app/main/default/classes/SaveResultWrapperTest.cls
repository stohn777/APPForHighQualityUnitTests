@IsTest
private class SaveResultWrapperTest
{
    @IsTest
    private static void test()
    {
        ID test_id = TestUtilities.generateMockId(Account.SObjectType);
        SaveResultWrapper srw = SaveResultWrapper.create(test_id, true);
        System.assertEquals(true, srw.getErrors().isEmpty());
        System.assertEquals(test_id, srw.getID());
        System.assertEquals(true, srw.isSuccess());
    }
}
