proc checkArguments {username password } {
    puts "Please check the following values are correct."
    puts "Username is $username, Password is $password"
    puts "Are these values correct? (y/n)" 
    gets stdin areValuesCorrect
    if {$areValuesCorrect != y} {
        puts "Please re-run script with correct values"
        exit 1 
    }  else {
        puts "values valid"
    }
}
