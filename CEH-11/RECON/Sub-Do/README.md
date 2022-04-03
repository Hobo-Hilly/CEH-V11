#     Filename: eccouncil-ceh31250-v11-2-4-1-sub-domain-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: Sub-Domain Enumeration

================================================================================
Sub-Domain Enumeration
Objectives:

    Search for a target's subdomains by utilizing common hacking tools to properly footprint their attack surface

    What is a sub-domain?
        Domains
            Main web presence
                Domain name
                    aka 2nd Level Domain
                gTLD (Generic Top-Level Domain)
                    Catch-all for specific areas
                        .com
                        .net
        Sub-Domains
            Secondary web presence
                Used to organize web sites that are big enough to need their own space
                    Same idea as a Sub-directory in a file system

    How do we do subdomain enumeration and why is it important to ethical hacking?
        It's important because...
            It's apart of the attack surface
        We can find them a couple of ways
            Manual searching (demo)
                Google
                    site:itpro.tv
                Page source code

    That seems a bit tedious. Can we automate that process?
        Automation (demo)
            netcraft
            sublist3r

https://hover.blog/whats-a-domain-name-subdomain-top-level-domain/


=================================================================

What is a domanin?

ex: ItPro.Tv.com

ItPro. = Second level Domain 

.com / .org / .net = Top Level Domain  AKA General TLD Top Level Domains


app.itpro.tv   = app is the 3rd part of the puzzle and is known as the Sub-Domain
blog.itpro.tv  = blog is the sub-domain here

Top Lovel Domain

Sub-Domains which are used for organizing large partitions of your
web presence that are so big they require organization and segragation from your other main areas

ALWAYS ENUMERATE SUBDOMAINS! lol nuff said.

TOOLs
- Gobuster
- dirb
- dirbuster

you need to document EVERYTHING you find in every domain every time.


Reccomended Tools
-  netcraft is a browser base tool to automate the process
- sublist3r
 
ex: sublist3r -d itpro.tv

( returned 50 subdomains... and they are a securoty TRAINING company.. Scary to think about people who have no clue)

www.itpro.tv
api.itpro.tv
app.itpro.tv
app-staging.itpro.tv
assests.itpro.tv
autodiscover.itpro.tv
blog.itpro.tv
www.blog.itpro.tv
datatron.itpro.tv
dev.itpro.tv
dpserver.itpro.tv
engineering.itpro.tv
www.help.itpro.tv
etherpad.itpro.tv
enterprise.itpro.tv

... 


























































