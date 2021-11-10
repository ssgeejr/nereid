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


 


