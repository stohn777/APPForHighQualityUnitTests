public interface IRandomStringConsumer
	extends IService
{
	String getString();
	String getString(String prefix);
}