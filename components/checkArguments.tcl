proc checkArguments {username password} {
    if {$username == ""} {
        puts "Please Input A Username";
        exit 1;
        } ;
    if {$password == ""} {
        puts "Please Input A Password";
        exit 1;
        };
    puts "Please check the following values are correct.";
    puts "Username is $username,\n Password is $password";
    puts "Are these values correct? (y/n)" ;
    gets stdin areValuesCorrect;
    if {$areValuesCorrect != y} {
        puts "Please re-run script with correct values";
        exit 1;
    }  else {
        puts "Username and Password Validated";
    };
};
