# Nereid
Redis Enterprise Testing: Active-Active Geolocation Failover

## SEE THE DEVELOP BRANCH FOR LATEST CHANGES



#### PRE-TESTING CONFIGURATION

The nodes are created in Ohio and Virginia with a peering network between them. 
Traffic is allowed to freely flow between the two networks

Using Route-53 you will need to create an entry for both redis nodes. 
Two hosted Zones: redisv.local and rediso.local. 
Assign each hosted node to both VPC's

Create two A-Records `redisv.local` and `*.redisv.local` within your redisv.local hosted zone
and  `rediso.local` and `*.rediso.local` within your rediso.local hosted zone


 

To manually start the conainter use: 

`docker run -ti --rm --name nereid -e REDIS_SERVER='${REDIS_SERVER}' -p 8080:8080 nereid`


#### Redis Configuration 

```
crdb-cli crdb create --name test --memory-size 1gb --port 12000 --password 12345 --shards-count 1 --replication false --instance fqdn=redisv.local,url=http://###.###.###.###:8080,replication_endpoint=###.###.###.###,username=<username>,password=<password> --instance fqdn=rediso.local,url=http://###.###.###.###:8080,replication_endpoint=###.###.###.###,username=<username>,password=<password>
```