public inherited sharing class RandomStringConsumer
	implements IRandomStringConsumer
{
	public String getString()
	{
		return getString(null);
	}

	public String getString(String prefix)
	{
		return (String.isNotBlank(prefix) ? prefix.normalizeSpace() : 'Hello') + ' - ' + RandomStringService.newInstance().getRandomString();
	}
}