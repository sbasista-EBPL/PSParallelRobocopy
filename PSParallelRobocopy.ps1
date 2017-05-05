#Define RoboCopy Variables
$RoboCopySrc  = "local source directory"
$RoboCopyDest = "destination directory"


#Define variables by computers in specific OUs
$ComputerGrp1 = (Get-ADComputer -Filter * -SearchBase "OU=Project Managers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp2 = (Get-ADComputer -Filter * -SearchBase "OU=HR,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp3 = (Get-ADComputer -Filter * -SearchBase "OU=dolphinswithlasers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()
$ComputerGrp4 = (Get-ADComputer -Filter * -SearchBase "OU=sharkswithlasersontheirheads,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name" | Out-String).trim()


workflow LoLrobocopyworkflow {
    param([string[]]$ComputerGrp1,[string[]]$ComputerGrp2,[string[]]$ComputerGrp3,[string[]]$ComputerGrp4)

    $CurrentDate = Get-Date -Format "yyyy-MM-dd"

    foreach -parallel ($server in $ComputerGrp1) {

        robocopy "$RoboCopySrc" "\\$server\c$\Riot Games" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"$RoboCopyLog\$server($CurrentDate).txt"

        }

    foreach -parallel ($server in $ComputerGrp2) {

        robocopy "$RoboCopySrc" "\\$server\c$\Riot Games" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"$RoboCopyLog\$server($CurrentDate).txt"

        }

    foreach -parallel ($server in $ComputerGrp3) {

        robocopy "$RoboCopySrc" "\\$server\c$\Riot Games" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"$RoboCopyLog\$server($CurrentDate).txt"


        }

    foreach -parallel ($server in $ComputerGrp4) {

        robocopy "$RoboCopySrc" "\\$server\c$\Riot Games" /e /copyall /MIR /SEC /SECFIX /NP /TEE /R:4 /W:30 /MT:32 /LOG+:"$RoboCopyLog\$server($CurrentDate).txt"

        }

    }