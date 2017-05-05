#Pull "Some Random Computer Group" group members 
$ComputerGrps = Get-ADGroupMember -Identity "CN=Some Random Computer Group,OU=Groups,DC=drevilorg,DC=com" | Where-Object{$_.name -notlike "dolphinswithlasers*"}  | Select-Object -ExpandProperty "Name"


#Define workflow LoLrobocopyworkflow
workflow LoLrobocopyworkflow {
    param([string[]]$ComputerGrps)

    $CurrentDate = Get-Date -Format "yyyy-MM-dd"

    #Define RoboCopy Variables
    $RoboCopySrc  = "local source directory"
    $RoboCopyDest = "destination directory"

    foreach -parallel ($computer in $ComputerGrps) {

        robocopy "$RoboCopySrc" "\\$computer\c$\Riot Games" /MIR /SECFIX  /copyall /NP /R:1 /W:3 /MT:16 /LOG+:"$RoboCopyLog\$computer($CurrentDate).txt"

        }


    }