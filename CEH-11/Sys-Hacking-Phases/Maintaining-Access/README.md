    Filename: eccouncil-ceh31250-v11-6-8-1-maintaining-access.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Maintaining Access ================================================================================

Maintaining Access
Objectives:

    Define Remote Application Execution
    List and describe tools and techniques used by attackers to remotely execute applications and maintain access to target systems
    Define NTFS Alternate Data Streams
    Explain how ADS can be used for malicious purposes
    Create and employ ADS
    Define rootkits and explain their goal
    List and define common rootkit types

    Application Execution
        This is really the ability to interact with the target system after compromise
            Run system commands
                Remote Access Trojans
#                    TheFatRat
#                    Pupy
                        Keylogging
                        Screenshots
                        Camera access
                        Clipboard
#                Spyware
        Defenses?
-            Anti-malware/AV
-            Anti-keylogger software
-            Anti-spyware software
-            Patches/Updates

# Unless your looking for Alternate Data Streams your probably not going to find them.
        Used by attackers to hide malicious files

            Attaches malware to legit files
                Doesn't change size or properties of legit file
                    Create ADS
                        type malware.exe > C:\file1.txt:malware.exe     # the part after the colon is the ADS or Alternate Data Steam
    Rootkits
        Malware that replaces OS files/processes with malicious versions

#        Standard backdoor capabilities
            Command and Control
            Log wiping

#NOTE These kits are able to get away with this because they are fully fucntionally versions of the Boot-Loader/ Hardware/Firmware /etc. They
# have the malicious code in addition too.

            Monitoring -Types

#            Boot-loader Level
                Modify/replace boot loader with malicious copy

#            Hardware/Firmware Level
                Rootkit image is stored in firmware

#            Kernel Level
                Malicious code installed in the kernel
                Highest level of OS access

#            Hypervisor Level
                Loads the target OS as a virtual machine
                Intercepts and controls hardware calls to target OS

#            Application Level
                Like traditional malware
                Runs as malicious versions of software and utilizes the original software's API calls

#            Library Level
                Hooks into high-level system calls

======================================================
'Python Based RAT' PUPY How it works.
 Remote Access Trojan
1. Download the tool to your ATTACKING machine. Your kali/ parrot/ etc..
2. You then create a payload as a binary ( this binary can me written for any OS. Linux Windows Android Ruber Ducky
3. You upload payload to your target
4. Then from there it will try and reach out to it's master


FatRat works the same way but get poped by anti virus more often then not
