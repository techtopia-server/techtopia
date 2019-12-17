# Techtopia

The goal is to create a simple docker setup, which is higly customizable, and can be run of an external harddrive, so the server can easily be moved between physical servers.

This does not have high availability, so if stability is your main goal this might not be the project for you.

It has web load balancing and https (through let's encrypt) build in.

## Installing

To register the command globally run `npm link`.

If you don't have npm, this isn't strictly needed, just substitute `techtopia` command with `./scripts/techtopia.sh` from inside the git root or add `./scripts` to your system's path variable

## Stacks

https://code.mortenolsen.pro/techtopia-stacks

## Usage

`techtopia install <git-url> <stack-name>` install a stack from a git repository

`techtopia all` will run docker commands on all enabled containers, for instance `techtopia all up -d` will start all enabled stacks in daemon mode

`techtopia single <stack-name>` works the same as the command above, but on a specific stack `techtopia single pim up -d`. This also works on disabled stacks

`techtopia enable <stack-name>` enables a stack and starts it in daemon mode if not already running

`techtopia disable <stack-name>` disabled a stack and stops it if currently running

`techtopia list` show a list of stacks and if they are enabled or not

`techtopia link <stack-name>` link current directory as a stack in techtopia

`techtopia run <stack-name> <script-name>` runs `script-name` from inside the stacks `scripts` folder. useful for container util scripts or setup scripts

`techtopia run-list <stack-name> ` show available commands for a stack

## Hooks

To add a hook, create a script in `./hooks/<hook-name>.sh`

**Available hooks are:**
* **pre-command** for validation environment before executing any command. Good for testing if all vars has been set. To stop execution you can use `exit 1`
* **post-command**
* **pre-update**
* **post-update**