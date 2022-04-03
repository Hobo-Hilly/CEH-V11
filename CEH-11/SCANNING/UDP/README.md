    Filename: eccouncil-ceh31250-v11-3-11-1-nmap-udp-scan.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap: UDP Scan ================================================================================

Nmap: UDP Scan
Objectives:

    Describe the process of an UDP scan
    Use nmap to perform an UDP scan to enumerate ports states and service detail
    Explain the pros and cons when utilizing this type of scan

    Kathy
        Connection-less protocol
            No 3-way handshake
# "Send me data. I'm not telling you if I received it or not but just send me data. If I get it i'll process it."  

# UDP doesn't care about dropping packets and it will not go looking for packets if they don't make it. It will not try to fill in the missing
# Data. UDP is open for data and when receives it, it processes it. It's great at that.
# Ex: A video stream of data is ok to drop packets, the focus with video streaming is that the packets get there ASAP not whether or not they
# all make it. If packets were dropped during a stream (which happnes fairly often) the picture may start to become pixelated, frezez or
# even show a balck screen. This is because packets have been dropped and since UDP just keeps rolling your screen eventually comes back.
# Usually Right after the 2 point conversion attempt and everyone is lining up for kick off but it comes back. 

# High Speed low drag service.



                Target response is different than TCP


    So how so we determine OPEN and CLOSED ports with a UDP scan?
        CLOSED
            Target responds with ICMP Port Unreachable message
# Hey, i notices your trying to send me data but I am actually not open on this port.



	OPEN
            Target DOESN'T RESPOND!
# If it's open, it just processes the data. No fucks given lol.




    Time for a demo!
        sudo nmap -sU -p 22,69 <metasploitable-IP> --packet-trace
            See the SENT packets
            See the Port Unreachable message for port 69
            See the Resend to port 69



┌──(root💀kali)-[/home/kali]
└─# nmap -sU -p 22,69 50.116.20.151 --packet-trace | tee example.txt

Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 05:18 UTC
SENT (0.0883s) ICMP [10.0.0.106 > 50.116.20.151 Echo request (type=8/code=0) id=29068 seq=0] IP [ttl=54 id=40582 iplen=28 ]
SENT (0.0884s) TCP 10.0.0.106:51539 > 50.116.20.151:443 S ttl=48 id=12054 iplen=44  seq=1782470524 win=1024 <mss 1460>
SENT (0.0884s) TCP 10.0.0.106:51539 > 50.116.20.151:80 A ttl=40 id=40305 iplen=40  seq=0 win=1024
SENT (0.0884s) ICMP [10.0.0.106 > 50.116.20.151 Timestamp request (type=13/code=0) id=44021 seq=0 orig=0 recv=0 trans=0] IP [ttl=41 id=14845 ipl>
RCVD (0.1611s) TCP 50.116.20.151:80 > 10.0.0.106:51539 R ttl=43 id=0 iplen=40  seq=1782470524 win=0
SENT (0.4405s) UDP 10.0.0.106:51795 > 50.116.20.151:69 ttl=42 id=16886 iplen=47
SENT (0.4406s) UDP 10.0.0.106:51795 > 50.116.20.151:22 ttl=57 id=1075 iplen=28
RCVD (0.5103s) ICMP [50.116.20.151 > 10.0.0.106 Port 69 unreachable (type=3/code=3) ] IP [ttl=43 id=17353 iplen=75 ]
RCVD (0.5133s) ICMP [50.116.20.151 > 10.0.0.106 Port unreachable (type=3/code=3) ] IP [ttl=43 id=17354 iplen=56 ]
Nmap scan report for 50-116-20-151.ip.linodeusercontent.com (50.116.20.151)
Host is up (0.072s latency).

PORT   STATE  SERVICE
22/udp closed ssh
69/udp closed tftp

Nmap done: 1 IP address (1 host up) scanned in 0.55 seconds
















    What are our Pros/Cons with this type of scan?
        It's slow
        Needs root privs
        That said, you may catch malicious traffic of an attacker using UDP
