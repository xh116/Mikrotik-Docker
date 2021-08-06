# Docker-Mikrotik-RouterOS based on qeum




`docker run -d -p 9991:8291 -p 8880:80 --privileged --name=mikrotik --restart=always xh116/mikrotik`



Thanks @kilip   @EvilFreelancer 


# Docker-Mikrotik-Exporter for prometheus  

```
  docker run -d --name mikrotik-exporter \
  --network=monitor \
  -p 9436:9436 \
  --restart=unless-stopped \
  -v /home/core/docker/mikrotik/config.yml:/config.yml \
  xh116/mikrotik-exporter 
 ``` 
  
 Thanks @hafkensite @nshttpd 
  
