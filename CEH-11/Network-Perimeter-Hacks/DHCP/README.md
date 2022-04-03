    Filename: eccouncil-ceh31250-v11-8-2-1-dhcp-sniffing-attacks.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Sniffing
    Episode Name: DHCP Sniffing Attacks ================================================================================

DHCP Sniffing Attacks
Objectives:


How it works.You connect a host to the network. If the network is configured to utilize DHCP to gather its networking information and 
configuration. Well then it will reach out and say, hey, any DHCP servers out there that would be willing to give me that information, 
if there is one will respond and say, I would love to do that for you. And then it gives that information out, acknowledges that it occurs 
and you have IP information, DNS information. Gateway configuration, all sorts of great stuff that happens and you can access the network, 
talk to other hosts onset network, reach out to the inner, whatever you need.



    Describe how DHCP works
    List and describe common vulnerabilities and attacks against DHCP

    How does DHCP work?
        DORA
            Discover
            Offer
            Request
            Acknowledgment
                Demo: dhclient and Wireshark

    Common attacks?
        Rogue DHCP
            Connects targets to rogue network (maybe, gotta win the race or trick user)
                DHCP sets...
                    IP addresses
                    DNS info
                    Gateway info
            Results in...
                DoS attack
                    Users that connect to rogue DHCP have no actual network access
                Set's attacker as default gateway
                    Gateway bound traffic is intercepted by attacker
                        MitM can occur (forward traffic to real gateway)
                Set's attacker as DNS
                    Attacker can serve fake websites
                        Credential Harvesting
                        Sensitive info stealing
