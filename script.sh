load_profile() {
    echo "Enter the profile name: "
    read profile_name

    if [ ! -f ~/.env/"$profile_name" ]; then
        echo "Profile '$profile_name' not found!"
        return 1
    fi

    source ~/.env/"$profile_name"

    # Update the PS1 prompt with the current profile name and export the variable
    export AWS_PROFILE=$profile_name
    PS1="[$profile_name] $PS1"
}
