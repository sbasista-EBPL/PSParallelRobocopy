$ComputerGrp1 = 'somerandomcomputer','somerandomcomputer2'
$ComputerGrp2 = 'someotherrandomcomputer', 'someotherrandomcomputer2'
$ComputerGrp3 = 'otherrandomcomputer', 'otherrandomcomputer2'
$ComputerGrp4 = 'randomcomputer', 'randomcomputer2'



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
#this is a test
#this is another test