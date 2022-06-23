#!C:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe

import redis
import time

rp1 = redis.StrictRedis(host='redisv.local', port=12000, db=0, password='12345')
rp2 = redis.StrictRedis(host='rediso.local', port=12000, db=0, password='12345')


omega = rp2.get('onemegkey')
print (omega)
if omega:
   print('Omega Found ... exiting')
   exit(-1)


text_file = open("gistfile1.txt", "r")
data = text_file.read()
text_file.close()
text_file.close();
#print(data);
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
#print ("Node-1: " , alpha)

print ("get key1 from Node-2")
#omega = rp2.get('key1')
#print("_Node-2: " , omega)
#print('Equal? ' , (omega == alpha))
limitter = 0
omega = rp2.get('onemegkey')
while not omega:
    omega = rp2.get('onemegkey')
#   print(omega)
    end = time.time()
    #print("Node-2: " , omega)
    limitter = limitter + 1
    print('Limitter: ' , limitter)
    if limitter > 5000:
        print('FAILED TO REPLICATE IN 1 SECOND')
        exit(0)


print("Replication Time: " , (end-start))
rp1.delete('onemegkey')
print('Key removed [onemegkey]')

exit(1)