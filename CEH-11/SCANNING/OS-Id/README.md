    Filename: eccouncil-ceh31250-v11-3-15-1-target-os-identification-techniques.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Target OS Identification Techniques ================================================================================

Target OS Identification Techniques
Objectives:

    Define OS Discovery/Banner Grabbing
    Distinguish between Active and Passive Banner Grabbing techniques
    Use nmap, wireshark, and unicornscan to identify target host's operating system using various techniques

    Kathy
        nmap
            -O
                Don't forget IPv6 (-6)
            Services may reveal OS
                port 445 open
                    nmap --script smb-os-discovery.nse <targetIP>
        unicornscan
            unicornscan <targetIP> -iV
        Countermeasures
# 	Filetering
	- turning off ports via firewalls IPS



#	 Disinformation Campaign
	- Change the banners on the wesite to point to a honey pot
	- Ex:
	" Powered by NGINX 2.9.3 "  # This is the real informatio

	" Powered by "Windows 7 "     # Fake honey pot info we set up.
	 

	Turn off banners
            


	Hide file extensions

Extension
	

Format

aac, adt, adts
	

Windows audio file

accdb
	

Microsoft Access database file

accde
	

Microsoft Access execute-only file

accdr
	

Microsoft Access runtime database

accdt
	

Microsoft Access database template

aif, aifc, aiff
	

Audio Interchange File format file

aspx
	

ASP.NET Active Server page

avi
	

Audio Video Interleave movie or sound file

bat
	

PC batch file

bin
	

Binary compressed file

bmp
	

Bitmap file

cab
	

Windows Cabinet file

cda
	

CD Audio Track

csv
	

Comma-separated values file

dif
	

Spreadsheet data interchange format file

dll
	

Dynamic Link Library file

doc
	

Microsoft Word document before Word 2007

docm
	

Microsoft Word macro-enabled document

docx
	

Microsoft Word document

dot
	

Microsoft Word template before Word 2007

dotx
	

Microsoft Word template

eml
	

Email file created by Outlook Express, Windows Live Mail, and other programs

eps
	

Encapsulated Postscript file

exe
	

Executable program file

flv
	

Flash-compatible video file

gif
	

Graphical Interchange Format file

htm, html
	

Hypertext markup language page

ini
	

Windows initialization configuration file

iso
	

ISO-9660 disc image

jar
	

Java architecture file

jpg, jpeg
	

Joint Photographic Experts Group photo file

m4a
	

MPEG-4 audio file

mdb
	

Microsoft Access database before Access 2007

mid, midi
	

Musical Instrument Digital Interface file

mov
	

Apple QuickTime movie file

mp3
	

MPEG layer 3 audio file

mp4
	

MPEG 4 video

mp4
	

MPEG 4 video

mpeg
	

Moving Picture Experts Group movie file

mpg
	

MPEG 1 system stream

msi
	

Microsoft installer file

mui
	

Multilingual User Interface file

pdf
	

Portable Document Format file

png
	

Portable Network Graphics file

pot
	

Microsoft PowerPoint template before PowerPoint 2007

potm
	

Microsoft PowerPoint macro-enabled template

potx
	

Microsoft PowerPoint template

ppam
	

Microsoft PowerPoint add-in

pps
	

Microsoft PowerPoint slideshow before PowerPoint 2007

ppsm
	

Microsoft PowerPoint macro-enabled slideshow

ppsx
	

Microsoft PowerPoint slideshow

ppt
	

Microsoft PowerPoint format before PowerPoint 2007

pptm
	

Microsoft PowerPoint macro-enabled presentation

pptx
	

Microsoft PowerPoint presentation

psd
	

Adobe Photoshop file

pst
	

Outlook data store

pub
	

Microsoft Publisher file

rar
	

Roshal Archive compressed file

rtf
	

Rich Text Format file

sldm
	

Microsoft PowerPoint macro-enabled slide

sldx
	

Microsoft PowerPoint slide

swf
	

Shockwave Flash file

sys
	

Microsoft DOS and Windows system settings and variables file

tif, tiff
	

Tagged Image Format file

tmp
	

Temporary data file

txt
	

Unformatted text file

vob
	

Video object file

vsd
	

Microsoft Visio drawing before Visio 2013

vsdm
	

Microsoft Visio macro-enabled drawing

vsdx
	

Microsoft Visio drawing file

vss
	

Microsoft Visio stencil before Visio 2013

vssm
	

Microsoft Visio macro-enabled stencil

vst
	

Microsoft Visio template before Visio 2013

vstm
	

Microsoft Visio macro-enabled template

vstx
	

Microsoft Visio template

wav
	

Wave audio file

wbk
	

Microsoft Word backup document

wks
	

Microsoft Works file

wma
	

Windows Media Audio file

wmd
	

Windows Media Download file

wmv
	

Windows Media Video file

wmz, wms
	

Windows Media skins file

wpd, wp5
	

WordPerfect document

xla
	

Microsoft Excel add-in or macro file

xlam
	

Microsoft Excel add-in after Excel 2007

xll
	

Microsoft Excel DLL-based add-in

xlm
	

Microsoft Excel macro before Excel 2007

xls
	

Microsoft Excel workbook before Excel 2007

xlsm
	

Microsoft Excel macro-enabled workbook after Excel 2007

xlsx
	

Microsoft Excel workbook after Excel 2007

xlt
	

Microsoft Excel template before Excel 2007

xltm
	

Microsoft Excel macro-enabled template after Excel 2007

xltx
	

Microsoft Excel template after Excel 2007

xps
	

XML-based document

zip
--------------------------------------------------------------------
COMMON LINUX FILE EXTENSIONS


Most common linux file extensions
Posted on October 3, 2011	
Share:
Facebook
Twitter
Pinterest

There is no .exe equivalent in linux. Executables are denoted by file permissions, not extensions. In directories such as /etc, many files do not use a file extension because it is in /etc it is assumed to be a configuration (ASCII text) file.

Ex. “RELEASE NOTE” is the correct name for a file (remember that it’s case sensitive).

The following list shows the most commons file extensions for linux:

.a   : a static library ;
.au    : an audio file ;
.bin :    a) a binary image of a CD (usually a .cue file is also included); b) represents that the file is binary and is meant to be executed ;
.bz2 :    A file compressed using bzip2 ;
.c :    A C source file ;
.conf :  A configuration file. System-wide config files reside in /etc while any user-specific configuration will be somewhere in the user’s home directory ;
.cpp :  A C++ source file ;
.deb :  a Debian Package;
.diff :   A file containing instructions to apply a patch from a base version to another version of a single file or a project (such as the linux kernel);
.dsc:   a Debian Source information file ;
.ebuild : Bash script used to install programs through the portage system. Especially prevalent on Gentoo systems;
.el :  Emacs Lisp code file;
.elc :  Compiled Emacs Lisp code file;
.gif :    a graphical or image file;
.h :a C or C++ program language header file;
.html/.htm  :   an HTML file;
.iso :    A image (copy) of a CD-ROM or DVD in the ISO-9660 filesystem format;
.jpg :    a graphical or image file, such as a photo or artwork;

.ko :    The kernel module extension for the 2.6.x series kernel;

.la :    A file created by libtool to aide in using the library;
.lo :    The intermediate file of a library that is being compiled;
.lock :    A lock file that prevents the use of another file;
.log :    a system or program’s log file;
.m4 :    M4 macro code file;
.o :    1) The intermediate file of a program that is being compiled ; 2) The kernel module extension for a 2.4 series kernel ; 3)a program object file;
.pdf :    an electronic image of a document;
.php :     a PHP script;
.pid :    Some programs write their process ID into a file with this extention;
.pl :    a Perl script;
.png :    a graphical or image file;
.ps :    a PostScript file; formatted for printing;
.py :    a Python script;
.rpm :    an rpm package. See Distributions of Linux for a list of distributions that use rpms as a part of their package management system;
.s :    An assembly source code file;
.sh :    a shell script;
.so :     a Shared Object, which is a shared library. This is the equivalent form of a Windows DLL file;
.src  :    A source code file. Written in plain text, a source file must be compiled to be used;

.sfs :    Squashfs filesystem used in the SFS Technology;
.tar.bz2 , tbz2, tar.gz :     a compressed file per File Compression;
.tcl :    a TCL script;
.tgz :     a compressed file per File Compression. his may also denote a Slackware binary or source package;
.txt :    a plain ASCII text file;
.xbm :    an XWindows Bitmap image;
.xpm :     an image file;
.xcf.gz, xcf :  A GIMP image (native image format of the GIMP);
.xwd :    a screenshot or image of a window taken with xwd;
.zip :extension for files in ZIP format, a popular file compression format;
.wav :    an audio file.



===================================================================

# Linux OS systems typically respond to a simple ping request with
#  64 byte reply and Windows will respond with a 128 byte.
# (If that Windows machine happens to be responding to such requests.)

	Examples:

┌──(kali㉿kali)-[~]                                                                                                                         [2/3]
└─$ nmap -O -n -Pn -p 20-500 50.116.20.151                            
TCP/IP fingerprinting (for OS scan) requires root privileges.  
QUITTING!                                                             
                                   
┌──(kali㉿kali)-[~]                                                   
└─$ sudo !!                                                       1 ⨯   
                                                                      
┌──(kali㉿kali)-[~]                
└─$ sudo nmap -O -n -Pn -p 20-500 50.116.20.151                   1 ⨯   
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 21:13 UTC      
Nmap scan report for 50.116.20.151                                    
Host is up (0.073s latency).      
Not shown: 473 closed tcp ports (reset)                                 
PORT    STATE    SERVICE                                              
22/tcp  open     ssh                                                  
25/tcp  filtered smtp                                                 
135/tcp filtered msrpc                                                
136/tcp filtered profile
137/tcp filtered netbios-ns                                           
138/tcp filtered netbios-dgm                                          
139/tcp filtered netbios-ssn                                          
445/tcp filtered microsoft-ds
Device type: general purpose|WAP|webcam|storage-misc|media device     
Running (JUST GUESSING): Linux 5.X|4.X|2.6.X|3.X (97%), Ubiquiti embedded (93%), Tandberg embedded (91%), HP embedded (91%), Ubiquiti AirOS 5.X (90%)                                                                  
OS CPE: cpe:/o:linux:linux_kernel:5 cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kern
el:2.6.32 cpe:/h:ubnt:airmax_nanostation cpe:/h:hp:p2000_g3 cpe:/o:ubnt:airos:5.2.6
Aggressive OS guesses: Linux 5.0 - 5.4 (97%), Linux 5.4 (96%), Linux 5.1 (95%), Linux 4.15 - 5.6 (95%), Linux 5.0 - 5.3 (94%), Linux 2.6.32 - 3.1
3 (94%), Linux 5.0 (93%), Ubiquiti AirMax NanoStation WAP (Linux 2.6.32) (93%), Linux 2.6.22 - 2.6.36 (92%), Linux 3.10 - 4.11 (92%)
No exact OS matches for host (test conditions non-ideal).             
Network Distance: 16 hops
                                                                      
OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 5.82 seconds

# PRO TIP

	For OS (-O) to have the highest probability of getting the OS
	correct. It needs to find open and CLOSED ports. The responses 
	from both help -O become more accurate.

┌──(root💀kali)-[/home/kali]
└─# nmap -O -n -Pn -p 80 50.116.20.151 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-03-15 21:20 UTC
Nmap scan report for 50.116.20.151
Host is up (0.075s latency).

PORT   STATE  SERVICE
80/tcp closed http
**Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port**
Device type: WAP|router|webcam
Running: Linux 2.6.X, D-Link embedded, Ubiquiti embedded, MikroTik RouterOS 6.X, Tandberg embedded
OS CPE: cpe:/o:linux:linux_kernel:2.6.30 cpe:/h:dlink:dir-818lw cpe:/h:ubnt:airmax_nanostation cpe:/o:mikrotik:routeros:6.30
OS details: D-Link DIR-818LW WAP (Linux 2.6.30), Ubiquiti AirMax NanoStation WAP (Linux 2.6.32), MikroTik RouterOS 6.30, Tandberg Video Conference System
Network Distance: 16 hops

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.25 seconds

# Notice the warning here 
**Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port**

 We receive this warning because (-O) doesn't have enough data to make an educated guess on the OS running on that the target
 Nmap needs to see/find OPEN and CLOSED ports to properly do it's job


=========================================================================================================
What are the ports that ARE open?
A FEW POPULAR WINDOWS PORTS
137
138
139
445 
3389

If I saw the above ports open during a test I would immedietly think (WINDOWS) with a pretty high probability of being correct.

Common Well Known Port Numbers
# List Alpha
    
    21: FTP Server.
    22: SSH Server (remote login)
    25: SMTP (mail server)
    53: Domain Name System (Bind 9 server)
    80: World Wide Web (HTTPD server)
    110: POP3 mail server.
    143: IMAP mail server.
    443: HTTP over Transport Layer Security/Secure Sockets Layer (HTTPDS server)

# List Bravo

	What are the most common open ports?
People  may use commonly open ports, such as the examples provided below.

    TCP:80 (HTTP)
    TCP:443 (HTTPS)
    TCP/UDP:53 (DNS)
    TCP:1024-4999 (OPC on XP/Win2k3)
    TCP:49152-65535 (OPC on Vista and later)
    TCP:23 (TELNET)
    UDP:161 (SNMP)
    TCP:502 (MODBUS)


# Nmap scripting engine
	If we were to come across an open port running and SMB client
	we could use the nmap scripting engine to further/deeper
	enumerate SMB share

nmap -p445 --script smb-protocols <target>

nmap -p139 --script smb-protocols <target>


# Banner Grabbing

-nc
-nmap





































































