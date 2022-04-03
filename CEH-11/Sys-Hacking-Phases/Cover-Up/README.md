    Filename: eccouncil-ceh31250-v11-6-10-1-covering-tracks.md
    Show Name: CEHv11 (312-50)
    Topic Name: System Hacking Phases and Attack Techniques - System Hacking
    Episode Name: Covering Tracks ================================================================================

Covering Tracks
Objectives:

    Explain the reasoning behind why an attacker clears logs
    Demonstrate techniques and tactics for clearing logs in a Windows and Linux Operating Systems
    Explain the purpose of disabling auditing systems during an attack
    Show how auditing systems could be disabled during an attack
    List and define common defensive maneuvers against attackers attempting to cover their tracks

    Once a threat actor has compromised a system or network only part of the battle has been won. It seems that now they would be scrambling to hide their presence and destroy evidence of their compromise or 'cover their tracks'. What are some of the main ways in which they try to accomplish this?

        Disable Auditing systems
            Stop recording/reporting activity that may alert admins to compromise


        Clearing Logs
            Destroy evidence so that admins...
                Don't pick up on intruder presence
                Thwart forensic investigation

    It really makes sense that an attacker would turn off systems that would be gathering evidence of their presence and activity. What are some methods used by attackers and ethical hackers to disable auditing?
        If Windows
#            Auditpol
-                auditpol /set /category:"system","account logon" /success:disable /failure:disable
		If we accidently type in the wrong passwd or if we successfully type in the correct passwd we don't want a record of it and thats what this setting does here.

#            Fsutil (disable last access timestamp)
-                fsutil behavior set disablelastaccess 1
		This is meant to disable access monitoring. Accidental typo in class so the output never showed but we know what he is doing here.


#            Disable Restore Points
-                Attacker could trigger events that create a restore point
		


#            Other
-                Windows Hibernation file  ( Information in Ram that is stored on the Hard Drive.DELETE this file)
-                Windows Virtual memory (Page file) This is another hard drive space that stores information on our activities.
		Uses the HardDrive as RAM


        If Linux
            Disable bash history recording
#                export HISTSIZE=0  # you type this in the command terminal and the command recording stops. So all commands after this one are no longer logged.

            Auditd (RHEL)
#                auditd -s disable  # this is for RED HAT systems. CentOS, Fedora, 


This portion has been all about diabling auditing. So no new records are being recording.
Now it's time to clear the logs.
--------------------------------------------------------------------------------------------------------------------------------------------------
We now must clear out all the logs that have already recorded our presence. 


#Big Question. Do you destroy all the logs or just the ones with you in it....
Depeneds ...

    Now you also mentioned something about clearing logs. What methods would an attacker use to clear logs to cover their tracks?


#        Windows
            Clear-EventLog "Windows PowerShell" 	# now the event logs in windows powershell have been destroyed
            wevutit -cl Security			# now this will clear the security log!
            Metasploit clearev				# this has metasploit clear out logs for you
            cipher.exe
                overwrites deleted files
            Windows Event Viewer


#        Linux
            /var/log
            history -c
            history -w
            echo " " > ~/.bash_history
            shred file1.txt
                makes file contents unreadable
----------------------------------------------------------------------------------------------------------------------------------------------
    Are there any good defenses against this type of activity?
        syslog     (A syslog is a file that stores backups locally AND remotely.)
        Event Viewer Subscriptions ( Stores your eventviwer remotely on the subscription servers) 
        SIEM
