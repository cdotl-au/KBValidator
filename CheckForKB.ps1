param(
    [string]$KBID,
    [string]$hostsFile = "hosts.csv",
    [string]$logFile = "log.txt"
)

$computers = Import-Csv -Path $hostsFile
$hostCount = $computers.Count
$successCount = 0
$errorCount = 0

$timer = Measure-Command {
    foreach ($computer in $computers) {
        $ComputerName = $computer.Name  # Assumes 'Name' is the column title for computer names in the CSV
        $timestamp = Get-Date -Format "dd-MMM-yyyy HH:mm:ss"
        $isError = $false

        try {
            $result = Invoke-Command -ComputerName $ComputerName -ScriptBlock {
                param($KBID)
                $hotfix = Get-HotFix | Where-Object {$_.HotfixID -eq $KBID}
                if ($hotfix) {
                    return "Found $KBID on $env:COMPUTERNAME"
                } else {
                    return "$KBID is not installed on $env:COMPUTERNAME."
                }
            } -ArgumentList $KBID -ErrorAction Stop
            $successCount++
        }
        catch {
            $result = "Failed to check $KBID on $ComputerName. Error: $_"
            Write-Host $result -ForegroundColor Red
            $isError = $true
            $errorCount++
        }

        $output = "$timestamp - $result"
        if (-not $isError) {
            Write-Host $output
        }
        $output | Out-File -Append -FilePath $logFile
    }
}

Write-Host "Hosts checked: $hostCount" 
Write-Host "Successes: $successCount"
Write-Host "Errors: $errorCount"
Write-Host "Total time elapsed: $($timer.TotalSeconds) seconds"
