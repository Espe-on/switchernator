#!/usr/bin/tclsh

puts "Welcome to $argv0"

set username [lindex $argv 0] 
set password [lindex $argv 1]
set listname [lindex $argv 2]

puts "Please check the following values are correct."
puts "Username is $username, Password is $password, Listname is $listname"
puts "Are these values correct? (y/n)" 
gets stdin areValuesCorrect
if {$areValuesCorrect != y} {
    puts "Please re-run script with correct values"
    exit 1 
} else {
    puts "values valid"
}

