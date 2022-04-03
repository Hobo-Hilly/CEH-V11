    Define SNMP Enumeration
    Identify useful information that could be gathered through SNMP Enum
    Utilize common SNMP Enum tools like Snmpcheck to enumerate target info


    What is SNMP?
        A system of communication to relay status info
            Used for system health monitoring
                OS independent

The Moniotring software orein uses SNMP


    SNMP basics
        Managers - these are servers that manage all the info and makes it usable for the admins 
        Agents - Little pieces of software that reside on the hosts. That gather the info locally and shuffle it back to the manager whenever requested
        Trap  -  : Pre-set conditions in the network that may trigger an Alert to all the managers if the specific conditions are ever met.
            
	Informs Agent of events


        Community String
            Basically a password
            Default of 'public'
                Default of READ access
            'private' is another commonly used string
                Typically set to READ/WRITE


        Management Information Base (MIB)
            Database of objects that can be managed with SNMP

	-Each of the little things it can check for. i.e CPU, GPU, MotherBoard etc..

# They all have an OID  

        Object Identifier (OID)
            Identifies the MIB objects
# USE THE OID to pick through data.

    Enumeration Tools
        onesixtyone
        snmp-check

onesixtyone --help
onesixtyone: invalid option -- '-'
onesixtyone 0.3.3 [options] <host> <community>
  -c <communityfile> file with community names to try
  -i <inputfile>     file with target hosts
  -o <outputfile>    output log
  -p                 specify an alternate destination SNMP port
  -d                 debug mode, use twice for more information

  -s                 short mode, only print IP addresses

  -w n               wait n milliseconds (1/1000 of a second) between sending packets (default 10)
  -q                 quiet mode, do not print log to stdout, use with -l
host is either an IPv4 address or an IPv4 address and a netmask
default community names are: public private

Max number of hosts :           65535
Max community length:           32
Max number of communities:      16384


examples: onesixtyone 192.168.4.0/24 public
          onesixtyone -c dict.txt -i hosts -o my.log -w 100


	snmp-check -w 192.168.4.0/24

─# snmp-check --help                                              
snmp-check v1.9 - SNMP enumerator
Copyright (c) 2005-2015 by Matteo Cantoni (www.nothink.org)

 Usage: snmp-check [OPTIONS] <target IP address>

  -p --port        : SNMP port. Default port is 161;
  -c --community   : SNMP community. Default is public;
  -v --version     : SNMP version (1,2c). Default is 1;

  -w --write       : detect write access (separate action by enumeration);

  -d --disable_tcp : disable TCP connections enumeration!
  -t --timeout     : timeout in seconds. Default is 5;
  -r --retries     : request retries. Default is 1; 
  -i --info        : show script version;
  -h --help        : show help menu;
----------------------------------------------------------------------

┌──(root💀kali)-[/home/kali]
└─# snmp-check -w 192.168.4.0   
snmp-check v1.9 - SNMP enumerator
Copyright (c) 2005-2015 by Matteo Cantoni (www.nothink.org)

[+] Try to connect to 192.168.4.0:161 using SNMPv1 and community 'public'
[+] Write access check enabled

[!] 192.168.4.0:161 SNMP request timeout
















