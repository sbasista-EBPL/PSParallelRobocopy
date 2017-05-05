#Define variables by computers in specific OUs
#$ComputerGrp1 = Get-ADComputer -Filter * -SearchBase "OU=Project Managers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name"
#$ComputerGrp2 = Get-ADComputer -Filter * -SearchBase "OU=HR,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name"
#$ComputerGrp3 = Get-ADComputer -Filter * -SearchBase "OU=dolphinswithlasers,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name"
#$ComputerGrp4 = Get-ADComputer -Filter * -SearchBase "OU=sharkswithlasersontheirheads,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name"
$ComputerGrps = Get-ADGroupMember -Identity "CN=Some Random Computer Group,OU=Groups,DC=drevilorg,DC=com" | Select-Object -ExpandProperty "Name"


#Define workflow LoLrobocopyworkflow
workflow LoLrobocopyworkflow {
    param([string[]]$ComputerGrps)

    $CurrentDate = Get-Date -Format "yyyy-MM-dd"

    #Define RoboCopy Variables
    $RoboCopySrc  = "local source directory"
    $RoboCopyDest = "destination directory"

    foreach -parallel ($computer in $ComputerGrps) {

        robocopy "$RoboCopySrc" "\\$computer\c$\Riot Games" /e /copyall /MIR /SECFIX /NP /R:1 /W:3 /MT:32 /LOG+:"$RoboCopyLog\$computer($CurrentDate).txt"

        }


    }