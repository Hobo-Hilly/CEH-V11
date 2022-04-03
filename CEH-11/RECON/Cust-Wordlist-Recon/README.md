    Filename: eccouncil-ceh31250-v11-2-9-1-custom-wordlists.md
    Show Name: CEHv11 (312-50)
    Topic Name: Footprinting and Recon
    Episode Name: Custom Wordlists

================================================================================
Custom Wordlists
Objectives:

    Gather words from target's website to generate a custom wordlist
    Use custom wordlist in brute-force attacks

    Let's start be defining the term 'wordlist'
        A simple text file
        Each line contains a 'word'  # One line One Word even if its multiple words. Ex: 'the brown cow moos' if it's on one line then it's ONE password.
        Used by hackers to perform password attacks

    Are there standard wordlists in common use, and if so why would we make a 'custom' wordlist?
        Standard wordlists exist
        Custom wordlists will 'fill the gaps'

    Can you explain what you mean by 'fill the gaps'?
        Users make passwords they can remember
            Therefore passwords typically are related to their everyday lives
                Work
                Hobbies
                Family
        Let's focus on the 'Work' category
            Employees use work related words in passwords
                Custom wordlists with work-related words = more effective word lists

    It's all making sense to me now. So the question then becomes how do we create a custom wordlist?
        Manually (too much time)
        Tools/Automation
            cewl demo
==================================================================
