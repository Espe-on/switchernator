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
    switchReconfigTool $username $password "sw-cllgb401-2.ldn.framestore.com" "interface range Gi1/0/45,Gi1/0/47" "switchport general pvid 2660"
}

#Run
main [lindex $argv 0] [lindex $argv 1]