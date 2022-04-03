    Filename: eccouncil-ceh31250-v11-8-5-1-sniffing-defenses.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Sniffing
    Episode Name: Sniffing Defenses ================================================================================

Sniffing Defenses
Objectives:

    List and detail common defensive tactics and tools used to detect and prevent common sniffing attacks

# So we got things like encryption, right, don't use unsecure protocols. Use encryption protocols or secure protocols, 
# so instead of FTP, use SFTP, instead of telnet, use SSH, instead of http, use https, you get the idea right, down the 
# list, this honestly should be a no brainer. If you find unencrypted protocols as an ethical hacker in an engagement 
# that are being utilized, things are passing along the wire in clear text that is gonna be a big deal.

-    Sniffing Defenses?
        Encryption
        Physical security (no attaching hardware sniffers)
        Static ARP and/or IP
        Use IPv6
        IDS to detect sniffing
        Promiscuous mode scanner

-    Switch based attacks
        Defenses?
            Switch Port Security (port-security)
            DHCP Snooping and Binding Tables
                Records info on untrusted devices (MAC,VLAN,IP,Lease Time, etc)
                    Works like a firewall between trusted and un-trusted devices
            Port-based NAC
            Dynamic ARP Inspection
            Disable Trunk auto-negotiation
                For both access ports and trunk ports
            Don't use the Default VLAN (double-tagging)
            Change Native VLANs to unused ID (double-tagging)
            Force Native VLAN tagging (double-tagging)
-            STP Attacks
             Standard Trunk Protocol   
		BPDU Guard (disables unauthorized ports after sending BPDUs)
                Root Guard (ensures status of the current Root-Bridge)

-    DNS Defenses
        DNSSEC

        Block outbound traffic from UDP 53
#DNS uses UDP TCP port 53. If we block the outbound traffic DNS won't function fully and it should stop or at least slow the attacker

        Restrict external DNS queries
# Use a whitelist and control which 

# If I restrict maybe through a lot like a white list of what DNS is allowable and what and everything else isn't, then I got to worry about them being sent off to attacker DNS land. They're not gonna get there, I have a mechanism that blocks that, that's not proper DNS so not happening


            DNS Sinkhole
#  DNS sink holding is a great way to kind of accomplish that. So if you see DNS queries to stuff that you don't know about, you don't know where that goes. It's just sends it off into nothing land and I want to see stuff that is approved. 




        Encryption of DNS traffic




-----------------------------------------------------------------------------------------------------------------------------------------
