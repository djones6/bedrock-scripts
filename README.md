# bedrock-scripts
Some scripts I threw together to run / manage a Linux Bedrock server.

These assume you already have a Linux Bedrock server and want to make it easier to live with. You should review the scripts and adjust values appropriately for your environment.

They have only been tested in one environment (mine) so use caution. I did a quick tidy up before sharing but nothing more. Pull requests are welcome!

### Initial set-up

- Install Docker, if not already installed
- Edit `Dockerfile`, replacing the UID and GID to match your local user. This is necessary because we're going to bind mount the server directory into the container.
- Build the image to run the server:
```
docker build -t minecraft .
```
- Copy the `minecraft` shell script into your path (eg: `$HOME/bin`)
- Edit the variables at the top of the script to match your filesystem. Specifically, `MC_BASE` and `MC_WORLD` (you may want to change the name in `MC_BKP` to match).

### Using `minecraft` command

Run `minecraft help` for a list of commands.

The `start` and `stop` commands can be used to start and stop the server. The server will run inside a Docker container, and is started within a `screen` session to make it easier to run via a remote terminal.

The `connect` command will connect you to the screen session, so that you can interact with the server console. To disconnect, either close your terminal, or press `CTRL+A` followed by `D` to disconnect from the screen session.

The `say some message` command will execute a "Say (some message)" in the server console. Handy if you want to automate a message, eg. from cron.

The `backup` and `restore` commands will backup and restore the server's state. The server should be stopped before doing this.

The `upgrade` command will stop the server (if running), take a backup, then attempt to upgrade the server by downloading and unpacking the latest version from minecraft.net. The configuration files will be restored after the update.
