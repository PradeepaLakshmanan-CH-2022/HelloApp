# Set the application path
$consoleAppPath = "C:\Hello\HelloApp"

# Set the output file path
$outputFilePath = "C:\Outputfile\Output.txt"

# Get the current timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Run the console application and capture the output with the timestamp
$outputContent = & dotnet run --no-restore --no-build --project $consoleAppPath

# Combine the output with the timestamp
$outputContentWithTimestamp = "Console application output ($timestamp):`r`n$outputContent"

# Append the output to the file
$outputContentWithTimestamp | Out-File -FilePath $outputFilePath -Append -Encoding UTF8
