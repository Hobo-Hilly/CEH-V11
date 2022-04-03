    Filename: eccouncil-ceh31250-v11-3-10-1-nmap-idle-ipid-scan.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap: IDLE/IPID Scan ================================================================================

Nmap: IDLE/IPID Scan
Objectives:

    Describe the process of an IDLE/IPID scan
    Use nmap to perform an IDLE/IPID scan to enumerate ports states and service detail
    Explain the pros and cons when utilizing this type of scan

    Kathy (spooky episode. There be zombies!)
        Zombie scan
        Takes advantage of incremental IPID values
            Used to combat fragmentation
                We want Global rather than per-host IPID increments
# Attacker/Dan/Parrot_Machine $ip=10.0.13.75
# Kathy 
#



    How does the process work?
        Step 1
            Attacker >--SYN/ACK--> Zombie
            Attacker <----RST----< Zombie
                IPID is 2000
        Step 2
            Attacker >----SYN----> Target
                Source IP is spoofed to that of Zombie
                    Target >----RST----> Zombie
                        OPEN port increments IPID value of Zombie to 2001
                        CLOSED port doesn't increment Zombie IPID Value
                        FILTERED and CLOSED output are the same
                            RST is sent back by CLOSED ports, which are ignored by Zombie
                            Nothing is sent back by FILTERED, which doesn't affect Zombie IPID
        Step 3
            Repeat Step 1
                nmap reports port status by inspecting IPID Value
                    If IPID = 2002, then port is OPEN
                    If IPID = 2001, then port is CLOSED|FILTERED

    (Kathy): Well that sounds really...
        (me): COOL!?...
        (Kathy): Complicated. Enough of the talk, show us how this is done.

    Zombie Scan Demo
        nmap -Pn -sI 10.0.10.50 <targetIP>
            10.0.10.50 is the IP of the Edutainer Printer

https://nmap.org/book/idlescan.html
==================================================================
Q n A

# What the heck is a zombie?
	A zombie is an intermediary.
	A host on the same network
		- might be the public internet or
		- it may be a private network   i.e. intrAnet or something else internal. Something only we can see.
	We want to find a host that allows us to work with their
	IPID in a specific mannor.
	The zombie is going to be delivering us information from our true target



# What is IPID? 
	IPID is something that was developed to help combat
	the fragmentation of packets as they crossed the wire

==================================================================
# STEP 1   Verify that the zombie machine can be used as a zombie machine 
	It needs to allow you to o work with their IPID in a specific mannor.
	If it doesn't allow us to do this we need to find ourselves a new zombie.
	Reach out with a SYN/ACK packet to see if machine is a good Zombie candidate
	This is done by sending SYN/ACK packets to the ZOMBIE machine(machine1)  


Dan/attacker/parrot 10.0.13.75
Kathy/Target/kali  10.0.14.8
Us/Zombie/Printer on local network
	NOTE: You want to make sure there isn't very much traffic on your
	zombie machine. Otherwise you may get a lot of random IPID's
	and you wont get the consistency you need to make it work	

# Dan needed to scan the network for a host to use as a zombie
# Which happened be a printer on his local network with the
# the ip of 10.0.10.50 

	When we reach out to the potential zombie host 10.0.10.50
	we are going to get a reset back. Because the zombie machine
	is like " what the hell" you sent me a SYN/ACK. TCP 3 way
	hand shake starts with a SYN. So it basically says 'Go home your drunk." and sends it a RST reset pack. or UBER whatever
	since it doesn't have any connection status it just sends
	an RST packet to reset the connection.
#Whats happening?

We have verified that the zombie is good by checking that incrementation
 with wireshark.
We should be able to validate that 

When we go digging through the wireshark pcap if you click
on a request and go down to the Transmission Control Protocol 
tab. Then look for 'Identification: 0x2e16 (11798)   # The number is perands is the Identifier we need to consider 

# In the example in class dan checks two RST packets in wireshark that are sent back to him from 
# the potential zombie host machine he has initially sent the SYN/ACK packets to.


	38591  was the ID of the first RST packet sent back to Dan/Attacker

	38592 was the ID of the very next RST packet sent back to Dan/Attacker

# As you we can see they incriment nicely for us here. Varying only by one in this example

# so up to this point we have verified that the Zombie is good.
# by checking the incrementaion of the IPID. Going one at a time
# as seen above.
	NOTE: If we were to keep going with the capture and inspect
	more incoming RST packets we should see them continue to increment
	by one. i.e.
	
	38593  RST

	38594  RST

	38595  RST
	

==================================================================
# Step 2
Whats going on?

Dan(Attacker) -->  reaches out to Kathy (Target) --> Pretends to be us(Zombie)

Kathy(Target) ---> responds to us (Zombie) and increments our IPID

by one... Then step 2 is complete

# Ultimatly DAN wants to get a scan on Kathy(Victim)machine2
# But Dan wants the Zombie Machine/Us to receive the response
# so to do this we are going to spoof the Zombie ip address.
	
	Dan sends a SYN/ACK packet over to Kathy/Victim/Target 
	machine 
	To her machine it's going to look like it came from the 
	Zombie-Machine/Us
	And so thats exactly who Kathy/Victim/Target machine 
	responds to.
# And it's HOW she responds that's going to allow us
# to discern whether a PORT is open or closed.

	Again, we are sending out a SYN/ACK packet to start the
	connection which, again, is wrong. so Kathy/target/victim
	machine just RST's the connection.

# now while Kathy/Target/Victim machine is responding to the Zombie
# we can watch the Incrementation again. And it should Increment
# the Zombie/Us by one.

===================================================================
# STEP 3 

Whats going on?



# Step 3 is repeating step 1

	Reach out to the Zombie with SYN/ACK flag set
	Zombie responds and we take a look at the response for a baseline
	we then reach out for a second time witht SYN/ACK set and 
	check to see if the IPID has incremented 
# if the IPID on the zombie machine has incremented then we can deduce that the port has been open.
# if the IPID on the zombie machine has not incremented, then there was no response to the request
#  which means that port can not be open.
	i.e.
	if the port is closed it doesn't respond at all
	so therefore no incrementation.

# Your deducing whether or not the port is open based off of the response from the actual target to the zombie
# and than looking at whether or not the zombie incremnted their IPID or not
# If the Zombie Machine IPID did increment by one. You have an open port.
	
	If the Zombie Machine did not increment at all. 
	This means there was no response, therefore the port wasn't open. 
	So no big deal, That port is just closed. go ahead and move along. 

# NOTE: Filtered || Closed Are the same thing in the eyes of nmap
# No way around it. You are going to have to play a bit of a guessing game
# on whether or not it is filtered or closed. 
# Because Filtering could be blocking the response. 
# This could be what is causing it not to increment the IPID

RST packets are sent back by closed ports which are ignored by the ZOMBIE

If nothing gets sent back this means the port is filtered and it
doesn't effect the zombie IPID 


===================================================================
DEMO SCANS















