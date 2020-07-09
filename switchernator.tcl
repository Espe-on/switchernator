#!/usr/bin/expect -f

# import block
source "components/checkArguments.tcl";
source "components/readFileToList.tcl";
source "components/confirmSwitches.tcl";
source "components/switchReconfigTool.tcl";

#Main body of program
proc main {username password} {
    puts "Welcome to Switchernator";
    checkArguments $username $password
    set listOfSwitches [readFileToList "data/switches.data"]
    confirmSwitches $listOfSwitches;
    foreach line $listOfSwitches {
        set switchInstructions [split $line "%"];
        set switchHostname [lindex $switchInstructions 0];
        set commandOne [lindex $switchInstructions 1];
        set commandTwo  [lindex $switchInstructions 2];
        switchReconfigTool $username $password $switchHostname $commandOne $commandTwo
    }
}

#Run
main [lindex $argv 0] [lindex $argv 1]