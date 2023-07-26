# AWS CLI Profile Loader

This repository contains a bash function that helps to load AWS CLI profiles stored in your environment variables. The function prompts for a profile name, then sets up the AWS CLI to use the credentials associated with that profile.

## Setup

1. Clone the repository:

    ```
    git clone https://github.com/yourusername/aws-cli-profile-loader.git
    cd aws-cli-profile-loader
    ```

2. Edit your `.bashrc`:

    Open your `.bashrc` file in your favourite text editor:

    ```bash
    vi ~/.bashrc
    ```

    Then, add the following bash function at the end of the file:

    ```bash
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
    ```

    Finally, call the function at the end of the `.bashrc`:

    ```bash
    load_profile
    ```

3. Save and close the file.

    Your changes will take effect the next time you start a new shell. If you want them to take effect immediately in your current shell, you can run:

    ```bash
    source ~/.bashrc
    ```

## Usage

Whenever you open a new terminal, the function will automatically prompt you to enter the name of the AWS profile that you want to use. After you enter the name, the function will load the environment variables for that profile and set up the AWS CLI to use those credentials.

If you want to switch profiles, just call the `load_profile` function:

```bash
load_profile
```

## Note

The `.bashrc` file is one of the shell configuration files where you can define functions, aliases, and environment variables, and it is run whenever you start a new shell. Depending on your system setup, you may need to add the function to other files such as `.bash_profile`, `.profile`, or `.zshrc` (if you're using Zsh). If you want the function to run for all users, you could consider adding it to `/etc/profile` or `/etc/bash.bashrc` instead. 

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)