    Filename: eccouncil-ceh31250-v11-3-7-1-nmap-stealth-scan.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap: TCP Stealth Scan ================================================================================

Nmap: TCP Stealth Scan
Objectives:

    Use nmap to perform a TCP Stealth scan to enumerate ports states and service details
    Explain the pros and cons when utilizing this type of scan

    What is a Stealth scan?
        AKA SYN Scan and Half-Open Scan
        Utilizes part of the TCP 3-way handshake

    Can you show us how to perform a Stealth scan with nmap?
        Demo

    Are there any advantages and/or disadvantages to using this type of scan?
        Advantages
            Much quieter than TCP Connect scans
            Faster
        Disadvanages
            Now detectable by IDS/IPS
            Requires admin privs
==================================================================


# NOTE: Nmap by default runs a 'stealth scan'
	so $ nmap < IP >    # This by default will run a stealth scan/half-open scan/SYN scan
	
#	The flag for a stealth scan is -sS

	so $ nmap -sS < IP >    # This is a TCP SYN scan or STEALTH scan

# Here is an example.
$ sudo nmap -sS 10.0.0.1  		# once I fire this off nmap is firing SYN packets to the top 1024 most commonly used ports per nmaps law 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-10 03:59 UTC
Nmap scan report for 10.0.0.1
Host is up (0.0098s latency).
Not shown: 990 closed tcp ports (reset)
PORT      STATE    SERVICE
22/tcp    filtered ssh
23/tcp    filtered telnet
53/tcp    open     domain
80/tcp    open     http
111/tcp   filtered rpcbind
443/tcp   open     https
9000/tcp  filtered cslistener
49152/tcp open     unknown
49153/tcp open     unknown
49154/tcp open     unknown
MAC Address: 48:4B:D4:4D:6D:50 (Technicolor CH USA)

Nmap done: 1 IP address (1 host up) scanned in 2.71 seconds

# So just to recap. when this ran it fired SYN packets to the TOP 1024 ports and any ports that respond to the SYN packet will be marked as open.

# The whole idea of using this method/type of scan is to see if we can't traverse a firewall or 2.


	Lets say you have a firewall that is blocking all TCP connection type scanning. So in order to get around this,
	we can fire off a SYN/Half-Open/Stealth scan. Because these scans are not making a full TCP connection they may 
	be able to ellicit a response from the machine. DOES NOT MEAN IT WILL just means there's a possiblity.

DISADVANTAGES

- This is an extremly noisey and will be picked up by ANY/ALL IDS or IPS system worth it's salt. Firewalls can block these no problem.
- You could create a snort rule which would throw an alert every time a scan like this took place

# What is SNORT?
     Snort is the foremost Open Source Intrusion Prevention System (IPS) in the world. Snort IPS uses a series of rules that help define malicious network activity and uses those rules to find packets that match against them and generates alerts for users

     Snort can be deployed inline to stop these packets, as well. Snort has three primary uses: As a packet sniffer like tcpdump, as a packet logger — which is useful for network traffic debugging, or it can be used as a full-blown network intrusion prevention system. Snort can be downloaded and configured for personal and business use alike.

# This also requires you to be root on kali or admin on windows to run this scan
# this is because we are opening and creating a TCP socket and kind of reaching into the raw data

ADVANTAGES

- it runs faster
- it's also a little quieter











































