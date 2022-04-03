    Filename: eccouncil-ceh31250-v11-3-12-1-nmap-sctp-init-and-cookie-echo-scans.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap: SCTP INIT and COOKIE ECHO Scans ================================================================================

Nmap: SCTP INIT and COOKIE ECHO Scans
Objectives:

    Describe the process of an SCTP INIT and COOKIE ECHO scans
    Use nmap to perform an SCTP INIT and COOKIE ECHO scans to enumerate port states and service detail
    Explain the pros and cons when utilizing these types of scans

NOTES for DANIEL Can run an SCTP server with NCAT using --sctp switch Capture SCTP traffic with Wireshark for demo

    Kathy
        How SCTP works (4-way handshake)
            Host1 >----INIT-----> Host2
            Host1 <--INIT-ACK---< Host2
            Host1 >-COOKIE-ECHO-> Host2
            Host1 <-COOKIE-ACK--< Host2

    Now that we have the basics down, tell us about the INIT scan.
        -sY option
        Attacker >----INIT-Chunk----> Target
        Attacker <--INIT+ACK-Chunk--< Target
            Port is OPEN
        Attacker >----INIT-Chunk----> Target
        Attacker <---ABORT-Chunk----< Target
            Port is CLOSED
            Port is FILTERED if
                No response
                ICMP Unreachable

    COOKIE ECHO scan
        -sZ option
            "Stealthy"
                Some non-stateful firewalls can't block
                    Advanced IDS/IPS can detect
                Sends COOKIE ECHO Chunk to target
                    Target doesn't respond
                        Port is OPEN
                    Target responds with ABORT Chunk
                        Port is CLOSED
==================================================================

This is the SCTCP scan. 

Stream Control Transmission Protocol

Differences:  TCP == 3 way handshake  SCTP == 4 way handshake

	The Tranmission Protocol communicates in "CHUNKS" instead of Packets in a TCP connection.

# There are the 'INIT' 'INIT_ACK' 'COOKIE_ECHO' 'COOKIE_ACK' CHUNKS that make up the '4 Way Handshake'  




Ex: pcap from wire shark				
	    Source		Destination		PROTOCOL
#CHUNKS
INIT        192.168.241.132  -- >  192.168.241.1     	SCTP		# comes from ip that initiates the conversation

INIT_ACK    192.168.241.1  --> 192.168.241.132   	SCTP		# comes from the ip acknowledging the start of the conversation 

COOKIE_ECHO   192.168.241.132 --> 192.168.241.1		SCTP		# comes from 

COOKIE_ACK    192.168.241.1  -->  192.168.241.132	SCTP		# 

==========     Packets immediately following 4 way handshake  =======

DATA		192.168.241.132 --> 192.168.241.1    	SCTP 

SACK 		192.168.241.1  -->  192.168.241.132     SCTP


==================================================================

	INIT Scan with our favs Nmap


┌──(root💀kali)-[/]
└─# sudo nmap -sY -p 9001 IP 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 19:43 UTC
Nmap scan report for IP (50.116.20.151)
Host is up (0.072s latency).

PORT      STATE    SERVICE
9001/sctp filtered unknown

Nmap done: 1 IP address (1 host up) scanned in 0.52 seconds

=========================================================================
┌──(root💀kali)-[/]                
└─# sudo nmap -sY -p 9001,9999 50.116.20.151                         
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 19:55 UTC
Nmap scan report for IP (50.116.20.151)
Host is up (0.093s latency).
                                                                      
PORT      STATE    SERVICE
9001/sctp filtered unknown
9999/sctp filtered unknown

Nmap done: 1 IP address (1 host up) scanned in 0.36 seconds


==================================================================


	Source		Destination			Protocol

INIT	192.168.241.132  -- >  192.168.241.1		SCTP		# This is our scan going and kocking on a port door

INIT_ACK    192.168.241.1  --> 192.168.241.132          SCTP            # The INIT-ACK response says someone opened the door.

ABORT	192.168.241.132  -- >  192.168.241.1		SCTP		# Then we send an abort because we dont really want to have a conversation. All we wanted to know is if anyone was home and they are so were done.

INIT    192.168.241.132  -- >  192.168.241.1            SCTP		# We send an INIT packet to s different port on the machine 9999. Our closed port.

ABORT	192.168.241.1  -->    192.168.241.132          	SCTP		# And we are met with an abort. We knocked on the door and no one was home. 




===============================================================
COOKIE-ECHO SCAN


┌──(root💀kali)-[~]
└─# sudo nmap -sZ -p 9001,9999 50.116.20.151
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 20:29 UTC
Nmap scan report for IP (50.116.20.151)
Host is up (0.24s latency).

PORT      STATE         SERVICE
9001/sctp open|filtered unknown		# this port is open because I used nc to make a connection on port 9001
9999/sctp closed        unknown		# nothing doing, on this paticular port and it is closed. 

Nmap done: 1 IP address (1 host up) scanned in 3.77 seconds

# Wireshark Example pcap


        		Source          Destination                     Protocol

COOKIE_ECHO(54)    192.168.241.132  -- >  192.168.241.1                 SCTP            # Knocking on port door # xxx

COOKIE_ECHO(54)    192.168.241.132  --> 192.168.241.1          		SCTP            # Knocking on port door # xxx

ABORT(60)          192.168.241.1  -- >  192.168.241.132                 SCTP            # ABORT 

COOKIE_ECHO(54)    192.168.241.132  --> 192.168.241.1                   SCTP            # This is nmap checking again. Nmap is very thuro. if it doesn't get any response it checks again to make sure.


# And since it did not receive anything back after double checking it will now come back to the user and report the filter:

	- open | filtered because of the lack of response




