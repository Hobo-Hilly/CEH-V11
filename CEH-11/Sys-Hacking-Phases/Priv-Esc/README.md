    Filename: eccouncil-ceh31250-v11-6-7-1-privilege-escalataion.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Privilege Escalation ================================================================================

Privilege Escalation
Objectives:

    Explain the concept and practice of Privilege Escalation
    Define the 2 types of Privilege Escalation
    List and describe common Privilege Escalation techniques and tools
    Describe common techniques used to prevent Privilege Escalation attacks

    What is privilege Escalation?
        Horizontal Priv Esc
# this is like a game of hop scotch. Jump once or twice maybe 3 times.
# you bounce around from each user trying to piece together different
# levels of access between your users and make your way to the top of the mountain
 


        Vertical Priv Esc
# This is exactly what it sounds like. Moving up the pecking order in privileges
-----------------------------------------------------------------

    How is Priv Esc accomplished?
        OS/Software vulnerabilities
            exploit-db
	    Searchsploit CLI tool to search exploit-db


        OS/Software Misconfigurations
            Weak permissions
WINDOWS            DLL Hijacking  Dynamic Link Library

                Robber
# This is a windows tool that will automate the task of find files with weak file permissions.


MAC            Dylib Hijacking
# this is the same idea but for MAC not windows and they are called 'Dylibs'

                Mac OS version of DLL hijacking



        Unattended Installations
            unattend.xml
                C:\Windows\Panther\
                C:\Windows\Panther\Unattend\
                C:\Windows\System32\
                C:\Windows\System32\sysprep\
# This could have a password in the config file that someone forgot to delete


        Unquoted Service Paths

- So we want to look for files that have a space in them.EX:  Folder A == Exploitable  'Folder A' == not exploitable (in this scenario)
- If the file has a space in the name and doesn't have quotes around it we have potential for escalation


If you dont enclose the 'service path' in quotes the windows system is told to read everything line by line space by space.

Ex: 
Folder A
<            FolderAA  
Folder B
    
The system is taught to read like this Folder (space) A (space if there was one)

so if we slip FloderAA in there the system will execute FolderAA before if ever makes it to Folder B and we win.


So when you do your naming convention in windows make sure there are no SPACES Folder A == Wrong  'Folder A' == Correct

        Scheduled Tasks/Cron Jobs/plist






        SUID/GUID
SUID is for single user permissions

GUID is for for group


in linux run this command

find / -perm -u=s -type f 2>/dev/null  

Using the find command to check the entire file system for files with the S perm set

$ nmap --interactive

nmap> !sh
sh-3.2#id
uid=1001(user) gid=1001(user) euid=0(root) groups=1001(user)


Dan set up a regular user account on his server. Downloaded an old
version of nmap and used the interactive feature in the old version
of nmap to run the interactive mode with the root user permissions that nmap runs with
and ran a shell out of the interactive nmap terminal.
        Sudo




# What can we do to protect against Priv Esc attacks?

	System Hardening guides for your client

        Updates/patches

        Careful configuration

        SAST/DAST

        Multi-factor Auth
        Principal of Least Privilege
        System hardening guides

