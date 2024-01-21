# Get all PDF files in the current folder
$pdfFiles = Get-ChildItem -Path . -Filter *.pdf

foreach ($pdfFile in $pdfFiles) {
    # Create a folder with the same name as the PDF file (without extension)
    $folderName = $pdfFile.BaseName
    $folderPath = Join-Path -Path . -ChildPath pdfs/$folderName

    # Check if the folder already exists, if not, create it
    if (-not (Test-Path -Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath
    }

    # Move the PDF file into its respective folder
    Copy-Item -Path $pdfFile.FullName -Destination $folderPath
}

$ButtonType = [System.Windows.Forms.MessageBoxButtons]::OK

$MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Information

$MessageBody = "File Orgnization Complete"

$MessageTitle = "pdf-to-folder"

$Result = [System.Windows.Forms.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)


Write-Host "Organizing PDF files completed."

