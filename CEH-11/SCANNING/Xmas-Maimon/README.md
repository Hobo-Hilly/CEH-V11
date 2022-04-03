Nmap: Inverse TCP, XMAS, and Maimon Scans
Objectives:

    Use nmap to perform an Inverse TCP scan to enumerate port states and service details
    Use nmap to perform an XMAS scan to enumerate port states and service details
    Explain the pros and cons when utilizing these types of scans

    What is the concept behind an Inverse TCP scan? How does this work, theoretically?
        'Hacking' TCP
            Firewalls/IPS can block SYN packets
                How could we get around this?
                    Probe with other flags
# An inverse TCP scan is meant to scan with non of the traditional flags set.
# i.e. SYN SYN/ACK RST are not used here. instead we use the switches below to scan. FIN URG PSH NULL

                        FIN
                        URG
                        PSH
                        NULL
            OPEN ports don't respond to FIN, URG, PSH, or NULL
            CLOSED ports respond with RST
#BWT

When an open port recieves one of the non traditional flags the connection receiving it, is like ' whoa what the hell are you sending me? This is jiberish. Obviously this connection your trying
to send me is malfunctioning. So that port sends no response at all because it has no idea what to send in response to a crazy random packet of data 


	How do we perform these types of scans?
        -sF (FIN)
# NOTE: This scan cannot tell the difference between a port being open or if a port is filtered. It is up to you to figure it out on your own.
#	This is because the way this scan works. It only reports a port open if it DOES NOT respond.
#	So the anyone of these ports could be open OR a firewall could be blocking us.
	So this is why in the return data shows the ports as 'Open|Filtered'
#	nmap -sF 10.0.0.106  
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 17:32 UTC
Nmap scan report for 10.0.0.106
Host is up (0.000010s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE         SERVICE
80/tcp open|filtered http    ****

Nmap done: 1 IP address (1 host up) scanned in 1.35 seconds
#	Open|Filtered
	Anything that comes back like this is because the port did not respond

=================================================================================
        -sN (NULL)        
# We need SUDO to run this scan because we are reaching down into
# the TCP stack
# this scan reachs out and if the port doesn't respond its 
# marked as open
''
┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
└─# sudo nmap -sN 10.0.0.106
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 17:35 UTC
Nmap scan report for 10.0.0.106
Host is up (0.000012s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE         SERVICE
80/tcp open|filtered http

Nmap done: 1 IP address (1 host up) scanned in 1.58 seconds
''

===================================================================
	--scanflags URGACKPSHRSTSYNFIN
        SYN/ACK probe
┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]                 
└─# nmap --scanflags PSH 10.0.0.106                                   
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 18:01 UTC       
Nmap scan report for 10.0.0.106                                       
Host is up (0.0000080s latency).                                      
Not shown: 999 closed tcp ports (reset)                               
PORT   STATE    SERVICE                                               
80/tcp filtered http                                                  
                                                                      
Nmap done: 1 IP address (1 host up) scanned in 1.50 second

# Note: We are sending a custom packet here with the PSH (push)
# flag set. 
# Also these respsonses will have different output. I am just scanning
# my host machine for output and notes on the command

	If we run the command with '--reason'
	There are two examples below
#1
┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
└─# nmap --scanflags PSH 10.0.0.1 --reason  
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 18:07 UTC
Nmap scan report for 10.0.0.1
Host is up, received arp-response (0.0050s latency).
All 1000 scanned ports on 10.0.0.1 are in ignored states.
Not shown: 1000 filtered tcp ports (no-response)

#2
┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
└─# nmap --scanflags PSH 10.0.0.106 --reason
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 18:07 UTC
Nmap scan report for 10.0.0.106
Host is up, received localhost-response (0.000010s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE    SERVICE REASON
80/tcp filtered http    no-response

Nmap done: 1 IP address (1 host up) scanned in 1.39 seconds

# '--reasons' will list a column with reasoning behind it's decision
# to mark each port open or closed. Kind of like asking NMAP 'But
# why though?" Super handy for reports
===================================================================

    How about this 'Christmas' scan thing?
        Scans using the FINURGPSH flags
            You could also accomplish this with


''              --scanflags URGPSHFIN

┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]                   
└─# nmap -sX 192.168.0.0/8                                                                                                                       
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 18:16 UTC         
Nmap scan report for mailgw.elevatedcomp.com (192.0.3.12)               
Host is up (0.095s latency).                                            
All 1000 scanned ports on mailgw.elevatedcomp.com (192.0.3.12) are in ignored states.
Not shown: 1000 open|filtered tcp ports (no-response)                   
                                                                        
Nmap scan report for 192.0.3.21                                         
Host is up (0.095s latency).                                            
All 1000 scanned ports on 192.0.3.21 are in ignored states.             
Not shown: 1000 open|filtered tcp ports (no-response)                   
                                                                        
Nmap scan report for spam.elevated.net (192.0.3.26)                     
Host is up (0.092s latency).                                            
All 1000 scanned ports on spam.elevated.net (192.0.3.26) are in ignored states.
Not shown: 1000 open|filtered tcp ports (no-response)

''



# This scan is meant to 'light the packet up like a christmas tree'
# With this scan we are going to set the PUSH URG flag all at the
# same time. 

Learning Scenario: Lets say you are doing a CTF. You know the box has a webserver running on PORT 80. 
As a matter of fact. You have the page up in another tab ON PORT 80. But when you go run your traditional NMAP scans PORT 80
is not showing as open. This is the time you want to use an XMAS scan. Or a -sF (FIN) scan. This would be a good time
to pull out the --scanflags option and poke it with different flags/switches
This is considered a 'back pocket tool'


# NOTE: This scan may not work. These scans are a bit of a long shot.
# Reading the RFC is the KEY to all this stuff.

https://datatracker.ietf.org/doc/html/rfc793


===================================================================
    As if 'Christmas' scans weren't fun enough, we also need to be aware of 'Maimon' scans?
        Basically the same trick, but with different flags
            FIN/ACK probe
                -sM
                --scanflags ACKFIN
''

┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
└─# nmap -sM 10.0.0.106     
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 18:36 UTC
Nmap scan report for 10.0.0.106
Host is up (0.0000060s latency).
All 1000 scanned ports on 10.0.0.106 are in ignored states.
Not shown: 1000 closed tcp ports (reset)

Nmap done: 1 IP address (1 host up) scanned in 0.22 seconds

''

==================================================================
# Here is a little more on the Maimon Scan per Nmap docs 

This technique is exactly the same as NULL, FIN, and Xmas scan, except that the probe is FIN/ACK. 
According to RFC 793 (TCP), a RST packet should be generated in response to such a probe whether the port is open or closed. 
However, Uriel noticed that many BSD-derived systems simply drop the packet if the port is open. 
Nmap takes advantage of this to determine open ports

#NOTE: you can run this scan exactly the same way with the
#      '--scanflags' options



# Are there any issues with using these scans that we should take in to consideration?
        Only works with BSD-Compliant Network Stacks
            Adherence to RFC 793
                Windows and Linux will scoff

============================================================================================
