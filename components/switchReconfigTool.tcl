proc switchReconfigTool {username password hostname portList vlan} {
    spawn ssh "$username@$hostname" 
    expect {
        "$username@$hostname's password:"
        }
    send "$password\r"
    puts "password sent"
    expect "$hostname>"
    send "enable\r"
    expect "$hostname#"
    send "configure\r"
    expect "$hostname[subst (config)#]"
    foreach port $portList \{
        set runningConfigResponse {}
        send "show running-config interface $port\r"
        expect {
            -regexp {..*} {
                set runningConfigResponse "${accum}$expect_out(0,string)" 
                exp_continue
            }
        }
        puts "Pre change config for $port on $hostname is: \n $runningConfigResponse"
        send ""
        }

}