# Returns the pid of process in charge of the given port
pid_for() {
    echo $(ss -lptn "sport = :$1")
    echo "---------\n"
    echo $(netstat -nlp | grep ":$1")
    echo "---------\n"
    echo $(lsof -n -i ":$1" | grep LISTEN)

}

# Prints out the difference between file1 and file2
intersect_files() {
    comm -23 <(sort $1) <(sort $2)
}
