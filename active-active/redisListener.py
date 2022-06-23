#!/usr/bin/python3

import redis
import time
import sys

#print('Number of arguments:', len(sys.argv), 'arguments.')
#print('Argument List:', str(sys.argv))

if len(sys.argv) < 2:
   print('You must provide a key to listen for ... exiting')
   exit(-1)

key = sys.argv[1]
print('Listening for key [',key,']')

value = None
runtime = 0;
rp2 = redis.StrictRedis(host='rediso.local', port=12000, db=0, password='12345')
value = rp2.get(key)
while not value:
    print('Runtime (s): ', runtime)
    value = rp2.get(key)
    runtime = runtime + 1
    time.sleep(1)

print ('Key [',key,'] Found.  Exiting')
