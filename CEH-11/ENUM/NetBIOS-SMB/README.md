    Filename: eccouncil-ceh31250-v11-4-2-1-netbios-and-smb-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: NetBIOS and SMB Enumeration ================================================================================

NetBIOS and SMB Enumeration
Objectives:

    Name the information details that can be obtained during NetBIOS Enumeration
    Perform NetBIOS Enumeration using the nbtstat CLI tool
    List other common NetBIOS Enumeration tools

    NetBIOS              Basic Input Output
        Used by Windows for
            File sharing
            Printer sharing

#for HELP run nbtstat with no args

# Go ahead and Powershell as Administrator
PS C:\>nbtstat -c
Displays NetBIOS over TCP/IP (NetBT) protocol statistics, NetBIOS name tables for both the local computer and remote computers, and the NetBIOS name cache. This command also allows a refresh of the NetBIOS name cache and the names registered with Windows Internet Name Service (WINS). Used without parameters, this command displays Help information.

This command is available only if the Internet Protocol (TCP/IP) protocol is installed as a component in the properties of a network adapter in Network Connections.

# HELP

nbtstat [/a <remotename>] [/A <IPaddress>] [/c] [/n] [/r] [/R] [/RR] [/s] [/S] [<interval>]

Parameters
Parameter 	Description
/a <remotename> 	Displays the NetBIOS name table of a remote computer, where remotename is the NetBIOS computer name of the remote computer. The NetBIOS name table is the list of NetBIOS names that corresponds to NetBIOS applications running on that computer.
/A <IPaddress> 	Displays the NetBIOS name table of a remote computer, specified by the IP address (in dotted decimal notation) of the remote computer.
/c 	Displays the contents of the NetBIOS name cache, the table of NetBIOS names and their resolved IP addresses.
/n 	Displays the NetBIOS name table of the local computer. The status of registered indicates that the name is registered either by broadcast or with a WINS server.
/r 	Displays NetBIOS name resolution statistics.
/R 	Purges the contents of the NetBIOS name cache and then reloads the pre-tagged entries from the Lmhosts file.
/RR 	Releases and then refreshes NetBIOS names for the local computer that is registered with WINS servers.
/s 	Displays NetBIOS client and server sessions, attempting to convert the destination IP address to a name.
/S 	Displays NetBIOS client and server sessions, listing the remote computers by destination IP address only.
<interval> 	Displays selected statistics, pausing the number of seconds specified in interval between each display. Press CTRL+C to stop displaying statistics. If this parameter is omitted, nbtstat prints the current configuration information only once.
/? 	Displays help at the command prompt.
---------------------------------------------------------------------------------------------------------------

	nbtstat (Windows)
            -c Cache
            -n Names

PS C:\>nbtstat -n

-----------------------------------------------------------
POWERSHELL COMMAND 'net view'



PS C:\Users\Administrator> net view \\50.116.20.151 /ALL
Shared resources at \\50.116.20.151
					# This will tell us what shares we are working with as well as what
					# files are in those shares.

Share name		Type		Used as 	Comment


------------------------------------------------------------------------------------------

ADMIN$			Disk			Remote Admin
C$			Disk			Default share
Example_Share		Disk			
IPC$			IPC			Remote IPC
NETLOGON		Disk			Logon server share
SYSVOL			Disk			Logon server share
The command completed successfully.


PS C:\Users\Administrator>

# So now we have a good list of shares we can connect to and see what files they have inside of them


       nbtscan (Linux)
            -r target_IP
            -v for more output

┌──(root💀kali)-[/home/kali]
└─# nbtscan -r -v 10.0.0.106  
Doing NBT name scan for addresses from 10.0.0.106


NetBIOS Name Table for Host 10.0.0.106:

Incomplete packet, 48 bytes long.
Name             Service          Type             
----------------------------------------
----------------------------------------

		        nmap

            nmap -sV --script nbstat.nse target_IP
                                                                      
┌──(root💀kali)-[/home/kali]
└─# nmap -sV --script nbstat.nse 50.116.20.151
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-16 00:10 UTC
Nmap scan report for IP (50.116.20.151)
Host is up (0.075s latency).
Not shown: 995 closed tcp ports (reset)
PORT    STATE    SERVICE      VERSION
22/tcp  open     ssh          OpenSSH 8.4p1 Debian 5 (protocol 2.0)
25/tcp  filtered smtp
135/tcp filtered msrpc
139/tcp filtered netbios-ssn
445/tcp filtered microsoft-ds
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 4.85 seconds




    SMB
        File sharing
        CIFS (Common Internet File System)
        Can use TCP directly
            Port 445
        Can use UDP/TCP
            UDP 137,138
            TCP 137,139
                NetBIOS over TCP/IP
        Tools
            nmap
                nmap -A -t4 -n -Pn -p 445 target_IP
            net view
                net view \\target_IP /ALL
                net view example.com
