    Filename: eccouncil-ceh31250-v11-4-4-1-ldap-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: LDAP Enumeration ================================================================================

LDAP Enumeration
Objectives:  Lightweight Directory Access Protocol

This is meant to act as a Phone book for network objects in a network.

# Ex: Lets say I wanted to look someone up and get their Phone Number.
	
	- I could parse the LDAP directory and get it
	Define LDAP Enumeration
    Enumerate target info with LDAP Enumeration tools

    What is LDAP and how is it used?
        Lightweight Directory Access Protocol
            Kinda like a 'phone book' of network resource attributes
               - User names
               - Email addresses
               - Phone numbers  ****
               - Groups
        Uses Port 389
---------------------------------------------------------------------------------
    So LDAP is just full of possibly useful info, but how do we access it?
        Windows server admins
            Server Admin Tools
            AD Explorer (Sysinternals)
        3rd-Party
        Softerra LDAP Admin
        ldapsearch
            ldapsearch -LLL -x -H ldap://192.168.241.200 -b '' -s base'(objectclass=*)'

#Ex: So when you are going to send an e-mail and your typing kat... and the autofill finishes it katy. It is parsing that data from the LDAP
# directory.



- On the windows machine you want to spin up Active Directory Users and Computers
# This feature happens to be installed on a windows 2016 server
# This is now your command center.
# go through all the objects
# Right click and add new gorup/ user / ...

====================================================================================
NEW TOOL

ldapsearch

                                                                      
┌──(root💀kali)-[/home/kali]
└─# ldapsearch -LLL -x -H ldap://10.0.0.1 -b '' -s base'(objectclass=*)'  
ldap_sasl_bind(SIMPLE): Can't contact LDAP server (-1)


# So right here we are getting informatio back on the your target Doman using the LDAP service.
f you are not running the search directly on the LDAP server, you will have to specify the host with the “-H” option.

$ ldapsearch -x -b <search_base> -H <ldap_host>

As an example, let’s say that you have an OpenLDAP server installed and running on the 192.168.178.29 host of your network.

If your server is accepting anonymous authentication, you will be able to perform a LDAP search query without binding to the admin account.

$ ldapsearch -x -b "dc=devconnected,dc=com" -H ldap://192.168.178.29

---------------------------------------------------------------------------------

To search LDAP using the admin account, you have to execute the “ldapsearch” query with the “-D” option for the bind DN and the “-W” in order to be prompted for the password.

$ ldapsearch -x -b <search_base> -H <ldap_host> -D <bind_dn> -W

As an example, let’s say that your administrator account has the following distinguished name : “cn=admin,dc=devconnected,dc=com“.

In order to perform a LDAP search as this account, you would have to run the following query

$ ldapsearch -x -b "dc=devconnected,dc=com" -H ldap://192.168.178.29 -D "cn=admin,dc=devconnected,dc=com" -W 



# F.F. LDAP does not have to be deplyed in an active directory. It can be found in linux environments as well. It is not specific to just windows















====================================================================
Should you ever nee HELP!...

#  $ ldapsearch --help


┌──(root💀kali)-[/home/kali]                                                                                                                     
└─# ldapsearch --help                                                                                                                        1 ⨯ 
ldapsearch: invalid option -- '-'                                                                                                                
ldapsearch: unrecognized option --                                                                                                               
usage: ldapsearch [options] [filter [attributes...]]                                                                                             
where:                                                                                                                                           
  filter        RFC 4515 compliant LDAP search filter                                                                                            
  attributes    whitespace-separated list of attribute descriptions                                                                              
    which may include:                                                                                                                           
      1.1   no attributes                                                                                                                        
      *     all user attributes                                                                                                                  
      +     all operational attributes                                                                                                           
Search options:                                                                                                                                  
  -a deref   one of never (default), always, search, or find                                                                                     
  -A         retrieve attribute names only (no values)                                                                                           
  -b basedn  base dn for search                                                                                                                  
  -c         continuous operation mode (do not stop on errors)                                                                                   
  -E [!]<ext>[=<extparam>] search extensions (! indicates criticality)                                                                           
             [!]domainScope              (domain scope)                                                                                          
             !dontUseCopy                (Don't Use Copy)                                                                                        
             [!]mv=<filter>              (RFC 3876 matched values filter)                                                                        
             [!]pr=<size>[/prompt|noprompt] (RFC 2696 paged results/prompt)                                                                      
             [!]sss=[-]<attr[:OID]>[/[-]<attr[:OID]>...]                                                                                         
                                         (RFC 2891 server side sorting)                                                                          
             [!]subentries[=true|false]  (RFC 3672 subentries)                                                                                   
             [!]sync=ro[/<cookie>]       (RFC 4533 LDAP Sync refreshOnly)                                                                        
                     rp[/<cookie>][/<slimit>] (refreshAndPersist)                                                                                
             [!]vlv=<before>/<after>(/<offset>/<count>|:<value>)                                                                                 
                                         (ldapv3-vlv-09 virtual list views)                                                                      
             [!]deref=derefAttr:attr[,...][;derefAttr:attr[,...][;...]]                                                                          
             [!]<oid>[=:<b64value>] (generic control; no response handling) 
-f file    read operations from `file'
  -F prefix  URL prefix for files (default: file:///tmp/)
  -l limit   time limit (in seconds, or "none" or "max") for search
  -L         print responses in LDIFv1 format
  -LL        print responses in LDIF format without comments
  -LLL       print responses in LDIF format without comments
             and version
  -M         enable Manage DSA IT control (-MM to make critical)
  -P version protocol version (default: 3)
  -s scope   one of base, one, sub or children (search scope)
  -S attr    sort the results by attribute `attr'
  -t         write binary values to files in temporary directory
  -tt        write all values to files in temporary directory
  -T path    write files to directory specified by path (default: /tmp)
  -u         include User Friendly entry names in the output
  -z limit   size limit (in entries, or "none" or "max") for search
Common options:
  -d level   set LDAP debugging level to `level'
  -D binddn  bind DN
  -e [!]<ext>[=<extparam>] general extensions (! indicates criticality)
             [!]assert=<filter>     (RFC 4528; a RFC 4515 Filter string) 
             [!]authzid=<authzid>   (RFC 4370; "dn:<dn>" or "u:<user>")
             [!]chaining[=<resolveBehavior>[/<continuationBehavior>]]
                     one of "chainingPreferred", "chainingRequired",
                     "referralsPreferred", "referralsRequired"
             [!]manageDSAit         (RFC 3296)
             [!]noop
             ppolicy
             [!]postread[=<attrs>]  (RFC 4527; comma-separated attr list)
             [!]preread[=<attrs>]   (RFC 4527; comma-separated attr list)
             [!]relax
             [!]sessiontracking
             abandon, cancel, ignore (SIGINT sends abandon/cancel,
            not really controls)
  -h host    LDAP server
  -H URI     LDAP Uniform Resource Identifier(s)
  -I         use SASL Interactive mode
  -n         show what would be done but don't actually do it
  -N         do not use reverse DNS to canonicalize SASL host name
  -O props   SASL security properties
  -o <opt>[=<optparam>] general options
             nettimeout=<timeout> (in seconds, or "none" or "max")
             ldif-wrap=<width> (in columns, or "no" for no wrapping)
  -p port    port on LDAP server
  -Q         use SASL Quiet mode
  -R realm   SASL realm
  -U authcid SASL authentication identity
  -v         run in verbose mode (diagnostics to standard output)
  -V         print version info (-VV only)
  -w passwd  bind password (for simple authentication)
  -W         prompt for bind password
  -x         Simple authentication
  -X authzid SASL authorization identity ("dn:<dn>" or "u:<user>")
  -y file    Read password from file 
  -Y mech    SASL mechanism
  -Z         Start TLS request (-ZZ to require successful response)









