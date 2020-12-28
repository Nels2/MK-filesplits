# MK-filesplits
A shell script I made to split files up and rename them and append ```print "/ip firewall address-list``` at the beginning. I made this because I was working on a very low end MikroTik routerboard. I used two ethernet ports; one for internet and one to connect my machine to router itself.
Use this on a linux machine with Gawk & mmv installed. **Use in conjunction with [https://github.com/pwlgrzs/Mikrotik-Blacklist.git] [place the files from this MK-fielsplits repo within the linked one.]** you only need "blacklist.rsc" 
- Start by git cloning this git: [https://github.com/pwlgrzs/Mikrotik-Blacklist.git] 
- Next, cd into it and git clone this repo: https://github.com/Nels2/MK-filesplits.git
- Now, cd into MK-filesplits and ```mv * ../ | cd ..```
- Finally, ```rm -rf MK-filesplits```
- Now you are set up!
## How it all works 
First I followed: [cron man-page](http://www.scrounge.org/linux/cron.html) to learn how to automate shell scripts. It was as simple as creating a file named "foo.cron" and adding ``` 10 14 * * 1 /path/to/Mikrotik-Blacklist/filesplitterv2.sh```. 
- after creating foo.cron, import it by using ```crontab foo.cron'''
- make sure it is added by using ```crontab -l```
- You should see `10 14 * * 1 /path/to/Mikrotik-Blacklist/filesplitterv2.sh`
- This runs my script once a week, every monday. This was all done on a seperate Linux Machine.
Filesplitterv2.sh pulls the latest git [https://github.com/pwlgrzs/Mikrotik-Blacklist.git] and pulls the blacklist.rsc file.
- Next, the script removes any previous files, splits blacklist.rsc into **7 files** that each contain around 5,000 lines or 4,998 IP's. 
- Finally, each file is renamed from "xa*" to "xa*.auto.rsc", and appends ```/ip firewall address-list``` to beginning of each of the seven files.
# How it all works via the MikroTik
Next I created a script[Let's call it 'Fetcher', also included in this repo] on the MikroTik router **[I used model: __RB751U-2HnD__]** that sshs[(IP's I used)192.168.88.1 -> 192.168.88.254/path/to/Mikrotik-Blacklist/x**.auto.rsc] into the linux machine used earlier, grabs the files xa[a-g].auto.rsc and imports them into the MikroTik router onto a usb drive labeled as 'Disk2'. 
-Note: Insert an external usb drive to MikroTik, and format as following: ```/disk format-drive 0 file-system=ext3 label=flashdrive``` prior to running fetcher.
- Create a scheduler event called 'fetcher-start' on the MikroTik that runs Fetcher once every seven days to fetch the newly split files from the linux machine(__you must point it to the right IP/URL__).
- Create another scheduler event titled "blacklist-replace"[forked from pwlgrzs] runs that imports all the IP's that the newly imported files contain. This also runs every seven days, on the same day[Monday, or whatever day it is set to.], 8 minutes[again, can be set to desired amount of time] after "fetcher-start".
# Some final thoughts..
I have also included the cron file I used to automate filesplitterv2.sh for me.[Will run path/to/filesplitterv2.sh at 2:10pm on every Monday]
- Feel free to use or optimize.
- **Make sure to update IP's, and Directories so the script actually works.**
