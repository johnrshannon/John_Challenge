htmlh1=$(curl -insSL http://johnrshannon.net | grep -o World!)
if [ "$htmlh1" == "World!" ]
then
  echo "following the redirect leads us to our served content; the redirect is constructed properly"
else
  exit 1
fi
