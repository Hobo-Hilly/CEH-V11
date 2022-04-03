    Filename: eccouncil-ceh31250-v11-4-6-1-nfs-enumeration.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Enumeration
    Episode Name: NFS Enumeration ================================================================================

NFS Enumeration
Objectives:

    Define NFS and explain potential vulnerabilities
    Search for and access sensitive data using NFS tools

    What is NFS?
        Share local filesystem over network
            Remote users can mount filesystem, locally
                Centralization of data
        Uses TCP/UDP port 2049

    How do we check for NFS?
        nmap -A -T5 -n -Pn -p 2049 target_IP
        rpcinfo -p target_IP
        showmount -e target_IP
        rpc-scan.py (github)

    How do we access the NFS share?
        mkdir /tmp/NFS
        sudo mount -t nfs target_IP:/path/to/share /tmp/NFS
        ls /tmp/NFS
# And you should now see the output of the remote file system
# now on your screen. Now it's accessable just as if it were plugged
# in locally

# grep bash passwd

# less shadow

# cd var

# cd www

# cd to the www user and start checking drawers

=================================================================
MySQL uses port 3306

$ nmap -T4 -n -PN -p 3306 < machine ip >

$ mysql -u root -p -h 192.34.32.xx

#	-u 	# user
#	-p 	# prompt us for password
#	-h	# specify host

MySQL[(none)]> show databases;

MySQL[(none)]> use {name of database};

MySQL[(none)]> show tables;

MySQL[(none)]> select * from users;

"Any of you boys seen a hash around here?"

MySQL[(none)]> exit
Bye



find /tmp/NFS -name *passwords* 2>/dev/null

follow the bouncing ball.





#NFS USES port 2049


# A quick way to check nmaps' scripting engine.
	$ find / -name *.nse 2>/dev/null | gerp nfs























