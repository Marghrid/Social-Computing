echo "start docker"
open -a Docker
sleep 30

echo "run jupyter on docker"
osascript -e 'tell app "Terminal"
   do script "docker run -it -p 8888:8888 -v /Users/ruicruzferreira/Documents/SC:/home/jupyter dockerfile"
end tell'

sleep 10

echo "open browser"
open http://localhost:8888/
