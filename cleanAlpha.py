#!C:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe

import redis
import time


rp1 = redis.StrictRedis(host='redisv.local', port=12000, db=0, password='12345')
rp2 = redis.StrictRedis(host='rediso.local', port=12000, db=0, password='12345')

print('Scrubbing the old ... ')
rp1.delete('onemegkey')
omega = rp2.get('onemegkey')
print (omega)
if not omega:
   print('Not None')