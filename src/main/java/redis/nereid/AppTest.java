package redis.nereid;

import java.util.Map;

public class AppTest{
	
	public static void main (String args[]){
		System.out.println("Hello world!");
		Map<String, String> env = System.getenv();
		System.out.println("REDIS_SERVER: " + env.get("REDIS_SERVER"));
	}
}