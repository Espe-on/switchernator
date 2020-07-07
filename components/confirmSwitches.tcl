proc confirmSwitches {listOfSwitches} {
    puts "Please Confirm that you want to update the following network switches"
    foreach switchHostname $listOfSwitches {
        puts $switchHostname
    }
    puts "Are these values correct? (y/n)" 
    gets stdin areValuesCorrect
    if {$areValuesCorrect != y} {
        puts "Exiting Script - please update data/switches.data with correct values"
        exit 2 
    }  else {
        puts "List of switches validated"
    }
}