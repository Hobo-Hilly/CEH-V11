    Filename: eccouncil-ceh31250-v11-20-2-1-crypto-algorithms-and-implementations.md
    Show Name: CEHv11 (312-50)
    Topic Name: Cryptography - Cryptography
    Episode Name: Crypto Algorithms and Implementations ================================================================================

Crypto Algorithms and Implementations
Objectives:

    Describe the process of symmetric and asymmetric encryption
    List symmetric and asymmetric encryption algorithms
    Define hashing
    List the commonly used hashing algorithms and their application
    Define Digital Signatures and describe their use

#    Algorithms
#        Symmetric
            DES/3DES
- The Data Encryption Standard is a symmetric-key algorithm for the encryption of digital data. Although its short key length of 56 bits makes it too insecure for applications, it has been highly influential in the advancement of cryptography.

- In cryptography, Triple DES, officially the Triple Data Encryption Algorithm, is a symmetric-key block cipher, which applies the DES cipher algorithm three times to each data block

            RC(4/5/6)
- In cryptography, RC4 is a stream cipher. While it is remarkable for its simplicity and speed in software, multiple vulnerabilities have been discovered in RC4, rendering it insecure. It is especially vulnerable when the beginning of the output keystream is not discarded, or when nonrandom or related keys are used.

            Blowfish
- Blowfish is a symmetric-key block cipher, designed in 1993 by Bruce Schneier and included in many cipher suites and encryption products. Blowfish provides a good encryption rate in software, and no effective cryptanalysis of it has been found to date


            AES
- The Advanced Encryption Standard, also known by its original name Rijndael, is a specification for the encryption of electronic data established by the U.S. National Institute of Standards and Technology in 2001


#        Asymmetric
            RSA
-            Diffie-Hellman
	The Diffie–Hellman (DH) Algorithm is a key-exchange protocol that enables two parties communicating over public channel to establish a mutual secret without it being transmitted over the Internet. DH enables the two to use a public key to encrypt and decrypt their conversation or data using symmetric cryptography.



#NOTE: It's not really meant to be reversed. It's just meant to give you the outputs and then you use that output for verification. Now some people do use hashing algorithms as if they were meant to be encryption, like standard type of encryption, like what we've been talking about symmetric, asymmetric.
# Like I'm going to encrypt something and then eventually I would like to reverse that. So I have these keys that can handle that situation. That's not what's meant to be used by hashing, but people tend to use it that way. So if you see something like databases or web applications, a lot of times they will store or they will hash certain values using things like MD5 or sha one, sha two, ripe MD. We got another one which is HMac very common as well. We're gonna take a look at just some standards here in just a second. But if we use those, you've got to remember that's not what that's meant to do. It's just meant to be the verification that that is the same thing. 



#    Hashing
-        MD(5/6)
            https://datatracker.ietf.org/doc/html/rfc1321
-        SHA(128/256/512)
            https://datatracker.ietf.org/doc/html/rfc3174
-        RIPEMD-160
-        HMAC
            https://csrc.nist.gov/csrc/media/publications/fips/198/1/final/documents/fips-198-1_final.pdf

#    Digital Signatures


#    Hardware-based Encryption
        TPM
        USB
        HSM
        Hard-drive

#    Other Encryption Implementations
-        Elliptic Curve
            Advanced Algebraic equations to create shorter keys
                Increased efficiency


-        Quantum
            Stores encrypted information in the quanta


-        Homomorphic
            Encrypted data can be modified without decrypting it
