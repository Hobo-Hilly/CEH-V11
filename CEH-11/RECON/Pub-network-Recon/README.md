    Filename: eccouncil-ceh31250-v11-2-13-1-public-network-footprinting.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: Public Network Footprinting

================================================================================
Public Network Footprinting
Objectives:

    Ascertain target network details such as IP range, internet-facing devices/servers, route path, and possible network-based security controls

    Question for Kathy
        ARIN (American Registry for Internet Numbers)
        Registration Data Access Protocol (RDAP)
            Search ARIN for IP address of target
# $ nslookup
# ip address from results for ARIN RDAP quiery

# Paste ip into the searchbox @ https://search.arin.net/rdap/


Network: NET-65-8-0-0-3

Source Registry
    ARIN

Net Range
    65.8.0.0 - 65.8.255.255     # block of ips the domain has been assigned
CIDR
    65.8.0.0/16
Name
    AMAZO-CF                  # Their website/server/service is purchased/hosted on amazon cloud servers so thats why we are seeing AMAZO-CF pop up in the results
Handle
    NET-65-8-0-0-3
Parent
    NET-65-8-0-0-2
Net Type
    ALLOCATION
Origin AS
    not provided

Registration
    Thu, 21 May 2020 19:27:00 GMT (Thu May 21 2020 local time) 
Last Changed
    Thu, 21 May 2020 19:27:00 GMT (Thu May 21 2020 local time) 
Self
    https://rdap.arin.net/registry/ip/65.8.0.0
Alternate
    https://whois.arin.net/rest/net/NET-65-8-0-0-3
Up
    https://rdap.arin.net/registry/ip/65.8.0.0/14
Port 43 Whois
    whois.arin.net

Related Entities
1 Entity

Source Registry
    ARIN

Kind
    Org
Full Name
    Amazon.com, Inc.
Handle
    AMAZON-4
Address
    1918 8th Ave
    SEATTLE
    WA
    98101-1244
    United States
Roles
    Registrant

Registration
    Mon, 23 Jan 1995 05:00:00 GMT (Mon Jan 23 1995 local time) 

# There is a lot more information but the short of it is. If we do nslookup and throw the ip's into ARIN we can see what a co. has for public facing network information
 
===================================================================

	How do we determine the route path to the target
        Traceroute
 

		ICMP
                tracert
                traceroute -I
            TCP
                traceroute -T
                tcptraceroute
    Any other traceroute-type tools?
        Path Analyzer Pro
            https://www.pathanalyzer.com
        VisualRoute
            https://www.visualroute.com
===================================================================

#Public facing network is what the attacker can see from the outside of a company looking in.
	
# So their websites, emails services, etc.

	What is a DMZ Demiliterised Zone
- This is a block of ip addresses that are both accessable to the 
 public facing internet and the priviate internal network as well.



# $ traceroute itpro.tv 
 traceroute to itpro.tv (65.8.158.124), 30 hops max, 60 byte packets
 1  10.0.0.1 (10.0.0.1)  4.103 ms  4.497 ms  4.929 ms   # This is our router. 
 2  96.120.103.9 (96.120.103.9)  13.832 ms  14.646 ms  14.594 ms     # this is how it hits the internet
 3  24.153.86.245 (24.153.86.245)  12.949 ms  14.989 ms  17.857 ms
 4  24.124.128.209 (24.124.128.209)  18.659 ms  18.556 ms  19.311 ms
 5  be-37-ar01.seattle.wa.seattle.comcast.net (68.86.96.5)  24.996 ms  25.757 ms  24.104 ms
 6  be-33650-cr01.seattle.wa.ibone.comcast.net (68.86.93.165)  26.554 ms  21.775 ms  22.256 ms
 7  be-1101-cs01.seattle.wa.ibone.comcast.net (96.110.40.81)  31.898 ms  29.310 ms  31.828 ms
 8  be-1112-cr12.seattle.wa.ibone.comcast.net (96.110.47.182)  28.855 ms  30.283 ms  29.169 ms
 9  be-304-cr12.portland.or.ibone.comcast.net (96.110.38.46)  35.684 ms be-303-cr12.portland.or.ibone.comcast.net (96.110.38.42)  34.671 ms be-301-cr12.portland.or.ibone.comcast.net (96.110.38.34)  34.640 ms
10  be-1112-cs01.portland.or.ibone.comcast.net (96.110.46.213)  34.611 ms  34.581 ms be-1212-cs02.portland.or.ibone.comcast.net (96.110.46.229)  34.117 ms
11  be-1411-cr11.portland.or.ibone.comcast.net (96.110.47.2)  38.276 ms be-1111-cr11.portland.or.ibone.comcast.net (96.110.46.210)  38.949 ms  39.663 ms
12  be-301-cr13.sunnyvale.ca.ibone.comcast.net (96.110.36.121)  39.538 ms be-304-cr13.sunnyvale.ca.ibone.comcast.net (96.110.39.53)  37.879 ms be-302-cr13.sunnyvale.ca.ibone.comcast.net (96.110.36.125)  39.458 ms
13  be-1113-cs01.sunnyvale.ca.ibone.comcast.net (96.110.46.9)  43.705 ms be-1213-cs02.sunnyvale.ca.ibone.comcast.net (96.110.46.21)  41.162 ms be-1113-cs01.sunnyvale.ca.ibone.comcast.net (96.110.46.9)  41.065 ms
14  be-3212-pe12.529bryant.ca.ibone.comcast.net (96.110.33.102)  41.801 ms be-3312-pe12.529bryant.ca.ibone.comcast.net (96.110.33.106)  37.551 ms be-3412-pe12.529bryant.ca.ibone.comcast.net (96.110.33.110)  38.339 ms
15  66.208.232.58 (66.208.232.58)  41.807 ms 50.242.149.166 (50.242.149.166)  42.483 ms 50.242.150.122 (50.242.150.122)  59.530 ms
16  52.93.141.165 (52.93.141.165)  41.707 ms * *
17  150.222.111.43 (150.222.111.43)  41.109 ms  40.586 ms *
18  * * *
19  * 150.222.30.70 (150.222.30.70)  48.908 ms *
20  15.230.36.189 (15.230.36.189)  38.130 ms  44.055 ms 15.230.36.177 (15.230.36.177)  44.717 ms
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  server-65-8-158-124.sfo53.r.cloudfront.net (65.8.158.124)  34.975 ms  37.624 ms  35.835 ms


# $ traceroute -I itpro.tv  # this forces the use of ICMP instead of TCP to figure out where the connection is bouncing jumping through. 


# C:\ tracetr # icmp by default?



KEY:
	 Anythig with *** means you either hit a firewall or something that didn't respond to the quiery




















