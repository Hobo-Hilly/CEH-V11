    Filename: eccouncil-ceh31250-v11-2-12-1-whois-and-dns-recon.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: WHOIS and DNS Recon

================================================================================
WHOIS and DNS Recon
Objectives:

    Attain actionable target information like organization owner, name server details, and contact details
    Collect detailed DNS information about target network environment
    Utilize DNS info to create detailed network map

    How familiar should we be with utilizing WHOIS?
        Thick Model
            Contains complete info such as...
                Administrative
                Billing
                Technical Contact
                Domain info
        Thin Model
            Only contains the domain's registrar Whois server

    Can you show us?
        Whois demo
            It never hurts to VERIFY your target!
# ex: go into the URL and enter: http://whois.domaintools.com/(the domain name you wish to perform the quiery on)
# or you can type it into box on landing page whois.domaintools.com
# Tool is meant for getting specific informatio about the co.

===================================================================

Domain Name Service information



    Let's move on to DNS. What info do we get targeting DNS?
        IP Addresses
        Domain Names
        Mail Server Info
            Demo
                nslookup
# $ nslookup
# >
	- this is interactive mode.

# $ nslookup itpro.tv
# > $ nslookup itpro.tv
# Server:         75.75.75.75
# Address:        75.75.75.75#53

# Non-authoritative answer:
# Name:   itpro.tv
# Address: 65.8.158.75
# Name:   itpro.tv
# Address: 65.8.158.44
# Name:   itpro.tv
# Address: 65.8.158.124
# Name:   itpro.tv
# Address: 65.8.158.123

	- these are the results if you run it 'in line' 
	- we now have 4 good ip addresses that are probably 'in scope' that we can enumerate.
                
		
		dig
# $ dig itpro.tv

# $ sudo dig itpro.tv      

# ; <<>> DiG 9.18.0-2-Debian <<>> itpro.tv
# ;; global options: +cmd
# ;; Got answer:
# ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28015
# ;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

# ;; OPT PSEUDOSECTION:
# ; EDNS: version: 0, flags:; udp: 512
# ;; QUESTION SECTION:
# ;itpro.tv.                      IN      A

# ;; ANSWER SECTION:
# itpro.tv.               60      IN      A       65.8.158.124
# itpro.tv.               60      IN      A       65.8.158.123
# itpro.tv.               60      IN      A       65.8.158.44
# itpro.tv.               60      IN      A       65.8.158.75

# ;; Query time: 52 msec
# ;; SERVER: 75.75.75.75#53(75.75.75.75) (UDP)
# ;; WHEN: Sun Mar 06 23:15:02 UTC 2022
# ;; MSG SIZE  rcvd: 101




                dnsrecon

$ dnsrecon -d itpro.tv                                          2 ⨯
[*] std: Performing General Enumeration against: itpro.tv...
[-] DNSSEC is not configured for itpro.tv
[*]      SOA ns-1770.awsdns-29.co.uk 205.251.198.234
[*]      SOA ns-1770.awsdns-29.co.uk 2600:9000:5306:ea00::1
[*]      NS ns-1387.awsdns-45.org 205.251.197.107
[*]      NS ns-1387.awsdns-45.org 2600:9000:5305:6b00::1
[*]      NS ns-1770.awsdns-29.co.uk 205.251.198.234
[*]      NS ns-1770.awsdns-29.co.uk 2600:9000:5306:ea00::1
[*]      NS ns-969.awsdns-57.net 205.251.195.201
[*]      NS ns-969.awsdns-57.net 2600:9000:5303:c900::1
[*]      NS ns-1.awsdns-00.com 205.251.192.1
[*]      NS ns-1.awsdns-00.com 2600:9000:5300:100::1
[*]      MX itpro-tv.mail.protection.outlook.com 104.47.66.10
[*]      MX itpro-tv.mail.protection.outlook.com 104.47.55.138
[*]      A itpro.tv 65.8.158.44
[*]      A itpro.tv 65.8.158.124
[*]      A itpro.tv 65.8.158.123
[*]      A itpro.tv 65.8.158.75
[*]      TXT itpro.tv pardot425902=a376ba8004c849d65408306f9b7f611a65203141ec6db1fd2b06ccb1c39aa2e2
[*]      TXT itpro.tv v=spf1 mx include:spf.protection.outlook.com include:sendgrid.net include:spf.mandrillapp.com include:infusionmail.com include:aspmx.pardot.com ~all
[*]      TXT itpro.tv ZOOM_verify_K8b8psiMRfmpGrczz3gZFA
[*]      TXT itpro.tv _globalsign-domain-verification=2tOHYqCn-AuPI_4_CItvlG6WgOg9X7avCngwEUt3uu
[*]      TXT itpro.tv google-site-verification=kyWR7tSlMtFaOB0iRgxFcVqOjzku6HKckMwuSUY9sGU
[*]      TXT _domainkey.itpro.tv t=y; o=~;
[*] Enumerating SRV Records
[+]      SRV _sip._tls.itpro.tv sipdir.online.lync.com 52.112.66.11 443
[+]      SRV _sip._tls.itpro.tv sipdir.online.lync.com 2603:1037:0:6::b 443
[+]      SRV _sipfederationtls._tcp.itpro.tv sipfed.online.lync.com 52.112.65.139 5061
[+]      SRV _sipfederationtls._tcp.itpro.tv sipfed.online.lync.com 2603:1037:0:f::f 5061
[+] 4 Records Found



===========================================================================================================================================


    I've heard Zone Transfers are the ultimate goal for DNS enumeration. Why is that?
        Meant to transfer all DNS info from Primary server to Secondary
        Will give you a LOT of info
        Great for helping attackers map out the target network
            Spoofing
            Social Engineering

    How would we perform a Zone Transfer?
        Demo
            dig axfr @nsztm1.digi.ninja zonetransfer.me
            https://digi.ninja/projects/zonetransferme.php

# zonetransfer.me is the domain name for diginija

digininja

# $ dig axfr @nsztm1.digi.ninja zonetransfer.me

- What is a zone transfer?

	Zone transfer is the process of copying the contents of the zone file on a primary DNS server to a secondary DNS server.

	
- How does zone transfer work?

	Zone transfer is the process of copying the contents of the zone file on a primary DNS server to a secondary DNS server. Using zone transfer provides fault tolerance by synchronizing the zone file in a primary DNS server with the zone file in a secondary DNS server.

# after executing the command we should now have all of the information that the true DNS server has.
# so if the true server were to ever become unavailable or we knocked it down so we could have people connect to us as the secondary server
# with this information we can start to map out networks and see what recources are available.
# mail exchange
# mapping ip addresses to hosts
# a receords


	Footprinting and reconing is specifically for you to find out 
	what the system is so that you now how and where to attack it.

















