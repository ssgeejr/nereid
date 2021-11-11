package redis.nereid;

import java.util.*;
import java.util.Map.Entry;

import redis.clients.jedis.*;

public class RedisDataManager {

	private Jedis jedis = null;
	
	public RedisDataManager() throws Exception{
		Map<String, String> env = System.getenv();	
		jedis = new Jedis(env.get("REDIS_SERVER"), Integer.parseInt(env.get("REDIS_PORT")));
		jedis.auth(env.get("REDIS_AUTH"));
	}
	public void setKeyValue(String key, String value) throws Exception{
		jedis.set(notNull(key),notNull(value));
	}
	public String getValue(String key) throws Exception{
		String value = jedis.get(notNull(key));
		return (value != null)?value:"NULL"; 
	}
	public String getValue(String key, String value) throws Exception{
		return jedis.get(notNull(key));
	}
	
	private String notNull(String key) throws Exception{
		if(key == null) throw new NullPointerException("Value cannot be NULL");
		if (key.trim().length() == 0) throw new IllegalStateException("Value must be valid");
		return key.trim();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
