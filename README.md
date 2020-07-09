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
The script is run with two arugments, first is the username for the switches, second is the password for the switches.

For example the following command would give a username of "espeon" and a password of "examplepassword": 
```
$ ./switchernator.tcl espeon examplepassword

```
 Currently different usernames and passwords for the switches are unsupported to discourage people from writing down their credentials in a GitHub repo. 

The program will look in file ``` data/switches.data ``` to generate a list of switches with associated commands. Each hostname should be written on a single line in the file with each of two commands separated by a %.

For example:

```
$ cat data/switches.data 
exampleswitchone.place.com%interface range Gi1/0/11,Gi1/0/44%switchport general pvid 1111
exampleswitchtwo.place.com%interface range Gi1/0/2,Gi1/0/19%switchport general pvid 2222
```

### Exit Codes

#### Exit Code: 1
Username and Password failed validation 

#### Exit Code: 2
Incorrect data read from switches.data

#### Exit Code: 3
Unable to read lists of ports 

#### Exit Code: 4
SSH Error 