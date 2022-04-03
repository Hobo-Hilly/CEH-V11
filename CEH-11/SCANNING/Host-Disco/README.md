    Filename: eccouncil-ceh31250-v11-3-4-1-host-discovery.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Host Discovery

================================================================================
Host Discovery
Objectives:

    Define host discovery and explain its function
    List host discovery techniques
    Describe the advantages and application of host discovery using ICMP, ARP, and UDP Ping scans
    Utilize common host discovery tools like nmap and Angry IP Scanner
    Identify and recall common security controls used to protect organizations against ping sweep scans

    What is 'host discovery' and what is its function?
    What are the common host discovery types/techniques?
        ICMP ECHO
        ARP
        UDP
    Can you show us some common tools for performing host discovery?
        Ping
        Angry IP Scanner
        nmap
            -sn
            -sL
# The -sL command in nmap does a reverse DNS lookup. It will discover hosts for us but keep in mind. It will NOT tell you if they are alive or not.
# This is just to search for addresses NOT see if they are alive or not 
# if it finds an address it prints it out
    Any other techniques we should be aware of?
        ICMP Timestamp and Address Mask
            Timestamp (-PP)
            Address Mask (-PM)
        SYN Ping (-PS)
        ACK Ping (-PA)
        Protocol Ping (-PO)
    Are there any security controls we can employ to protect us?
        Firewall
        IDS/IPS
        Rate-limit hosts running more than X-number of ICMP ECHO requests
        ACLs
        DMZs
===========================================================

nslookup scanme.nmap.org                                                                                                                     
Server:         75.75.75.75                                             
Address:        75.75.75.75#53                                                                                                                   
                                                                                                                                                 
Non-authoritative answer:                                                                                                                        
Name:   scanme.nmap.org                                                                                                                          
Address: 45.33.32.156                                                                                                                            
Name:   scanme.nmap.org                                                                                                                          
Address: 2600:3c01::f03c:91ff:fe18:bb2f# 


# $ sudo nmap -sL 45.33.32.0/24                                                                                                                  
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-07 19:00 UTC         
Nmap scan report for 45.33.32.0                                                                                                                  
Nmap scan report for gw-li982.linode.com (45.33.32.1)                                                                                            
Nmap scan report for 45.33.32.2                                                                                                                  
Nmap scan report for 45.33.32.3                                                                                                                  
Nmap scan report for li982-4.members.linode.com (45.33.32.4)                                                                                     
Nmap scan report for li982-5.members.linode.com (45.33.32.5)                                                                                     
Nmap scan report for li982-6.members.linode.com (45.33.32.6)            
[Ethical] 0:sudo  1:zsh ..... .... ... 

	This scan does not check to see if the host is alive!

# NMAP Host discovery EX:
# $ nmap  (-PE/PP/PM)   echo, timestamp, and netmask request discovery
 This is how to ping a machine that doesn't respond to ICMP echo requests. Alot of IDS systems will be blocking the ICMP ECHO request

























