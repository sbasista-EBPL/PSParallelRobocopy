$computers = 'somerandomcomputer'

workflow testrobocopy {
    param([string[]]$computers)

    $CurrentDate = Get-Date -Format "yyyy-MM-dd"

    foreach -parallel ($server in $computers) {

        robocopy "local source" "\\$server\c$\destination directory" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"C:\Logs\$server($CurrentDate).txt"

        }

    }