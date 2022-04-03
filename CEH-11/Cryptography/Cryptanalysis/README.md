    Filename: eccouncil-ceh31250-v11-20-5-1-cryptanalysis.md
    Show Name: CEHv11 (312-50)
    Topic Name: Cryptography - Cryptography
    Episode Name: Cryptanalysis ================================================================================

Cryptanalysis
Objectives:

    Define cryptanalysis and cryptanalysis methods
    List and describe cryptography attacks used to obtain access to sensitive data
    Identify and describe common cryptanalysis tools

#    What is Cryptanalysis?
        Studying cryptosystems
        Looking for exploitable weaknesses

#    Methods
-        Linear
            aka Known-Plaintext Attack
                Requires both encrypted and plain-text data
                    Some plain-text could be guessed
                        Common words, names, and/or phrases
-                Goal is to reverse-engineer a decryption key
-                    Further messages that were encrypted using that key could then be easily decrypted
#        Differential
-            Attacker defines the plaintext inputs and analyzes the results
                Continues this process until the key is determined
                    Chosen-Plaintext Attack
                        http://www.theamazingking.com/crypto-diff.php
#        Integral
-            Type of Differential attack
-            Uses larger inputs
-            Applicable to block ciphers

#    Code Breaking
-        Brute-Force         ** Resource Heavy! And time consuming... BUT effective
-        Frequency Analysis

#    Attacks
-        Man-in-the-Middle
-        Meet-in-the-Middle
            Reduces the time it takes to break encryption on ciphers that use multiple keys
                Double-DES is vulnerable    (Data Encryption Standard)
                Known-plaintext attack
                    PT --> E<k2> --> E<k2> --> CT
                        Apply known-plaintext attack from both sides to 'meet in the middle'
                    PT --> E(k1) = X
                    CT --> E(k2) = X
                        If X is the same for both then you've found the keys
#        Side-Channel Attacks
            Physical attack

                Monitors environmental aspects of the target to reveal sensitive info
-                    Power Usage
-                    Electromagnetic Radiation
-                    Light Emanation
-                    Audio Emanation

        Hash Collisions
'In computer science, a hash collision or clash is when two pieces of data in a hash table share the same hash value. The hash value in this case is derived from a hash function which takes a data input and returns a fixed length of bits'

            https://crackstation.net

        Related Key


            WEP
- Wired Equivalent Privacy was a security algorithm for 802.11 wireless networks. Introduced as part of the original IEEE 802.11 standard ratified in 1997, its intention was to provide data confidentiality comparable to that of a traditional wired network.

        Rubber Hose Attack
- In cryptography, rubber-hose cryptanalysis is a euphemism for the extraction of cryptographic secrets from a person by coercion or torture—such as beating that person with a rubber hose, hence the name—in contrast to a mathematical or technical cryptanalytic attack.


The proper motivation of Humans is very improtant but not very complex.

Words to live by.. 

" Never apeal to a mans better nature. He may not have one. " - Mr.Robot


 M.I.C.E

Money Ideology Coercion Ego


# NOTE: 

- The bit strength of the key, that is being used to create the hash value. Well, guess what? With a hash you're supposed to have one input 
- creates a unique output. If any change to that input is made, the output will change, right? Even a small insignificant change. Well, what 
- ends up happening is, is that I only have so many outputs that I can make based off of the bit strength that you've given me. Eventually 
- we're going to end up to where we have two completely different inputs that generate the same output. That's a problem. We call that a collision. 
- And if I can do that, well, I just now have to get my computer busy. And say computer, here's what I need you to do today for me is I want 
- you to run through every possible permutation of this algorithm and generate the outputs. And then compare them to each other and tell me 
- where you find the collisions. That's what we do, right? So that's what it's all about. So if your password is MD5 encrypted, right? I might 
- just be able to find another input that's not your password, and still It would generate that MD5 hash and would be viable. So that's a problem

