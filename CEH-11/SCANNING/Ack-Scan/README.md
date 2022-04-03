    Filename: eccouncil-ceh31250-v11-3-9-1-nmap-ack-scan.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap: ACK Scan ================================================================================

Nmap: ACK Scan
Objectives:

    Describe the process of an ACK scan
    Use nmap to perform an ACK scan to enumerate ports states and map firewall rules
    Explain the pros and cons when utilizing this type of scan

    Kathy
        Used in attempt to map firewall/filtering rules for target

# reason you would want to use an ACK scan

Learning Scenario: Lets say you are scanning a target and you would like to know if perhaps a firewall of somesort is blocking any of our
quieries. 
So your thinking maybe some ports on this machine aren't showing up
because there is a firewall in the way stoping that from occuring.

So now we want to use an ACK scan to see if this is in fact the case.
	
# This behaves the same way the XMAS scan does just uses different flags.
# And because it's using different flags. We as testers, are hoping for a different response. 
# And this information in turn can help us put the security pieces of the puzzle together.
# Just helps us get the best look at the network and whats really going on
===================================================================


	How is that done?
        Send an ACK and random sequence number
            NO RESPONSE = filtered
            RST = not filtered

                Only works on RFC 793 compliant stacks
     Sudo   nmap -sA <targetIP>

┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
└─# nmap -sA 10.0.0.106
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 19:20 UTC
Nmap scan report for 10.0.0.106
Host is up (0.0000070s latency).
All 1000 scanned ports on 10.0.0.106 are in ignored states.
Not shown: **1000 unfiltered tcp ports** (reset)

Nmap done: 1 IP address (1 host up) scanned in 0.46 seconds


# If I receive a response it is unfiltered...
# So this means according to these results We received a bunch of RST(reset) packets
# This scan isn't looking for open ports
# This scan is searching for filtering and the results say " 1000 unfiltered tcp ports (reset) "
		Laymans:
# Since the target(scanned) machine sent back the thing we expected it to send back 
# Means NONE of these ports are filtered.
# So now we know there is no filter in front of us we can proceed accordingly
# BUT and this is a big BUT these results could mean that this system
# is not RFC 793 compliant
	So this starts to break all the way down to things like how well do you know your target?
	If your more familiar with your target maybe trust the results from the scan	
	conversely if you are not very familiar with your target. Maybe take those results with a grain of salt.

===================================================================

    I understand there are some variations to this type of scan?
        TTL-based
            If TLL values are lower than 64
            nmap -ttl 70 <targetIP>
                Learn target's TTL through packet inspection
                    --packet-trace
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:544 S ttl=70 id=52504 iplen=44  seq=3903576520 win=1024 <mss 1460>                                
RCVD (0.1249s) TCP 127.0.0.1:544 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                          
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:8292 S ttl=70 id=6669 iplen=44  seq=3903576520 win=1024 <mss 1460>                                
RCVD (0.1249s) TCP 127.0.0.1:8292 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                         
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:5811 S ttl=70 id=49420 iplen=44  seq=3903576520 win=1024 <mss 1460>                               
RCVD (0.1249s) TCP 127.0.0.1:5811 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                         
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:1755 S ttl=70 id=15294 iplen=44  seq=3903576520 win=1024 <mss 1460>                               
RCVD (0.1249s) TCP 127.0.0.1:1755 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                         
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:31337 S ttl=70 id=54807 iplen=44  seq=3903576520 win=1024 <mss 1460>                              
RCVD (0.1249s) TCP 127.0.0.1:31337 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                        
RCVD (0.1249s) TCP 127.0.0.1:33185 > 127.0.0.1:212 S ttl=70 id=12338 iplen=44  seq=3903576520 win=1024 <mss 1460>                                
RCVD (0.1249s) TCP 127.0.0.1:212 > 127.0.0.1:33185 RA ttl=64 id=0 iplen=40  seq=0 win=0

# if you look through the capture above you will see that we have some return < 70 (64) and some return @ 70.
# Typically when going through this type of scan's DATA you want to look for anything that returns a TTL or 
# time to live that is smaller then the one you set. This is because if you set the time for the packet to live 
# @ 70 and it's being interacted with before it times out. Then that means that there is something alive at the 
# other end of the port. So we are almost ALWAYS looking for something smaller than the time we set.
	NOTE: Make sure you are looking at RCVD for received packets.


#BWT 
# We are just looking for anything out of the norm here. something that isn't ttl=64 
                

		    --reason
        Window-based
            All about the window size
                If target returns
                    RST + Non-Zero Window = Port OPEN
                    RST + Zero Window = Port CLOSED

                    No Response = FILTERED

                        Can't really trust this scan as the OS may not be compliant

                            See man nmap and search for -sW

=======================
#1  RCVD ... RST packet win=0  -->> CLOSED PORT

	┌──(root💀kali)-[/home/kali/CEH/SCANNING/Xmas-Maimon]
	└─# nmap --ttl 70 10.0.0.106 -packet-trace                                                                                                 130 ⨯
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 21:28 UTC
NSOCK INFO [0.0240s] nsock_iod_new2(): nsock_iod_new (IOD #1)
NSOCK INFO [0.0240s] nsock_connect_udp(): UDP connection requested to 2001:558:feed::2:53 (IOD #1) EID 8
NSOCK INFO [0.0240s] nsock_read(): Read request from IOD #1 [2001:558:feed::2:53] (timeout: -1ms) EID 18
NSOCK INFO [0.0240s] nsock_iod_new2(): nsock_iod_new (IOD #2)
NSOCK INFO [0.0240s] nsock_connect_udp(): UDP connection requested to 2001:558:feed::1:53 (IOD #2) EID 24
NSOCK INFO [0.0250s] nsock_read(): Read request from IOD #2 [2001:558:feed::1:53] (timeout: -1ms) EID 34
NSOCK INFO [0.0250s] nsock_iod_new2(): nsock_iod_new (IOD #3)
NSOCK INFO [0.0250s] nsock_connect_udp(): UDP connection requested to 75.75.76.76:53 (IOD #3) EID 40
NSOCK INFO [0.0250s] nsock_read(): Read request from IOD #3 [75.75.76.76:53] (timeout: -1ms) EID 50
NSOCK INFO [0.0250s] nsock_iod_new2(): nsock_iod_new (IOD #4)
NSOCK INFO [0.0250s] nsock_connect_udp(): UDP connection requested to 75.75.75.75:53 (IOD #4) EID 56
NSOCK INFO [0.0250s] nsock_read(): Read request from IOD #4 [75.75.75.75:53] (timeout: -1ms) EID 66
NSOCK INFO [0.0250s] nsock_write(): Write request for 41 bytes to IOD #1 EID 75 [2001:558:feed::2:53]
NSOCK INFO [0.0250s] nsock_trace_handler_callback(): Callback: CONNECT SUCCESS for EID 8 [2001:558:feed::2:53]
NSOCK INFO [0.0250s] nsock_trace_handler_callback(): Callback: WRITE SUCCESS for EID 75 [2001:558:feed::2:53]
NSOCK INFO [0.0250s] nsock_trace_handler_callback(): Callback: CONNECT SUCCESS for EID 24 [2001:558:feed::1:53]
NSOCK INFO [0.0250s] nsock_trace_handler_callback(): Callback: CONNECT SUCCESS for EID 40 [75.75.76.76:53]
NSOCK INFO [0.0250s] nsock_trace_handler_callback(): Callback: CONNECT SUCCESS for EID 56 [75.75.75.75:53]
NSOCK INFO [0.1360s] nsock_trace_handler_callback(): Callback: READ SUCCESS for EID 18 [2001:558:feed::2:53] (41 bytes): .............106.0.0.10.in-addr.arpa.....
NSOCK INFO [0.1360s] nsock_read(): Read request from IOD #1 [2001:558:feed::2:53] (timeout: -1ms) EID 82
NSOCK INFO [0.1360s] nsock_iod_delete(): nsock_iod_delete (IOD #1)
NSOCK INFO [0.1360s] nevent_delete(): nevent_delete on event #82 (type READ)
NSOCK INFO [0.1360s] nsock_iod_delete(): nsock_iod_delete (IOD #2)
NSOCK INFO [0.1360s] nevent_delete(): nevent_delete on event #34 (type READ)
NSOCK INFO [0.1360s] nsock_iod_delete(): nsock_iod_delete (IOD #3)
NSOCK INFO [0.1360s] nevent_delete(): nevent_delete on event #50 (type READ)
NSOCK INFO [0.1360s] nsock_iod_delete(): nsock_iod_delete (IOD #4)
NSOCK INFO [0.1360s] nevent_delete(): nevent_delete on event #66 (type READ)
.
.
.
.
RCVD (0.3169s) TCP 10.0.0.106:62773 > 10.0.0.106:8994 S ttl=70 id=32516 iplen=44  seq=1374264527 win=1024 <mss 1460>                             
RCVD (0.3169s) TCP 10.0.0.106:8994 > 10.0.0.106:62773 RA ttl=64 id=0 iplen=40  seq=0 win=0                                                       
RCVD (0.3170s) TCP 10.0.0.106:62773 > 10.0.0.106:2301 S ttl=70 id=236 iplen=44  seq=1374264527 win=1024 <mss 1460>                               
RCVD (0.3170s) TCP 10.0.0.106:2301 > 10.0.0.106:62773 RA ttl=64 id=0 iplen=40  seq=0 win=0 

# NOTE: any packets RCVD with a 'win=0' (window size of Zero) 
# means the port is closed


-sW (TCP Window scan)
           Window scan is exactly the same as ACK scan except that it exploits an implementation detail of certain systems to differentiate
           open ports from closed ones, rather than always printing unfiltered when a RST is returned. It does this by examining the TCP
           Window field of the RST packets returned. On some systems, open ports use a positive window size (even for RST packets) while
           closed ones have a zero window. So instead of always listing a port as unfiltered when it receives a RST back, Window scan lists
           the port as open or closed if the TCP Window value in that reset is positive or zero, respectively.

           This scan relies on an implementation detail of a minority of systems out on the Internet, so you can't always trust it. Systems
           that don't support it will usually return all ports closed. Of course, it is possible that the machine really has no open ports.
           If most scanned ports are closed but a few common port numbers (such as 22, 25, 53) are filtered, the system is most likely
           susceptible. Occasionally, systems will even show the exact opposite behavior. If your scan shows 1,000 open ports and three
           closed or filtered ports, then those three may very well be the truly open ones.
#	NOTE: We really only need to pull this out if you have tried scanning with the normal SYN SYN/ACK RST
#	flags/switches aren't returning anything.

=========================================================================================================================================

 The --packet-trace command is fire!! It's flipping basically CLI wireshark attached to NMAP. HOLY CRAP! Nerd Alert!


$ sudo nmap --ttl 70 192.168.0.0 --packet-trace
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 20:19 UTC
SENT (0.0939s) ICMP [10.0.0.106 > 192.168.0.0 Echo request (type=8/code=0) id=44222 seq=0] IP [ttl=70 id=65051 iplen=28 ]
SENT (0.0940s) TCP 10.0.0.106:45773 > 192.168.0.0:443 S ttl=70 id=61902 iplen=44  seq=3624209750 win=1024 <mss 1460>
SENT (0.0940s) TCP 10.0.0.106:45773 > 192.168.0.0:80 A ttl=70 id=36998 iplen=40  seq=0 win=1024 
SENT (0.0940s) ICMP [10.0.0.106 > 192.168.0.0 Timestamp request (type=13/code=0) id=61181 seq=0 orig=0 recv=0 trans=0] IP [ttl=70 id=15176 iplen=40 ]
SENT (2.0962s) ICMP [10.0.0.106 > 192.168.0.0 Timestamp request (type=13/code=0) id=63484 seq=0 orig=0 recv=0 trans=0] IP [ttl=70 id=48498 iplen=40 ]
SENT (2.0962s) TCP 10.0.0.106:45775 > 192.168.0.0:80 A ttl=70 id=57203 iplen=40  seq=0 win=1024 
SENT (2.0963s) TCP 10.0.0.106:45775 > 192.168.0.0:443 S ttl=70 id=29586 iplen=44  seq=3624340820 win=1024 <mss 1460>
SENT (2.0963s) ICMP [10.0.0.106 > 192.168.0.0 Echo request (type=8/code=0) id=26758 seq=0] IP [ttl=70 id=3065 iplen=28 ]
Note: Host seems down. If it is really up, but blocking our ping probes, try -Pn
Nmap done: 1 IP address (0 hosts up) scanned in 3.14 seconds






























