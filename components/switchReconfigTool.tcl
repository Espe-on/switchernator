proc switchReconfigTool {username password hostname switchportRange switchportCommand} {
    spawn ssh "$username@$hostname";
    expect {
        -nocase "could not resolve hostname" {
            puts "could not find switch $hostname"
            return}
        "$username@$hostname's password:" {
            puts "connected to $hostname sucessfully";
        }
        };
    send "$password\r";
    puts "password sent";
    expect "$hostname>";
    send "enable\r";
    expect "$hostname#";
    send "configure\r";
    expect "$hostname[subst (config)#]";
    puts "Sending $switchportRange"
    send "$switchportRange\r";
    expect "$hostname[subst (config-if)#]";
    send "$switchportCommand\r"
    expect "$hostname[subst (config-if)#]";
    send "exit\r"
    expect "$hostname[subst (config)#]";
    send "exit\r";
    expect "$hostname#";
    send "write\r";
    expect {"Are you sure you want to save? (y/n)";}
    send "y\r";
    expect "$hostname>";
    send "exit\r";
    expect "closed";
    puts "Connection to $hostname closed";
    return;
};