#!/usr/bin/tclsh

puts "Welcome to $argv0"

set username [lindex $argv 0] 
set password [lindex $argv 1]
set listname [lindex $argv 2]

puts "username is $username, password is $password, listname is $listname"

