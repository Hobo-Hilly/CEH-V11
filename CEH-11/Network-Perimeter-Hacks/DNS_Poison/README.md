    Filename: eccouncil-ceh31250-v11-8-4-1-dns-poisoning.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Sniffing
    Episode Name: DNS Poisoning ================================================================================

DNS Poisoning
Objectives:

    List and describe common DNS poisoning attack techniques and tools

#    DNS basics
        Resolve domains to IP
            Windows DNS Lookup order
                Checks self (am I the device I'm looking for?)
                Checks DNS Resolver Cache
                Checks the Hosts file (do I already know where this is?)
                Checks with DNS Servers

#    DNS Attacks
        Modifying hosts DNS info
        Tricks hosts to query malicious DNS
            Host file entries
            Malicious proxy

#    DNS cache poisoning
        Tricking clients into thinking that attacker is legit DNS
            Redirect targets to malicious sites
        DEMO: Ettercap for DNS poisoning
            Modify etter.dns file to have fake A records
            Copy from Kali /Tools/fakeArec.txt
            Change IP to match IP of bWAPP
            Run ettercap GUI
            Scan for hosts
            Add DNS server IP(192.168.241.1) to Target1
            Add victim IP(192.168.241.x) to Target2
            Ettercap Menu(3 dots) > Plugins > Manage Plugins > dns_spoof
            MITM menu > ARP Poisoning
            ping www.facebook.com from target
            ipconfig /displaydns

    DNS Poisoning and Spoofing Tools
        Ettercap
        DNS Spoof
        DerpNSpoof
