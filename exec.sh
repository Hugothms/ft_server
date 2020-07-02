docker build -t ft-server .
docker run -it -p 80:80 -p 443:443 ft-server