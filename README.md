# switchernator
A TCL script for bulk interfacing with network ports. 

The script is run with three arguments. First is the username for the switches. Second is the Password for the switches.

The program will look into the data directory for a file called switches.data 

This should be a list of switch hostnames and should have corresponding files called &hostname.data. 

## Exit Codes

### 1 
Username and Password failed validation 

### 2 
Unable to read switches.data

### 3 
Unable to read lists of ports 

### 4 
SSH Error 