    Filename: eccouncil-ceh31250-v11-3-1-1-network-scanning-types.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: TCP Communication

================================================================================
TCP Communication         NOTE: * TCP is VERY connection oriented
Objectives			* Verifys information has made it to its target.
				* Also wants to know when transmission is over so it can break that connection
    Recognize the 6 TCP communication flags and point out their purpose
    Explain the process of TCP/IP communications

    What is the first thing we need to know about TCP Communications?
        Connection oriented
        Utilizes 6 'Control Flags'
            1 bit each
            4 flags for connection management
                Synchronize (SYN)  # hey I would like to start talking 
                Acknowledge (ACK)  # ok I received your request, I am good to go lets talk
                Finish (FIN)       # Transmission over were done talking.
                Reset (RST)        #  Error! Something happened I didn't expect so i am calling the talks off. Try again.
            2 flags for system instruction
                Push (PSH)     # this overrides the buffer. The buffer is supposed to fill up before information starts to stream
				# but if you send the PSH command it will give instructions not to wait for the buffer to fill up. When you start to get data go ahaead and push it on. 
                Urgent (URG)    #  This is priority data. This needs to be sent now. 
# 3 way handshake

# SYN  Initiater sends

# SYN/ACK  responder sends

# ACK  Initiater send

# Conversation ensues usign the other flags to help move data along 
#  and the FIN flag is sent when conversation is over

	What details do we need to know about the connection management flags?
        SYN
            Initiation to establish connection between hosts
            Sequence number synchronization
        ACK
            Signals that host is ready to or has received data
        FIN
            Signals that transmission is over and connection is terminated
        RST
            Signals an error
                Aborts connection
    What details do we need to know about the system instruction flags?
        PSH
            Controls the sending and receiving of data in buffers
                Increases the efficiency of that process
        URG
            Prioritize this data
    What is the TCP 3-way handshake?
        Proper establishment of a TCP connection
            SYN --> SYN/ACK --> ACK --> CONNCETION ESTABLISHED!
    Is there any way to see the 3-way handshake process?
        Wireshark
