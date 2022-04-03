    Filename: eccouncil-ceh31250-v11-12-1-1-ids-and-ips.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Evading Firewalls, IDS, and Honeypots
    Episode Name: IDS and IPS ================================================================================

IDS and IPS
Objectives:

    Define what an IDS/IPS is and explain its function and basic process
    List and define the different types of IDS/IPS

#    What is an IDS?
        Network traffic inspection for known attack signatures/behaviors
            Protocol Anomaly Detection
        Placement can be inside, outside, or on both sides of your network
            Detection generates an alert

#    What is an IPS?
        Like an IDS, but can take action to stop detected attacks
            "Active" IDS

#    Types of Intrusion Detection and Prevention Systems
-        Network Based

** Check Bottom
-        Host Based


#    IDS/IPS Alert Types
-        True Positive => Attack detected & Alert Sent
-        False Positive => False Alarm (no attack but Alert was sent)
-        True Negative => No attack and therefore no Alert
-        False Negative => Attack not detected & no Alert

#    IDS/IPS Solutions
-        Snort 		# Check the bottom of the notes for a better description of snort
            Snort Rules found in /etc/snort/rules/
                Check out scan.rules
                    Explain some of the details of a rule
                        Mention custom rules
-            DEMO Snort
                FROM LINUX LITE
                sudo snort -A console -q -c /etc/snort/snort.conf -i ens33 -K ascii
                    -A = Alert Type
                    -q = Quiet. Don't show banner or status report
                    -c = Config file
                    -i = Network adapter
                    -K = Output type (default is pcap)
-                FROM PARROT
                    sudo nmap -sX -n -Pn -F 192.168.241.136
-                LOGS
                    /var/log/snort/IP/
                        cat files in that dir for packet info (sudo needed)

        Bro/Zeek
        AlienVault
        Suricata
        Mobile

#    IDS/IPS Evasions
        We've talked about some already
-            Packet Fragmentation
-	     hpin3, nmap, etc
-            Decoys
-            Obfuscations

#    Defenses
-        Baselines
	Fine tuning your idp and ips. Continuously updating the rules with the latest network activity so it can learn and get smarter

-        Updates and patches



-        Block known-bad

	Bad IP's or domains



### Bottom

So hardware base is gonna be an appliance, a thing that has metal and buttons and things and a power cable in it. And you probably stick it in 

a rack somewhere, and it does IDS IPS, whatever maybe both, right? Technically an IPs is an IDS with further capabilities. So I don't know why 

we kind of the linear between the two, but it very well may just be an IDS or it could as well be an IPS. Okay, so there's a hardware piece that 

goes into a rack, it's the network traffic is flowing directly from the internet, all network traffic directly into it. And then it is evaluating 

that traffic so that it could alert if it is an IPS, it will then stop the traffic if is kind of like set up a a mini firewall for hey, you're 

a bad person, you've been doing something bad bam. Firewalled out, right? No more soup for you. So yeah, that's what host space is gonna be that 

I install some sort of software into my different hosts. And they will be doing that and we're soaking up some of the resources from those 

local device



#SNORT

So basically, what it's doing is it's going to capture the traffic to this machine that's coming, this machine is going to look at it, analyze 

it and if anything goes wrong, it's gonna alert.























