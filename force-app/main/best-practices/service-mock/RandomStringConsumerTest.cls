@IsTest
private class RandomStringConsumerTest
{
	@IsTest
	static void getString_Given_WithNullInput_Expect_HelloWithRandomString()
	{
		// This test would never succeed if we were using the RandomStringService normally.
		ServiceFactory.setMock(IRandomStringService.class, new MockRandomStringService());
		String actual = ((IRandomStringConsumer) ServiceFactory.newInstance(IRandomStringConsumer.class)).getString();
		Assert.areEqual('Hello - 1234', actual);
	}

	@IsTest
	static void getString_Given_WithSignificantInput_Expect_HelloWithRandomString()
	{
		// This test would never succeed if we were using the RandomStringService normally.
		ServiceFactory.setMock(IRandomStringService.class, new MockRandomStringService());
		String actual = ((IRandomStringConsumer) ServiceFactory.newInstance(IRandomStringConsumer.class)).getString('Here it is');
		Assert.areEqual('Here it is - 1234', actual);
	}

	public class MockRandomStringService
		implements IRandomStringService
	{
		public String getRandomString()
		{
			return '1234';
		}
	}
}