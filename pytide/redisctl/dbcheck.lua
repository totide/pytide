-- redis key & value string operation
redis.call("SET", "test", "1")
redis.call("GET", "test")
redis.call("EXISTS", "test")
redis.call("INCR", "test")
redis.call("DECR", "test")
redis.call("EXPIRE", "test", 5)
redis.call("DEL", "test")

-- redis hash operation
redis.call("HSET", "test", "hash", "1")
redis.call("HMSET", "test", "hash", "1", "hmset", "2")
redis.call("HLEN", "test")
redis.call("HEXISTS", "test", "hash")
redis.call("HKEYS", "test")
redis.call("HINCRBY", "test", "hash", "1")
redis.call("HGETALL", "test")
redis.call("HDEL", "test", "hash", "hmset")

-- redis list operation
redis.call("LPUSH", "test", "1", "2")
redis.call("RPUSH", "test", "4", "3")
redis.call("LLEN", "test")
redis.call("LRANGE", "test", 0, 3)
redis.call("LINDEX", "test", 0)
redis.call("LTRIM", "test", 0, 1)
redis.call("LPOP", "test")
redis.call("RPOP", "test")

-- redis zset operation
redis.call("ZADD", "test", 1, "mem", 2, "mem2", 3, "mem3")
redis.call("ZSCORE", "test", "mem")
redis.call("ZRANGE", "test", 0, 1, "WITHSCORES")
redis.call("ZRANGEBYSCORE", "test", 0, 1, "WITHSCORES")
redis.call("ZCARD", "test")
redis.call("ZCOUNT", "test", 0, 1)
redis.call("ZRANK", "test", "mem")
redis.call("ZREVRANK", "test", "mem")
redis.call("ZREVRANGE", "test", 0, 1, "WITHSCORES")
redis.call("ZREM", "test", "mem")
redis.call("ZREMRANGEBYSCORE", "test", 2, 2)
redis.call("ZREMRANGEBYRANK", "test", 1, 1)
redis.call("DEL", "test")

-- redis set operation
redis.call("SADD", "test", "mem")
redis.call("SADD", "test_move", "mem1")
redis.call("SCARD", "test")
redis.call("SMOVE", "test" ,"test_move", "mem")
redis.call("SREM", "test_move", "mem")
redis.call("SRANDMEMBER", "test")
redis.call("SMEMBERS", "test")
redis.call("SISMEMBER", "test", "mem")
redis.call("SINTER", "test", "test_move")
redis.call("SUNION", "test", "test_move")
redis.call("SDIFF", "test", "test_move")