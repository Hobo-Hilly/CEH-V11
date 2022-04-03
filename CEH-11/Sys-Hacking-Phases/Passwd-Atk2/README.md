    Filename: eccouncil-ceh31250-v11-6-5-1-password-cracking-enhancement-techniques.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Password Cracking Enhancement Techniques ================================================================================

Password Cracking Enhancement Techniques
Objectives:

    Enhance password cracking attack efforts by utilizing techniques such as Combinator, PRINCE, Toggle-Case, and Markov-Chain Attacks

    Combinator
        Combine 2 or more dictionaries together
# Don't remove doubles. You need unique from A and B to make C
# Then we use C
- [ Basic Examples ] -

  Attack-          | Hash- |
  Mode             | Type  | Example command
 ==================+=======+==================================================================
  Wordlist         | $P$   | hashcat -a 0 -m 400 example400.hash example.dict
  Wordlist + Rules | MD5   | hashcat -a 0 -m 0 example0.hash example.dict -r rules/best64.rule
  Brute-Force      | MD5   | hashcat -a 3 -m 0 example0.hash ?a?a?a?a?a?a
  Combinator       | MD5   | hashcat -a 1 -m 0 example0.hash example.dict example.dict
  Association      | $1$   | hashcat -a 9 -m 500 example500.hash 1word.dict -r rules/best64.rule

If you still have no idea what just happened, try the following pages:

* https://hashcat.net/wiki/#howtos_videos_papers_articles_etc_in_the_wild
* https://hashcat.net/faq/

If you think you need help by a real human come to the hashcat Discord:

* https://hashcat.net/discord
-------------------------------------------------------------------

    PRINCE
        PRobability Infinite Chained Elements
            Like a Combinator approach except
                Only uses 1 dictionary
        Create a useful dictionary based on known criteria
            Example: passwords must be 6 chars long
                Use only 6+ char words in dictionary
                Create 6+ char words using combinations of smaller words
                    2 char words + 4 char words = 6 char words

------------------------------------------------------------------

    Toggle-case
        Try every case possibility
            aaa, aaA, aAA, AAA, AAa, Aaa
            bbb, bbB, bBB, BBB, BBb, Bbb






--------------------------------------------------------------------
    Markov Chain
        A statistical analysis of the passwords cracked through normal means
            A file is generated with the most common elements
                'C' is the most common letter and is most commonly followed by 'a'
            It then uses those stats to perform a dictionary/brute-force hybrid attack

# John and Hashcat both have this mode. This gives us the ability to take the information of the passwords we have cracked and feed it into our password cracker.
# We are making the cracker smarter because it has more information so we can make more effective premertations. 

https://gracefulsecurity.com/custom-rules-for-john-the-ripper-examples/












