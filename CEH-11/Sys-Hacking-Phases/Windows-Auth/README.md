    Filename: eccouncil-ceh31250-v11-6-2-1-windows-authentication.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Windows Authentication ================================================================================

Windows Authentication
Objectives:

    Explain the process used for authentication by the Security Account Manager, NTLM, and Kerberos
# 'Serious SAM' vulnerability??


    Windows Security Accounts Manager(SAM) Database
        Located in the Registry
            %SystemRoot%/system32/config/SAM
        Stores hashed user passwords
            LM/NTLM hashes
        Special lock on the SAM to keep safe
            SAM can't be copied or moved while system is running
            It can be accessed directly from memory
-------------------------------------------------------------------


    NT LAN Manager(NTLM) Authentication
        Used to be THE auth mechanism for Windows
            Now just there as a back-up to Kerberos
        A user accesses a client computer and provides a
        domain name
        user name
        password.
#1            The client computes a cryptographic hash of the password
                discards the actual password
#2                    The client sends the user name to the server (in plaintext).
        The server generates a 16-byte random number
-        Called a 'challenge'
            Sends it back to the client
#3        Client encrypts this challenge with the hash of the user's password
#4        Returns the result to the server
-            This is called the 'response'.
        The server sends the following three items to the domain controller:
-        User Name
-        Challenge sent to the client
-        Response received from the client
#5        The domain controller uses the user name to retrieve the hash of the user's password
        It compares the encrypted challenge with the response by the client
            If they match, authentication is successful
                Domain Controller notifies the server.
#6        The server then sends the appropriated response back to the client.



-------------------------------------------------------------------------------------------------------




    Kerberos      

# Kerberos  is used in all windows domain controllers now. If your logging into a windows domain you are using Kerberos.
# only time you wouldn't use Kerberos is if it isn't available or isn't working

# TIME is critical here. If your time is off in your machine you will not be able to authenticate through kerberos because it will
# read your time stamp and say, " Sorry but your concept of time is too scewed. We can't gaurantee you are logging things correctly so 
# no thank you." 

# TIME must be ON! There is a time variation setting where you can control the max amount of time you will allow a clock to be off and still log in.



        User's client generates an authenticator and is encrypted with the User's password


1.        Authenticator = info about the user + timestamp


2.        Client sends the encrypted authenticator to the KDC


3.        KDC looks up the username and password (also checks the timestamp)


4.        KDC tries to decrypt the authenticator with the password


5.        KDC sends back a TGT to client


6.        TGT also timestamped and encrypted with the same key as the authenticator


7.        Client decrypts the TGT with user's password key


8.        Client uses TGT to access other resources


9.        Client requests access to Sever_A


#10.            TGT + Server_A Access Request


11.        KDC accepts request because of TGT


12.        KDC generates a updated ticket for Server_A access


13.        Client receives new ticket and sends copy to Server_A


14.        Server_A decrypts ticket with its own password











