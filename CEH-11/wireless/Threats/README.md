    Filename: eccouncil-ceh31250-v11-16-2-1-wireless-threats.md
    Show Name: CEHv11 (312-50)
    Topic Name: Wireless Network Hacking - Hacking Wireless Networks
    Episode Name: Wireless Threats ================================================================================

Wireless Threats
Objectives:

    List and explain common wireless security threats and attacks

#    Authentication Attacks
-        Brute-force the password/PSK
- when it comes to an authentication in such, anything that's gonna go or attack the authentication mechanism to gain access into a part of the 
- wireless network. Whether it be the wireless connectivity itself or some sort of access into the wireless devices, that's what we're talking. 


#    Rouge AP
-  Installed into target network allowing 'backdoor' access

- We buy an access point, we find a place to drop it onto a network, we connected it, we can figure it and we can go out into the parking lot and 
- connect to it and enjoy our access to their network from outside, right? So it's a way to circumvent and bypass the normal network connection 
- process, which probably and should includes some form of security and so that's a way for us to get around those things, by using a rogue APs. 


#    Evil Twin
- Client mis-association
- I would as an attacker, profile the wireless network of my targets, find out things like SSID channel, that they're operating on wireless spectrums. 
- What type, every little thing I can and then creates a wireless access point that mimics one of those access points. So that when people go 
- to connect, if they were to look, they say, there's the right ones named correctly everything looks right, let me go ahead and connect now. 
- There is sometimes obviously, yeah there if they're using a pre shared key, if you don't know what that is, that will not work. 


- But ultimately you're just trying to set up something and then a lot of times what you'll do is you'll use some sort of jamming attack to keep 
- legitimate clients from connecting to legitimate access points. You wanna kinda force them, into connecting with your evil twin access point, 
- that's what it's all about. So this is really great for doing what's called client miss association, right? I don't want clients to associate 
- with the actual access points of my target, I want them to associate with my evil twin and therefore I can do interception, I can sniff the 
- network that all that wonderful stuff that's, so bad for us that we don't want. So a lot of times also they will use the stronger or radio. 
- So it overpowers the way WIFI typically works is that it will look for the strongest signal and default to that. So if your Evil Twin access 
- point is the strongest signal, yeah that's that's who's gona win that race. Especially if everything else seems equal, and if it's an open 
- access point, that's an even more reason like well it's open, I can connected to it. I got nothing stopping me, It's the strongest signal, 
- it looks right, everything looks right, that's that's the idea. And then once you have that evil Twin, nobody knows if I were to jump into 
- my computer and look at the wireless connectivity and see, and it said that I was connected to IT Pro TV. 

#    Honeypot AP
-        Looks like a commonly trusted SSID
            Coffee shop
            Restaurants
- But that's what you gotta worry about that would be a honeypot, right? It's it's meant to look enticing that you would want to connect to it 
- that it would even seem safe and friendly and therefore you do and you connect. Unfortunately you're connecting to somebody's malicious access 
- point and now you're running into a whole host of issues. Anything else I want to talk about, that's basically what's going on. So you just 
- make it look like a commonly trusted SSID when it becomes in range people will see it and want to connect to it and they'll connect. 


#    Soft AP (Soft as in Software)
        Installed as malware
        Malware turns device into AP allowing attacker to access internal resources
	Hotspots
- So this is a software AP so there are software AP's out there that will just use your internal radio as your access point. Think of the idea of hotspots, right? Technically that would be a SoftAP.
- So my computer or my mobile device now becomes an access point. Why would you wanna do that? Because if you work for a company that I'm targeting as an attacker and now your laptop is an access point. And has connectivity to their internal network, I can now connect using my access points. On my SoftAP that I've installed in your system to connect and people get real creative. And they find ways to connect over long distances using SoftAP's. 
- 



#    Denial of Service Attacks
-        De-authentication attack
-            Attacker sends de-authentication frame
-        Disassociation attack
-            Attacker sends disassociation frame
-        Jamming
-            Cell and WiFi
#    KRACK
-        Key Re-installation Attack (WPA/WPA2 vuln)
-        Performed by blocking message 3 of the 4-way handshake
-            AP will re-transmit M3 multiple times with the same nonce
-                This reuse will make the encryption susceptible to attack
-        Attacker creates a fake access point with same ESSID on a different channel
-            Attacker performs MITM attack

#NOTE: What Is Nonce? A nonce is an abbreviation for "number only used once," which, in the context of cryptocurrency mining, is a number added 
# to a hashed—or encrypted—block in a blockchain that, when rehashed, meets the difficulty level restrictions. The nonce is the number that 
# blockchain miners are solving for.



#    Spoofing Client MAC
-        Bypass MAC filtering

- if you've ever set up a wireless access point, there's usually a spot in there for you to say, hey, I wanna do some MAC filter. You can either do a deny or allow list whatever you like. So I'm gonna say, I'm gonna deny these specific MAC addresses. They can't log in, they can't authenticate, they can't associate with this access point or we can allow us these are the list of accepted MAC addresses. So they are 
- good clients, anything else is not a good client, you don't allow it? 
- Keeping things secure on lockdown and most people will do that allow this type of thing, where these are the known devices, so anything else shouldn't be allowed? It's an easier way to go because I know what those are and I can block what I don't know and then people can ask me to make exceptions


- So the problem with this is, is that I can spoof my MAC address, if I find out what the MAC address is of a valid clients, guess what it's changed my MAC address that of a valid client and it'll go what's your MAC? Cool come on in water Spy. So it's just a way to bypass that.

- The other way you can use MAC spoofing, is through if there's some sort of network access control going on like an act system where things are kinda getting controlled by this is the this is a good client MAC. This is a good device I'm able to bump that thing off line and take over that connection by spoofing the MAC address then I get access into the system and that's what I'm looking for. So always a good thing to know how to do the old spoofing the MAC clients and get you by those bypass those filtering rules
























