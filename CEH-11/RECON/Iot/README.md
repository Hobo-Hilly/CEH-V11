# Notes on IoT from it protv

    Filename: eccouncil-ceh31250-v11-2-3-1-shodan-censys-and-thingful.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: Shodan, Censys, and Thingful

================================================================================
Shodan, Censys, and Thingful
Objectives:

    Footprint a target using IoT search engines for details such as deployed technologies, VoIP, and VPN

    We've looked at many different ways to gather information about a client/target, but we've mostly talked about searching for user/org/web info. What about the actual technologies and internet connected devices? How would we get that kind of info?
        Shodan, Censys, and Thingful
    Let's start off with Shodan. What are some of the details about Shodan we need to know?
        https://help.shodan.io/the-basics/what-is-shodan
        Shodan Demo
    Shodan seems pretty useful, but you mentioned Censys. How does Censys differ?
        https://about.censys.io/
        Censys Demo
    Is Thingful just another IoT search engine?
        It is, but it does some interesting things
            https://www.thingful.net/site/about
        Thingful Demo
            Webcam
            Wind
===================================================================================

SHODAN

What is Shodan?

Shodan is a search engine for internet connected devices.

ANYTHING connected to the iternet. ICS/SCADA/IoT/OT(?)
	- webcam
	- microwaves
	- stoves in company break rooms/ smart appliances.


If it's connected to the interent, shodan can find it.

# If you were pentesting a client we would use shodan to look for anything
# in their company that was online (forward facing the internet). Then we could start tying to get on from there.
# once it finds a device you get the ip address along with location
# and how many open ports are available on that paticular ip address

 NOTE: Shodan takes a while to load. it's ok. thats normal
 NOTE: You can search manufacturers as well
 NOTE: You should be poking around at all the links on the page
 NOTE: You can click on the box with the upward slanted arrow and it will take you to the page.


==================================================================

CENSYS

What is CENSYS

Censys reduces your Internet attack surface by continually discovering unknown assets and helping remediate Internet facing risks.

Same thing as shodan just different vendor.

NOTE: In order to get to the free version of this you need to
- go to home page. Censys.io
- scroll all the way to BOTTOM of page
- click on search x.0

# we would again search our company for (   ) foscams for this example.

1) Search   10.0.0.XXX foscams
2) click on one of the results
3) click on link to take to web page 
4) now you are at the login ( or whatever page you clicked on)
5) the username COULD BE not will be filled out.

- In our class example the username was already filled out as admin.

- There is also a prompt at the top of this (class room example, real life page)
  that says "Plugins not found..." Our instructor says that this
  is not uncommon so nothig to be alarmed about.


NOTES: you need to create a log in for both tools
	- they may give you an api key
	- they also have a CLI version as well!
==============================================================

thingful

this is another search engine for IoT 
You MUST have a twitter or FaceBook to access this tool
it's a very nice GUI

































































