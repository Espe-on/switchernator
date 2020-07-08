proc switchReconfigTool {username password hostname port vlan} {
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
    set runningConfigFirstResponse {};
    send "show running-config interface $port\r";
    expect {
        -regexp {..*} {
             set runningConfigFirstResponse "${accum}$expect_out(0,string)" 
              exp_continue
          }
      };
    puts "Pre change config for $port on $hostname is: \n $runningConfigFirstResponse";
    send "interface $port\r";
    expect "$hostname[subst (config-if-]$port[subst )#]";
    send "switchport general pvid $vlan\r"
    expect "$hostname[subst (config-if-]$port[subst )#]";
    send "exit\r"
    expect "$hostname[subst (config)#]";
    set runningConfigSecondResponse {};
    send "show running-config interface $port\r";
    expect {
        -regexp {..*} {
             set runningConfigSecondResponse "${accum}$expect_out(0,string)" 
              exp_continue
          }
      };
    puts "Post change config for $port on $hostname is: \n $runningConfigSecondResponse";
    send "exit\r";
    expect "$hostname#";
    send "write\r";
    expect "Are you sure you want to save? (y/n)";
    send "y\r";
    expect "$hostname>";
    send "exit\r";
    expect "closed";
    puts "Connection to $hostname closed"
}