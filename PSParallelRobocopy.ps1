$ComputerGrp1 = (Get-ADComputer -Filter * -SearchBase "OU=Project Managers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp2 = (Get-ADComputer -Filter * -SearchBase "OU=HR,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp3 = (Get-ADComputer -Filter * -SearchBase "OU=dolphinswithlasers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp4 = (Get-ADComputer -Filter * -SearchBase "OU=sharkswithlasersontheirheads,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()



workflow testrobocopy {
    param([string[]]$ComputerGrp1,[string[]]$ComputerGrp2,[string[]]$ComputerGrp3,[string[]]$ComputerGrp4)

    $CurrentDate = Get-Date -Format "yyyy-MM-dd"

    foreach -parallel ($server in $ComputerGrp1) {

        robocopy "local source" "\\$server\c$\destination directory" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"C:\Logs\$server($CurrentDate).txt"

        }

    foreach -parallel ($server in $ComputerGrp2) {

        robocopy "local source" "\\$server\c$\destination directory" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"C:\Logs\$server($CurrentDate).txt"

        }

    foreach -parallel ($server in $ComputerGrp3) {

        robocopy "local source" "\\$server\c$\destination directory" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"C:\Logs\$server($CurrentDate).txt"


        }

    foreach -parallel ($server in $ComputerGrp4) {

        robocopy "local source" "\\$server\c$\destination directory" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"C:\Logs\$server($CurrentDate).txt"

        }

    }