returnCode=$(curl -insS http://johnrshannon.net | grep "HTTP/1.1 301" | grep -o 301)
if [ "$returnCode" == 301 ]
then
  echo "http code of domain on 80 has response code of 301, showing a redirect is in place"
else
  exit 1
fi
