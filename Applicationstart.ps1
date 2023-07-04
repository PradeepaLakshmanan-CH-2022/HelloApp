# Stop the console application if it's already running
Get-Process -Name "HelloApp" -ErrorAction SilentlyContinue | Stop-Process -Force

# Specify the path to your console application executable
$consoleAppPath = "C:\Hello\HelloApp"

# Specify the path for the output file
$outputFilePath = "C:\Outputfile\Output.txt"

# Get the current timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Run the console application and redirect the output to a file
Start-Process -FilePath "dotnet" -ArgumentList "run", "--no-restore", "--no-build", "--project", $consoleAppPath -NoNewWindow -Wait | Out-File -FilePath $outputFilePath -Encoding UTF8

# Read the output file and display its contents
$outputContent = Get-Content -Path $outputFilePath -Raw
Write-Host "Console application output:"
Write-Host $outputContent
