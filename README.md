# Switchernator

## Description
A TCL/Expect script for bulk interfacing with network ports. 

## Requirements 
This script requires [tcl]() and [tcl-expect](). 

On Debian these are installed with: 
```
$ sudo apt-get update && sudo apt-get install tcl tcl-expect
```
## How to run


To run the script navigate into the root diectory of this repo and set the main script to executable:
```
$ chmod +x switchernator.tcl 
```
Then run the script with two arguments, first is the username for the switches, second is the password for the switches. Currently different usernames and passwords for the switches are unsupported to discourage people from writing down their credentials in a GitHub repo. 

The program will look in file ``` data/switches.data ``` to generate a list of switches. Each hostname should be written on a single line in the file.

For example:

```
$ cat data/switches.data 
switch1.example
switch2.example
switch3.example
```

 For each entry in ```switches.data``` there should be a file inside of ```data/switches/``` containing the port and destination VLANs for the switch.



### Exit Codes

#### 1 
Username and Password failed validation 

#### 2 
Incorrect data read from switches.data

#### 3 
Unable to read lists of ports 

#### 4 
SSH Error 