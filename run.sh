echo "open docker"
open -a Docker

echo "open browser"
open http://localhost:8888/

echo "run jupyter on docker"
docker run -it -p 8888:8888 -v /Users/ruicruzferreira/Documents/SC:/home/jupyter dockerfile
