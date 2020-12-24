#!/bin/sh
echo -e "\e[31;43m Verifiyng necessary dependencies are installed..\e[0m"
hash gawk mmv &> /dev/null
if [ $? -eq 1 ]; then
    echo >&2 "gawk OR mmv was not found."
    echo -e "\e[31;43m ** Please install Gawk and mmv to continue. **\e[0m"
    exit 1
fi
echo -e "\e[31;43m script dependencies are installed. continuing...\e[0m"
git pull
echo -e "\e[31;43m Latest Git Has Been Pulled!\e[0m"
rm -rf x*
rm -rf x*.rsc
rm -rf x*.auto.rsc
rm -rf temp-*
rm -rf temp-*.rsc
echo "old files have been removed.."
split -l 5000 blacklist.rsc
echo "new files have been created by split."
mmv "xaa" "xaa.auto.rsc"
mmv "xab" "xab.auto.rsc"
mmv "xac" "xac.auto.rsc"
mmv "xad" "xad.auto.rsc"
mmv "xae" "xae.auto.rsc"
mmv "xaf" "xaf.auto.rsc"
mmv "xag" "xag.auto.rsc"
echo "renamed files ext. to ".auto.rsc""
gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xab.auto.rsc > temp-xab.rsc && mv temp-xab.rsc xab.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xac.auto.rsc > temp-xac.rsc && mv temp-xac.rsc xac.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xad.auto.rsc > temp-xad.rsc && mv temp-xad.rsc xad.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xae.auto.rsc > temp-xae.rsc && mv temp-xae.rsc xae.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xaf.auto.rsc > temp-xaf.rsc && mv temp-xaf.rsc xaf.auto.rsc

gawk '
      BEGIN{print "/ip firewall address-list"}
      {print $0}' xag.auto.rsc > temp-xag.rsc && mv temp-xag.rsc xag.auto.rsc
echo "files have been sucessfully split, and are ready to be collected by the Router via SFTP!"
echo -e "\e[31;43m* RESULTS *\e[0m"
ls /home/pi/Downloads/Mikrotik-Blacklist | grep .auto.rsc
