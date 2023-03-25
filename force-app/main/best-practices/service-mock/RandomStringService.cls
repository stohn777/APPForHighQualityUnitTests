public inherited sharing class RandomStringService
	implements IRandomStringService
{
	public String getRandomString()
	{
		// Just returning a random, unformatted GUID
		return EncodingUtil.ConvertTohex(Crypto.GenerateAESKey(128));
	}

	public static IRandomStringService newInstance()
	{
		return (IRandomStringService) ServiceFactory.newInstance(IRandomStringService.class);
	}
}