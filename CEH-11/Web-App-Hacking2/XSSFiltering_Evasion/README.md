    Filename: eccouncil-ceh31250-v11-14-10-1-xss-filtering-evasion.md
    Show Name: CEHv11 (312-50)
    Topic Name: Web Application Hacking - Hacking Web Applications
    Episode Name: Input Filtering Evasion ================================================================================

XSS Filtering Evasion
Objectives:

    Define Client-Side Controls
    List and explain common Client-Side Control bypass techniques

    List of filtering evasion techniques
        Character Encoding
            https://www.asciitable.com
            HTML Elements
                &#x6A; (hex) or &#106; (decimal)
                    Starts with &#
                    Ends with ;
                Further aided by zero padding
                    &#000000x6A;
                    Zeros are ignored, but change the string for filter evasion
            Base64
            Whitespace
                Space
                Tab
                Newline
            Script Tag Manipulation
                Get weird
                    Mixed case
                    script in script <sc<script>ript>
            Polyglots
