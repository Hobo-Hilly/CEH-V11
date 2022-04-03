    Filename: eccouncil-ceh31250-v11-3-14-1-nmap-scan-optimizations.md
    Show Name: CEHv11 (312-50)
    Topic Name: Recon Techniques - Scanning
    Episode Name: Nmap Scan Optimizations ================================================================================

Nmap Scan Optimizations
Objectives:

    Customize nmap scan attributes in order to optimize or reduce scan completion times
    List common techniques for increasing scan efficiency

    Kathy - Define what we mean when we say 'Optimized'
        Running scans that we need to run
        Not running scans that we don't need to run
        Running scans as fast as possible

    How do we determine what scans we do/don't need to run?
        Usually a 'reductionist' model
            Start by casting the widest net, then increase focus

    Can you show us what that would look like?
        Demo (scanme.nmap.org)
            -n
            -Pn
            -p

    Are there any other 'speed' tricks with nmap?
        -T1-T5
