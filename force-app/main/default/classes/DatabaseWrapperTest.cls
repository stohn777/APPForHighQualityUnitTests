@IsTest
private class DatabaseWrapperTest
{
    @IsTest
    private static void test_with_actual_dml()
    {
        Contact ctc = new Contact(
            LastName = 'Potter',
            Description='fldsjflkjsldf'
        );
        List<Contact> contactList = new List<Contact> {ctc};

        DatabaseWrapper.newInstance().db_insert(contactList);

        System.assert(ctc.Id != null);

        ctc.Description = 'hello';

        DatabaseWrapper.newInstance().db_update(contactList);

        System.assertEquals('hello', ctc.Description);
    }

    @IsTest
    private static void test_with_mock()
    {
        Contact ctc = new Contact(
            LastName = 'Potter',
            Description='fldsjflkjsldf'
        );
        List<Contact> contactList = new List<Contact> {ctc};

        DatabaseWrapper.setMock(new DatabaseWrapperMock());

        DatabaseWrapper.newInstance().db_insert(contactList);

        System.assert(ctc.Id == null);
    }
}
