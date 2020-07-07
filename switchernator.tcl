#!/usr/bin/tclsh

# import block
source "components/checkArguments.tcl"

#set arguments to variables
set username [lindex $argv 0] 
set password [lindex $argv 1]

#Main body of program
proc main {username password } {
    puts "Welcome to Switchernator"
    checkArguments $username $password
    puts "back to main proc"
}

#Run
main $username $password