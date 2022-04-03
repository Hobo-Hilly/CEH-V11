Metadata Recon
Objectives:

    Employ OSINT tools to gather sensitive information from metadata found in freely available target documents

    What is metadata and how is it important to our recon efforts?
        Data about data :)
            Information you don't normally see
                Author
                Creation date/time
                Other
                    metagoofil demo
                        Finds documents related to target
        Metadata can help
            Social Engineering
            Phishing
    How do we see this information?
        exif
        exiftool

=======================================================================================================================

Getting information:



Ex: $ metagoofil -d itpro.tv -t pdf,txt,docx -e 200


metagoofil -h                                                16 ⨯                                                                            
usage: metagoofil.py [-h] -d DOMAIN [-e DELAY] [-f] [-i URL_TIMEOUT]                                                                             
                     [-l SEARCH_MAX] [-n DOWNLOAD_FILE_LIMIT]                                                                                    
                     [-o SAVE_DIRECTORY] [-r NUMBER_OF_THREADS] -t                                                                               
                     FILE_TYPES [-u [USER_AGENT]] [-w]  




optional arguments:                 
  -h, --help            show this help message and exit                 
  -d DOMAIN             Domain to search.                               
  -e DELAY              Delay (in seconds) between searches. If it's    
                        too small Google may block your IP, too big     
                        and your searchmay take a while. Default:       
                        30.0        
  -f                    Save the html links to                          
                        html_links_<TIMESTAMP>.txt file.                
  -i URL_TIMEOUT        Number of seconds to wait before timeout for    
                        unreachable/stale pages. Default: 15            
  -l SEARCH_MAX         Maximum results to search. Default: 100         
  -n DOWNLOAD_FILE_LIMIT            
                        Maximum number of files to download per         
                        filetype. Default: 100                          
  -o SAVE_DIRECTORY     Directory to save downloaded files. Default     
                        is current working directory, "."               
  -r NUMBER_OF_THREADS  Number of downloader threads. Default: 8        
  -t FILE_TYPES         file_types to download                          
                        (pdf,doc,xls,ppt,odp,ods,docx,xlsx,pptx). To    
                        search all 17,576 three-letter file             
                        extensions, type "ALL"                          
  -u [USER_AGENT]       User-Agent for file retrieval against -d domain.
                        no -u = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
                        -u = Randomize User-Agent                       
                        -u "My custom user agent 2.0" = Your customized User-Agent
  -w                    Download the files, instead of just viewing     
                        search results.




========================================================================================================================================


NOTE: 'robots.txt' file is used to stop search engines from crawling websites. 

- The robots.txt file stops the websites from indexing (allwoing acccess to) certain extentions/content

- The robots.txt files tells search engiens 'you can't go there. It's disallowed.'
 
We need to look at this file whenever we see it on a server.


=====================================================================

tools

exiftool this tools can grab the metadata off any file that may have metadata present.

Ex:


(kali㉿kali)-[~]
└─$ exiftool Screenshot_2022-03-06_17_03_24.png 
ExifTool Version Number         : 12.40
File Name                       : Screenshot_2022-03-06_17_03_24.png
Directory                       : .
File Size                       : 664 KiB
File Modification Date/Time     : 2022:03:06 17:03:24+00:00
File Access Date/Time           : 2022:03:06 17:03:24+00:00
File Inode Change Date/Time     : 2022:03:06 17:03:24+00:00
File Permissions                : -rw-r--r--
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Image Width                     : 1920
Image Height                    : 1080
Bit Depth                       : 8
Color Type                      : RGB
Compression                     : Deflate/Inflate
Filter                          : Adaptive
Interlace                       : Noninterlaced
Significant Bits                : 8 8 8
Image Size                      : 1920x1080
Megapixels                      : 2.1
                           
