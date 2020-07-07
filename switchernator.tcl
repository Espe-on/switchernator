#!/usr/bin/tclsh

# import block
source "components/checkArguments.tcl"
source "components/readFileToList.tcl"
source "components/confirmSwitches.tcl"

#Main body of program
proc main {username password } {
    puts "Welcome to Switchernator"
    checkArguments $username $password
    set listOfSwitches [readFileToList "data/switches.data"]
    confirmSwitches $listOfSwitches
}

#Run
main [lindex $argv 0] [lindex $argv 1]