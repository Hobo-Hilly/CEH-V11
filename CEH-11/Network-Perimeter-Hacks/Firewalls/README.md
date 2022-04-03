    Filename: eccouncil-ceh31250-v11-12-2-1-firewalls.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Evading Firewalls, IDS, and Honeypots
    Episode Name: Firewalls ================================================================================

Firewalls
Objectives:

    Define what an IDS/IPS is and explain its function and basic process
    List and define the different types of IDS/IPS

    What is a firewall?
        Could be Hardware or Software
            Why not both?
        Doorman (are you on the list?)
            Demo simple ACL with iptables

┌──(root💀kali)-[/home/kali]
└─# iptables       
iptables v1.8.7 (nf_tables): no command specified
Try `iptables -h' or 'iptables --help' for more information.
                                                                      
┌──(root💀kali)-[/home/kali]
└─# iptables -A INPUT -p icmp -s 10.0.0.106/24 -j DROP            2 ⨯
                                                                      
┌──(root💀kali)-[/home/kali]
└─# sudo iptables -L INPUT
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
DROP       icmp --  10.0.0.0/24          anywhere            
                                                                      
┌──(root💀kali)-[/home/kali]
└─# 


    How are firewalls typically deployed?
        A couple of different ways
-            Gateway/Bastion Host

# One of them is gonna be a, as a gateway or a bastion host, maybe combination of those two, so sitting on the edge of your network, all traffic 
# comes to me and I we'll handle it. I will look at my list. If you're on the list, you get to go through, if you're not on the list, I'm so sorry, please try again later. And a bastion host is typically some administrative box that sits on the other side of that and can basically send traffic where it needs to go or you can work with the firewall.



-            DMZ or 'Screened Subnet'
# DMZs are wildly popular and for good reason because it allows you to separate out untrusted networks from trusted networks. And then if you 


- have. Devices or services that need to sit in an in between land, things like a web server, right. What does the website you have to do? It has 

- to be visible by the untrusted network. That is known as the Internet. That's just the nature of the beast, right. And then you have your trusted 

- network that's gonna be your internal host, things like a database, which might be the back end server for your web server. Maybe it's reaching 

- into a database for information. So, firewall can be set up to create a DMZ, the demilitarized zone to keep all that traffic and happy cohabitation 

- with ever letting them cross paths, right. So the firewall will say, if you're looking for web services, no problem, anybody come on in. It's right 

- over here, there's your web server. But if somebody comes from the outside from the Internet saying, well, I wanna access the database directly. 

- He goes, no, you don't. 



----------------------------------------------------




- If you need to access the database, you go through the website. Okay, well I'm gonna get to the web server and now I can get a front end, 

- I can click my records and they pull forward. I see the web server sits in that middle ground and it goes, you need a record. Cool, I'll get 

- that for you because it is connected to the trusted area, so reaches back to the old database, server pulls that record and says, here, there 

- you go. And you as the outsider never touched that. And that's why we call that a demilitarized zone and a firewall separates that traffic up.


-            Multi-homed

=======================================================================================================
ACL == Access Control List   CiScO Router

    Firewall Technology Types

-        Packet Filtering
	Basic Packet filtering like we did earlier with 'iptables'


-        Circuit-Level Gateway
	"Man in the Middle" (Helping Style) ish attack. ' You create a connection with me and 'I' will make the connection to where you want to go.'


-        Application-Level
        Stateful (combo of Packet+Circuit+Application)
        Proxy
        NAT
# Network Access Translation

- Network address translation is a method of mapping an IP address space into another by modifying network address information in the IP header 
- of packets while they are in transit across a traffic routing device.

'
- Now adding a network address translation, you set up your router to say I'm the single point outs and everything is kinda hidden behind me cuz 
- we're sharing my IP address. I'm the only device, I'm the router, I'm the only device has a public IP, everything else, I'm gonna do some 
- sort of translation, usually through a port translation. So you signed support to the internal IP addresses. They're trying to make its way 
- out. The router keeps basically a table of where that is being addressed to and it makes the request on its behalf returns and goes, okay, 
- destined for this, damn, it sends it on its way, it can do filtering because that and it keeps you safe from the outside world. Because no one 
- can make a direct connection without some sorta forward, right? Then you have or if you allow something to go out, it makes the request. So 
- if you've got malware or something and request its way out, it would work just fine.

        VPN



#    Firewall Evasions
-        Firewalking for detection
-        IP Spoofing
-        Fragmentation
-        Proxy
-        Tunneling Traffic
-            SSH
-            HTTP
-            ICMP
-            DNS
-        MITM
-        Social Engineering/Phishing

#    Defense against evasions?
-        Implicit Deny
-        Rules for both Ingress AND Egress
-        Regular updates
-        Regular rule testing and review
-        Logging and monitoring

