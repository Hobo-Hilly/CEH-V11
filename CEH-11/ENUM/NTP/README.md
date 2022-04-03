    Filename: eccouncil-ceh31250-v11-4-5-1-ntp-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: NTP Enumeration ================================================================================

NTP Enumeration
Objectives:

    Explain the function of the NTP service
    Describe the common attributes of the NTP service
    Employ NTP commands and tools to reveal NTP service versioning, hostname, and IP address

    What does NTP do for us?
        Sync time/date settings
            Why is this important?
                Many network services utilize time as a metric for admin/security

# So these need to be sync for time sensitive applications to correctly function. i.e. kerberos 


    What are some of the attributes of NTP that we need to be aware of?
        UDP port 123
            sudo nmap -sU -n -Pn -p 123 target_IP
        Maintain time within 10ms
        Can achieve time accuracy of 200 micro seconds... whoa



    Enough of the pleasantries, how do we enumerate NTP?


# In the search bar @ shodan.io  

ntp
click search
read results



NOTE: There is more then one protocol.

    shodan search for NTP for good target(s)

        ntpdate
            -d (debug info)

''

┌──(root💀kali)-[/home/kali]
└─# ntpdate -d 103.3.76.225                   
16 Mar 03:03:24 ntpdate[2897]: ntpdate 4.2.8p15@1.3728-o Wed Sep 23 11:46:38 UTC 2020 (1)
Looking for host 103.3.76.225 and service ntp
103.3.76.225 reversed to 225.76.3.103.iconpln.net.id
225.76.3.103.iconpln.net.id forward check lookup fail: Name or service not known
host found : 103.3.76.225 (225.76.3.103.iconpln.net.id)
transmit(103.3.76.225)
receive(103.3.76.225)
transmit(103.3.76.225)
receive(103.3.76.225)
transmit(103.3.76.225)
receive(103.3.76.225)
transmit(103.3.76.225)
receive(103.3.76.225)

server 103.3.76.225, port 123
stratum 3, precision -8, leap 00, trust 000
refid [10.14.4.23], root delay 0.020340, root dispersion 0.136307
reference time:      e5dba907.cdd717d9  Wed, Mar 16 2022  0:08:39.804
originate timestamp: e5dbc3eb.9715b219  Wed, Mar 16 2022  2:03:23.590
transmit timestamp:  e5dbd204.9afe331d  Wed, Mar 16 2022  3:03:32.605
filter delay:  0.37175    0.32173    0.27214    0.32494   
               ----       ----       ----       ----      
filter offset: -3609.1824 -3609.1614 -3609.1366 -3609.1629
               ----       ----       ----       ----      
delay 0.27214, dispersion 0.02470, offset -3609.136625

16 Mar 03:03:32 ntpdate[2897]: step time server 103.3.76.225 offset -3609.136625 sec

''

----------------------------------------------------------------------

# Using Ip's out of shodan.io
# search ntp
         ntptrace
            Trace NTP servers to source
                Could help map out network resources

''

┌──(root💀kali)-[/home/kali]
└─# ntptrace 103.3.76.225
103.3.76.225: timed out, nothing received
***Request timed out


''


        ntpq & ntpdc
            host target_IP
            version
┌──(root💀kali)-[/home/kali]
└─# ntpq                   
ntpq> help
ntpq commands:
:config          drefid           mreadlist        readvar          
addvars          exit             mreadvar         reslist          
apeers           help             mrl              rl               
associations     host             mrulist          rmvars           
authenticate     hostnames        mrv              rv               
authinfo         ifstats          ntpversion       saveconfig       
cl               iostats          opeers           showvars         
clearvars        kerninfo         passociations    sysinfo          
clocklist        keyid            passwd           sysstats         
clockvar         keytype          peers            timeout          
config-from-file lassociations    poll             timerstats       
cooked           lopeers          pstats           version          
cv               lpassociations   quit             writelist        
debug            lpeers           raw              writevar         
delay            monstats         readlist         
ntpq> host 
current host is localhost
ntpq> host 
current host is localhost
ntpq> 103.3.76.225
***Command `103.3.76.225' unknown
ntpq> host 103.3.76.225
current host set to 103.3.76.225
ntpq> 
            peers

















