    Filename: eccouncil-ceh31250-v11-6-4-1-password-extraction-and-cracking.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Password Hash Extraction and Cracking ================================================================================

Password Extraction and Cracking
Objectives:

    List common tools utilized to extract password hashes
    Utilize password hash extraction tools to retrieve password hashes
    Explain the process of LLMNR/NBT-NS Poisoning
    Utilize freely available tools to execute LLMNR poisoning attack
    Define password salting
    List and explain common password policies used to defend against password attacks

    How do we get the password hashes from target computers?
        Post-compromise activity (usually)   

# i.e. We have already gotten onto the machine.
# I upload the tool
# I run the tool
# tool reaches into the machine and dumps passwords out into a file. In format in which I can read the thing. Then we have the HASHED password

        Windows Tools
            pwdump7
#            fgdump              ** has the nicest output
            mimikatz
            responder

# Just to remind you that we are just getting passwords here. Cracking them is a different step.

''
┌──(root💀kali)-[/home/kali]
└─# responder -I wlan0 -v
                                         __
  .----.-----.-----.-----.-----.-----.--|  |.-----.----.
  |   _|  -__|__ --|  _  |  _  |     |  _  ||  -__|   _|
  |__| |_____|_____|   __|_____|__|__|_____||_____|__|
                   |__|

           NBT-NS, LLMNR & MDNS Responder 3.1.1.0

  Author: Laurent Gaffie (laurent.gaffie@gmail.com)
  To kill this script hit CTRL-C


[+] Poisoners:
    LLMNR                      [ON]
    NBT-NS                     [ON]
    MDNS                       [ON]
    DNS                        [ON]
    DHCP                       [OFF]

[+] Servers:
    HTTP server                [ON]
    HTTPS server               [ON]
    WPAD proxy                 [OFF]
    Auth proxy                 [OFF]
    SMB server                 [ON]
    Kerberos server            [ON]
    SQL server                 [ON]
    FTP server                 [ON]
    IMAP server                [ON]
    POP3 server                [ON]
    SMTP server                [ON]
    DNS server                 [ON]
    LDAP server                [ON]
    RDP server                 [ON]
    DCE-RPC server             [ON]
    WinRM server               [ON]

[+] HTTP Options:
    Always serving EXE         [OFF]
    Serving EXE                [OFF]
    Serving HTML               [OFF]
    Upstream Proxy             [OFF]

[+] Poisoning Options:
    Analyze Mode               [OFF]
    Force WPAD auth            [OFF]
    Force Basic Auth           [OFF]
    Force LM downgrade         [OFF]
    Force ESS downgrade        [OFF]

[+] Generic Options:
    Responder NIC              [wlan0]
    Responder IP               [10.0.0.106]
    Responder IPv6             [2601:602:ca80:a5e0::32c2]
    Challenge set              [random]
    Don't Respond To Names     ['ISATAP']

[+] Current Session Variables:
    Responder Machine Name     [WIN-SXL3HGG6457]
    Responder Domain Name      [K2SC.LOCAL]
    Responder DCE-RPC Port     [45146]

[+] Listening for events...                
''
#Whats happening??



- So now that this is running it is starting to poison the network
- It is now starting a man in the middle like attack.
- now that it's sat in the middle of the network it is listening for any authentication events.
- So now when a windows Client on the network goes to look for something like a windows share.
- Instead of running to DNS occasionally to speed things up it will try to obtain the information using...  NBT-NS / LLMNR / MDNS.
- and if when it defaults to one of those protocols while my attacking machine has responder running.
- I can intercept that transmission while it's going over the wire using responder.

# So our attacking machine stands up and say's yeah bro i got that resolution right here.



	So the authentication system sends a password hash to the machine that reached out for the authentication
	and we intercept the hash using responder.
Anything that looks like Net NTLM V2 authentication will be snagged by responder.

 John The Ripper
 OCL Hashcat
# John Example

┌──(root💀kali)-[/home/kali/CEH/TEST-CREDS]
└─# cat hashes.txt 
f5c8d5aca7ee8b3542b5736b3fa3ec03
47a7a46cd082472474b0d9a3ac21e3a6
a17915568c7130dc625d1712e0a8f6c9
56cdd7e9e3cef1974f4075c03a80332d
aeb9573c09919d210512b643907e56b8
e64b78fc3bc91bcbc7dc232ba8ec59e0
09c4f5615e87488cbb122ccd1e05d8b4
8a24367a1f46c141048752f2d5bbd14b                                                                      
┌──(root💀kali)-[/home/kali/CEH/TEST-CREDS]
└─# john hashes.txt --wordlist=/usr/share/wordlists/rockyou.txt --format=RAW-MD5    
Using default input encoding: UTF-8
Loaded 8 password hashes with no different salts (Raw-MD5 [MD5 256/256 AVX2 8x3])
Warning: no OpenMP support for this hash type, consider --fork=8
Press 'q' or Ctrl-C to abort, almost any other key for status
Perfect          (?)     
pasword123       (?)     
JackJack         (?)     
Sexy             (?)     
God              (?)     
P@ssw0rd!        (?)     
Admin123         (?)     
7g 0:00:00:00 DONE (2022-03-16 13:35) 8.139g/s 16678Kp/s 16678Kc/s 24209KC/s  fuckyooh21..*7¡Vamos!
Use the "--show --format=Raw-MD5" options to display all of the cracked passwords reliably
Session completed.

========================================================================================================================



- Basically any NTLM V2 authentication 

        Linux
            cat
        Web/Database attacks
            Attacker could retrieve hashes from insecure web app




    How do we crack these hashes to reveal the passwords?
        John the Ripper
            Dictionary
            Rules
        OCL-Hashcat
            Brute
        Ophcrack
            Rainbow Tables
        Pass-the-Hash
            Don't even need to crack the hash
            Some systems will just use the hash
    Any good countermeasures?
        Good password policies
            Sufficient length
            Sufficient character sets
            No dictionary words
            Salt
    Any other ways to grab passwords?
        Key loggers
            Software-based
            Hardware-based

https://gracefulsecurity.com/custom-rules-for-john-the-ripper-examples/


===================================================================
HASHCAT

┌──(root💀kali)-[/home/kali/CEH/TEST-CREDS]
└─# hashcat -m 1000 hashes.txt -t 100 /usr/share/wordlists/rockyou.txt 
hashcat (v6.2.5) starting

OpenCL API (OpenCL 2.0 pocl 1.8  Linux, None+Asserts, RELOC, LLVM 11.1.0, SLEEF, DISTRO, POCL_DEBUG) - Platform #1 [The pocl project]
=====================================================================================================================================
* Device #1: pthread-Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz, 6820/13705 MB (2048 MB allocatable), 8MCU

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 8 digests; 8 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Early-Skip
* Not-Salted
* Not-Iterated
* Single-Salt
* Raw-Hash

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Temperature abort trigger set to 90c

Host memory required for this attack: 2 MB

Dictionary cache hit:
* Filename..: /usr/share/wordlists/rockyou.txt
* Passwords.: 14344385
* Bytes.....: 139921507
* Keyspace..: 14344385

Approaching final keyspace - workload adjusted.           

Session..........: hashcat                                
Status...........: Exhausted
Hash.Mode........: 1000 (NTLM)
Hash.Target......: hashes.txt
Time.Started.....: Wed Mar 16 13:37:39 2022 (1 sec)
Time.Estimated...: Wed Mar 16 13:37:40 2022 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (/usr/share/wordlists/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#1.........:  8760.7 kH/s (0.23ms) @ Accel:1024 Loops:1 Thr:1 Vec:8
Recovered........: 0/8 (0.00%) Digests
Progress.........: 14344385/14344385 (100.00%)
Rejected.........: 0/14344385 (0.00%)
Restore.Point....: 14344385/14344385 (100.00%)
Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#1....: $HEX[206b72697374656e616e6e65] -> $HEX[042a0337c2a156616d6f732103]
Hardware.Mon.#1..: Temp: 54c Util: 39%

Started: Wed Mar 16 13:37:35 2022
Stopped: Wed Mar 16 13:37:41 2022
                                              


Rainbow Tables are pre hashed values
The files are large
The more you have the faster it is
Since it is just taking the hashed value of the password and comapring it with other hash values. It goes much faster than 
typical methonds like john and hashcat above.
There is one less layer obstructing us form our goals. Because technically we never crack this password password. we just found a match
for its hashed value version. 

 










