@IsTest
public class TestUtilities
{
    private static Integer mock_id_counter = 0;

    public static ID generateMockId(SObjectType t)
    {
		String sobjectTypePrefix = t.getDescribe().getKeyPrefix();
		String fakeIdPrefix = '000000000000'.substring(0, 12 - String.valueOf(mock_id_counter).length());
		return Id.valueOf(sobjectTypePrefix + fakeIdPrefix + mock_id_counter++);
    }
}
