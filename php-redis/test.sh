curl -isL localhost | grep 200 >/dev/null

if [ $? -ne 0 ]; then
  echo -e "\e[91m [Test Failed]\e[0m"

else
  echo -e "\e[92m [Test Pass]\e[0m"
fi
