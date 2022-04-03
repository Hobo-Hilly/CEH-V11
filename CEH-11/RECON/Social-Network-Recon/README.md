    Filename: eccouncil-ceh31250-v11-2-6-1-social-networking-recon.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: Social Networking Recon

================================================================================
Social Networking Recon
Objectives:

    Gather information about target's personnel through Social Media using common OSINT tools

    What are we trying to learn from Social Media sites?
        Company Info
        Employee Info
            Email addresses
            Job Titles
            Interests
            Technologies used in the org
            Badges
            Professional connections
            3rd-party details
    What Socical Media sites should we be looking at to gather this info?
        The usual cast of characters
            Facebook
            LinkedIn
            Twitter
    Is this a manual process, or do we have tools that can automate for us?
        Demo
            theHarvester
===================================================================

ex:

usage: theHarvester [-h] -d DOMAIN [-l LIMIT] [-S START] [-g] [-p] [-s] [--screenshot SCREENSHOT] [-v] [-e DNS_SERVER] [-t DNS_TLD] [-r] [-n]
                    [-c] [-f FILENAME] [-b SOURCE]

theHarvester is used to gather open source intelligence (OSINT) on a company or domain.

optional arguments:
  -h, --help            show this help message and exit
  -d DOMAIN, --domain DOMAIN
                        Company name or domain to search.
  -l LIMIT, --limit LIMIT
                        Limit the number of search results, default=500.
  -S START, --start START
                        Start with result number X, default=0.
  -g, --google-dork     Use Google Dorks for Google search.
  -p, --proxies         Use proxies for requests, enter proxies in proxies.yaml.
  -s, --shodan          Use Shodan to query discovered hosts.
  --screenshot SCREENSHOT
                        Take screenshots of resolved domains specify output directory: --screenshot output_directory
  -v, --virtual-host    Verify host name via DNS resolution and search for virtual hosts.
  -e DNS_SERVER, --dns-server DNS_SERVER
                        DNS server to use for lookup.
  -t DNS_TLD, --dns-tld DNS_TLD
                        Perform a DNS TLD expansion discovery, default False.
  -r, --take-over       Check for takeovers.
  -n, --dns-lookup      Enable DNS server lookup, default False.
  -c, --dns-brute       Perform a DNS brute force on the domain.
  -f FILENAME, --filename FILENAME
                        Save the results to an XML and JSON file.
  -b SOURCE, --source SOURCE
                        anubis, baidu, bing, binaryedge, bingapi, bufferoverun, censys, certspotter, crtsh, dnsdumpster, duckduckgo, fullhunt,
                        github-code, google, hackertarget, hunter, intelx, linkedin, linkedin_links, n45ht, omnisint, otx, pentesttools,
                        projectdiscovery, qwant, rapiddns, rocketreach, securityTrails, spyse, sublist3r, threatcrowd, threatminer, trello,
                        twitter, urlscan, virustotal, yahoo, zoomeye


==============================================================================================================================================

ex: 

$ theHarvester -d itpro.tv -b linkedin, google, baidu

note: this is an example from class and I never ran it






















