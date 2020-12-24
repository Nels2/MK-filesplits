# MK-filesplits
A shell script I made to split files up and rename them and append "print "/ip firewall address-list" at the beginning. I made this because I was working on a very low end MikroTik routerboard.
Use this on a linux machine with Gawk & mmv installed. ++ Use in conjunction with https://github.com/pwlgrzs/Mikrotik-Blacklist/blob/master/blacklist.rsc.[place the files from this repo within the linked one.]
## How it all works 
First I followed: http://www.scrounge.org/linux/cron.html to learn how to automate shell scripts. It was as simple as creating a file named "foo.cron" and adding " 10 14 * * 1 /path/to/Mikrotik-Blacklist/filesplitterv2.sh ". This runs my script Once a week, every monday. This was all done on a seperate Linux Machine.
Filesplitterv2.sh pulls the latest git [https://github.com/pwlgrzs/Mikrotik-Blacklist.git] and pulls the blacklist.rsc file.
Next, the script removes any previous files, splits blacklist.rsc into 7 files that each contain around 5,000 lines or 4,998 IP's. 
Finally, each file is renamed from "xa*" to "xa*.auto.rsc", and appends "/ip firewall address-list" to beginning of each of the seven files.
# How it all works via the MikroTik
Next I created a script[Let's call it 'Fetcher'] on the MikroTik router [I used model: RB751U-2HnD] that sshs[192.168.88.1 -> 192.168.88.254/home/pi/Downloads/Mikrotik-Blacklist/x**.auto.rsc] into the linux machine used earlier, grabs the files xa[a-g].auto.rsc and imports them into the MikroTik router onto a usb drive labeled as 'Disk2'. 

I also created a scheduler on the MikroTik that runs Fetcher once every seven days to fetch the newly split files.
Then another scheduler event titled "blacklist-replace"[forked from pwlgrzs] runs that imports all the IP's that the newly imported files contain. This also runs every seven days, on the same day[Monday, or whatever day it is set to.], 8 minutes after "fetcher-start".
# Some final thoughts..
I have also included the cron file I used to automate filesplitterv2.sh for me.[Will run path/to/filesplitterv2.sh at 2:10pm on every Monday]
