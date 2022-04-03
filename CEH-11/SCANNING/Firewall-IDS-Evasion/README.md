    Filename: eccouncil-ceh31250-v11-3-16-1-ids-and-firewall-evasion.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: IDS and Firewall Evasion ================================================================================

IDS and Firewall Evasion
Objectives:

    List common network scanning IDS/Firewall evasion techniques
    Demonstrate techniques using industry standard tools like nmap, hping3, ProxySwitcher, Tails, Whonix and VPNs

    Kathy
        Packet Fragmentation
            nmap -f
# This works because the packets are broken up into small bits and pieces
# and sent to the target address.
# Since the scan technically isn't breaking any rules. i.e. meeting
# any of the criteria set by the IDS/Firewall as 'Malicious' traffic
# because its just bits and pieces of a packet.
# so they just let it through.

Once they all reach the target and the target machine reassembles the 
mess and discovers its a packet. It executes the packet and responds
to our request/scan

 -f (fragment packets); --mtu (using the specified MTU)
           The -f option causes the requested scan (including host discovery scans) to use tiny fragmented IP packets. The idea is to split
           up the TCP header over several packets to make it harder for packet filters, intrusion detection systems, and other annoyances to
           detect what you are doing. Be careful with this! Some programs have trouble handling these tiny packets. The old-school sniffer
           named Sniffit segmentation faulted immediately upon receiving the first fragment. Specify this option once, and Nmap splits the
           packets into eight bytes or less after the IP header. So a 20-byte TCP header would be split into three packets. Two with eight
           bytes of the TCP header, and one with the final four. Of course each fragment also has an IP header. Specify -f again to use 16
           bytes per fragment (reducing the number of fragments).  Or you can specify your own offset size with the --mtu option. Don't also
           specify -f if you use --mtu. The offset must be a multiple of eight. While fragmented packets won't get by packet filters and
           firewalls that queue all IP fragments, such as the CONFIG_IP_ALWAYS_DEFRAG option in the Linux kernel, some networks can't afford
           the performance hit this causes and thus leave it disabled. Others can't enable this because fragments may take different routes
           into their networks. Some source systems defragment outgoing packets in the kernel. Linux with the iptables connection tracking
           module is one such example. Do a scan while a sniffer such as Wireshark is running to ensure that sent packets are fragmented. If
           your host OS is causing problems, try the --send-eth option to bypass the IP layer and send raw ethernet frames.

           Fragmentation is only supported for Nmap's raw packet features, which includes TCP and UDP port scans (except connect scan and FTP
           bounce scan) and OS detection. Features such as version detection and the Nmap Scripting Engine generally don't support
           fragmentation because they rely on your host's TCP stack to communicate with target services.
=====================================================================

Decoy == obfuscating who is doing the scanning. It $ nmap -D

┌──(root💀kali)-[/home/kali]
└─# sudo nmap -D 10.0.0.101,10.0.0.102,10.0.0.103 10.0.0.106 -n -Pn
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 22:29 UTC
Nmap scan report for 10.0.0.106
Host is up (0.000013s latency).
All 1000 scanned ports on 10.0.0.106 are in ignored states.
Not shown: 925 closed tcp ports (reset), 75 filtered tcp ports (no-response)

Nmap done: 1 IP address (1 host up) scanned in 8.12 seconds
# Whats going on?
	-D 	# turns on decoy mode in Nmap
	{ List of decoy ip's }
	followed by <target ip>

        Source 
        Source 
        Source 
        IP Address Decoy
            nmap -D <decoy1>,<decoy2> targetIP

        Source IP Address Spoofing
            nmap -S <SPOOF_IP> targetIP




        Source Port Modification/Manipulation
            Use a port that's not being filtered by the target
                i.e. 80,53,443,3389,etc
                    nmap -g <PORT>: any given port
		or
		    nmap --source-port

# Using port 80 as the source port may allow our traffic to slip through
# because it gets confused as regular http traffic.
# We are obviously counting on this.
# We are trying to camouflage ourselves as coming from a port that is
# Typically allowed for open communications 

# Using port 443 '' '' HTTPS is the disguise when we use 443

# Using port 53 ''  '' Doman Name Server DNS is almost always needed at one scale or another

# Using 3389 ''  '' This is typically a  Remote Desktop Protocol for microsoft



        Randomizing Hosts
            nmap --randomize-hosts
If you are scanning something in sequence. You are going to 
set off a huge ALARM!
If you can a block of IP's in sequence it will set off red flads everywhere
DO NOT scan in sequence ever.

┌──(root💀kali)-[/home/kali]
└─# sudo nmap --randomize-hosts 10.0.0.101,10.0.0.102,10.0.0.103 10.0.0.106 -n -Pn








------------------------------------------------------------------

PROXIY CHAINING:
 Just an intermediary: The proxy will scan our target for us and then
 it will receive the information back from the scan as well
Once it gets the results it sends the data along to us.

- The more proxys you use the more obfuscated you become and the
  longer your scans will take.


        Proxy Servers
            nmap --proxies
┌──(root💀kali)-[/home/kali]
└─# sudo nmap --proxies 10.0.0.101,10.0.0.102,10.0.0.103 10.0.0.106 -n -Pn


        Anonymizers
            VPN
            TOR
                Tails
                Whonix

=================================================================
	 What is an IDS/IPS?

# An IDS system is an 'Alarm system' to say "I have noticed some
# strange activity. Let me raise my hand and tell someone."


	Firewalls  

# Alot like the bouncer at a night club check ip addresses
# to see if they're on the list to get it.
# Pass of Fail system. i.e. your on the list your in
# your not on the list your not in

When scanning we are searching for open doors or windows on the system
for us to crawl through.

And while we do this the IDS and Firewalls do their job.
By alerting the host " Hey! someone is scanning your network"


# So how do we get around these systems?? Heres how...

We will be using Nmap here but you need to use what works,
if Nmap doesn't work use someting else and if that doesn't work to 
your liking, chuck it and so on and so forth.

==================================================================






























































