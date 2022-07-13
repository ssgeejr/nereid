#!C:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe

import redis
import time

rp1 = redis.StrictRedis(host='10.6.168.155', port=12500, db=0, password='dcapass')


omega = rp1.get('onemegkey')
print (omega)
if omega:
   print('Omega Found ... exiting')
   exit(-1)


text_file = open("gistfile0.txt", "r")
data = text_file.read()
text_file.close()
print(data);
#exit(-1)
print('file data loaded [1mb]')

print ("set key1 on Node-1")
start = time.time()
end = start
alpha = 'New Key Inserted'
omega = None

start=time.time()
print (rp1.set('onemegkey', data))
print ("get key1 from Node-1")
alpha = rp1.get('onemegkey')
print ("Node-1: " , alpha)

print ("get key1 from Node-2")



rp1.delete('onemegkey')
print('Key removed [onemegkey]')

exit(1)