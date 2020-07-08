proc switchReconfigTool {username password hostname switchRange switchportCommand} {
    spawn ssh "$username@$hostname";
    expect {
        "$username@$hostname's password:"
        };
    send "$password\r";
    puts "password sent";
    expect "$hostname>";
    send "enable\r";
    expect "$hostname#";
    send "configure\r";
    expect "$hostname[subst (config)#]";
    send "$switchRange\r";
    expect "$hostname[subst (config-if)#]";
    send "$switchportCommand\r"
    expect "$hostname[subst (config-if)#]";
    send "exit\r"
    expect "$hostname[subst (config)#]";
    send "exit\r";
    expect "$hostname#";
    send "write\r";
    expect "Are you sure you want to save? (y/n)";
    send "y\r";
    expect "$hostname>";
    send "exit\r";
    expect "closed";
    puts "Connection to $hostname closed"
};