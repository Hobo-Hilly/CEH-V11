    Filename: eccouncil-ceh31250-v11-4-7-1-smtp-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: SMTP Enumeration ================================================================================

SMTP Enumeration
Objectives:

    Use common SMTP commands and tools to enumerate valid user accounts
    Enumerate FTP for possible sensitive and/or actionable information
#PORT 25
    SMTP is used to send email, so how can that be leveraged for enumeration purposes?
        Users
        email addresses

# NOTE: Dan net cats into the server here.
# $ nc -nv 192.168.21.234 25
# and now he start using SMTP commands
# When you first log in. Punch in the 'EHLO' command with a random name to break the ice

    How?
        SMTP server commands
            VRFY
            EXPN
            RCPT TO

    How to we make use of these commands for enumeration?
        Login directly
            netcat
            Telnet

        smtp-user-enum
            -U/-u User list / single user
            -t Target mail server (IP)
            -M Mode (VRFY,EXPN,RCPT TO)

Examples:



smtp-user-enum v1.2 ( http://pentestmonkey.net/tools/smtp-user-enum )

Usage: smtp-user-enum [options] ( -u username | -U file-of-usernames ) ( -t host | -T file-of-targets )

options are:
        -m n     Maximum number of processes (default: 5)
        -M mode  Method to use for username guessing EXPN, VRFY or RCPT (default: VRFY)
        -u user  Check if user exists on remote system
        -f addr  MAIL FROM email address.  Used only in "RCPT TO" mode (default: user@example.com)
        -D dom   Domain to append to supplied user list to make email addresses (Default: none)
                 Use this option when you want to guess valid email addresses instead of just usernames
                 e.g. "-D example.com" would guess foo@example.com, bar@example.com, etc.  Instead of 
                      simply the usernames foo and bar.
        -U file  File of usernames to check via smtp service
        -t host  Server host running smtp service
        -T file  File of hostnames running the smtp service
        -p port  TCP port on which smtp service runs (default: 25)
        -d       Debugging output
        -w n     Wait a maximum of n seconds for reply (default: 5)
        -v       Verbose
        -h       This help message

Also see smtp-user-enum-user-docs.pdf from the smtp-user-enum tar ball

$ smtp-user-enum -M VRFY -U users.txt -t 10.0.0.1
$ smtp-user-enum -M EXPN -u admin1 -t 10.0.0.1
$ smtp-user-enum -M RCPT -U users.txt -T mail-server-ips.txt
$ smtp-user-enum -M EXPN -D example.com -U users.txt -t 10.0.0.1


===================================================================
How does FTP work?
#PORT 21
You want to transfer a file from one host to another. We can use FTP to do this. Obviously we would use SFTP but for the demo we are on FTP.

FTP = creates a scoket connection to transfer data 

File Transfer Protocol or Secure File Transfer protocol

FTP = sends unencrypted data in clear text. Wireshark sounds good here.

Server is hosting files and you can access the server via an open ftp port aka port 21. 


    What about FTP?
        Anonymous login?
            If yes, is there any sensitive info that can be viewed?
                Can anonymous upload?
        Brute-Force login
        Version info
            Known vulnerabilities?
# Syntax
$ ftp 192.212.32.32

$ ftp> get {file path}


$ ftp> exit
221 Goodbye


























