# KBValidator

Purpose of the script is validating or checking Windows KB installations.

CheckForKB

To run in a powershell window with the appropriate privs (elevated):

.\CheckForKB.ps1 -KBID "KB5027282"

You can specify the hosts csv file and output log file path as parameters when calling the script:

.\CheckForKB.ps1 -KBID "KB5027282" -hostsFile "C:\Path\To\Your\hosts.csv" -logFile "C:\Path\To\Your\log.txt"

Replace the KBXXXXXXX with the KB you wish to check for.

Hosts File:

- Create a CSV hosts file with a list of all the computer names to check for the KB. 
- This script assumes that your CSV file has a column labeled 'Name' for the computer names. 
- If the column has a different name, adjust the script accordingly. 

Output:

- The script outputs the results to log.txt
- The script outputs the results to the console as it runs
- A summary of success and errors is printed to the console

Example output:

18-Jul-2023 10:43:05 - Found KB5027282 on PC-DC01
18-Jul-2023 10:43:07 - Found KB5027282 on PC-DC04
18-Jul-2023 10:43:09 - Found KB5027282 on PC-DC05
18-Jul-2023 10:43:11 - Found KB5027282 on PC-DC02
18-Jul-2023 10:43:13 - Found KB5027282 on PC-DC07
18-Jul-2023 10:43:16 - Found KB5027282 on PC-DC09
18-Jul-2023 10:43:31 - Found KB5027282 on PC-DC10
18-Jul-2023 10:43:48 - KB5027282 is not installed on PC-DC12.
18-Jul-2023 10:44:03 - Found KB5027282 on PC-DC21
18-Jul-2023 10:44:05 - Found KB5027282 on PC-DC14
18-Jul-2023 10:44:07 - Found KB5027282 on PC-DC15
18-Jul-2023 10:44:09 - Found KB5027282 on PC-DC22
18-Jul-2023 10:44:10 - Found KB5027282 on PC-DC31
18-Jul-2023 10:44:12 - Found KB5027282 on PC-DC32
18-Jul-2023 10:44:27 - Found KB5027282 on PC-DC42
18-Jul-2023 10:44:34 - Found KB5027282 on PC-DC22
Hosts checked: 34
Successes: 25
Errors: 9
Total time elapsed: 1678.4703386 seconds
