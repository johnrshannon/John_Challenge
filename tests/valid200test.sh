returnCode=$(curl -insS https://johnrshannon.net | grep -o 200)
if [ "$returnCode" == 200 ]
then
  echo "http response code of 200 shows valid connection"
else
  exit 1
fi
