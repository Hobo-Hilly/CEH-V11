    Filename: eccouncil-ceh31250-v11-4-1-1-enumeration-basics.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: Enumeration Basics ================================================================================

Enumeration Basics
Objectives:

    Define Enumeration
    List assets targeted during Enumeration process
    List and describe Enumeration techniques
    Recognize common ports and services targeted during Enumeration

    Kathy - I've heard you using the term 'Enumeration' in many of our episodes already. Can you formally define that for us?
F.F. robots.txt disallows?

        Discovering and listing target information
            Network hosts
            Network services
            Network shares
            User accounts
            Email addresses
            Groups

    How is this done?
        Brute-force
        Guessing
        Defaults
        Banners
        Email
        SNMP
        Zone Transfers
        Network sniffing

    What are a few common ports and services targeted for enumeration?
        Could be any port/service that is discovered
        Here are a few common
            NetBIOS              #  Network Basic Input/Output System

#  IMPORTANT NOTE: NetBIOS is an acronym for Network Basic Input/Output System. 
#	It provides services related to the session layer of the OSI model allowing applications 
#	on separate computers to communicate over a local area network. 
#	As strictly an API, NetBIOS is not a networking protocol.



            SNMP:161 (UDP)		# Simple Network Management Protocol
#	Simple Network Management Protocol is an Internet Standard protocol 
#	for collecting and organizing information about managed devices on 
#	IP networks and for modifying that information to change device behaviour. 



            LDAP:389 (TCP/UDP)           # windows active directory is an LDAP system

#	The Lightweight Directory Access Protocol is an open, vendor-neutral, 
#	industry standard application protocol for accessing and maintaining 
#	distributed directory information services over an Internet Protocol 



            HTTP(s):80,443 (TCP)
#	The Hypertext Transfer Protocol is an application layer protocol in the 
#	Internet protocol suite model for distributed, collaborative, hypermedia 
#	information systems.




            NTP:123 (UDP)
#	The Network Time Protocol is a networking protocol for clock synchronization between computer systems 
#	over packet-switched, variable-latency data networks. In operation since before 1985, NTP is one of the oldest 
#	Internet protocols in current use. NTP was designed by David L. Mills of the University of Deleware




            NFS:2049 (TCP)
#	Network File System is a distributed file system protocol originally developed by 
#	Sun Microsystems in 1984, allowing a user on a client computer to access files over 
#	a computer network much like local storage is accessed. 




            SMTP:25 (TCP)
#	The Simple Mail Transfer Protocol is an internet standard communication protocol for electronic mail transmission.
#	 Mail servers and other message transfer agents use SMTP to send and receive mail messages.




            DNS:53 (TCP/UDP)

#	The Domain Name System is the hierarchical and decentralized naming system used to identify 
#	computers, services, and other resources reachable through the Internet or other Internet Protocol networks. 
#	The resource records contained in the DNS associate domain names with other forms of information
===================================================================

#Examples: 
┌──(root💀kali)-[/home/kali]
└─# nmap -T4 -n -Pn -p- 50.116.20.151 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 23:25 UTC
Nmap scan report for 50.116.20.151
Host is up (0.080s latency).
Not shown: 65527 closed tcp ports (reset)
PORT    STATE    SERVICE
22/tcp  open     ssh
25/tcp  filtered smtp
135/tcp filtered msrpc
136/tcp filtered profile
137/tcp filtered netbios-ns
138/tcp filtered netbios-dgm
139/tcp filtered netbios-ssn
445/tcp filtered microsoft-ds

Nmap done: 1 IP address (1 host up) scanned in 60.75 seconds

so now we go through each and EVERY port trying to connect to it
 and enumerate it further.
 get anything you can!










