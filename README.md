# Docker vscode-elixir

Use `elixir 1.8.2` and `erlang OTP 22.2`

## How to use

To launch the "IDE" and set the current folder as the root of your application:

```
$ docker run -ti --rm --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v "$PWD":/var/www/html -e DISPLAY=unix$DISPLAY --device /dev/dri --name vscode --net="host" zaioll/vscode-elixir
```

You can set up bash alias for the command above, for example:

```
$ nano ~/.bashrc
```

```
alias vscode='docker run -ti --rm --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v "$PWD":/var/www/html -e DISPLAY=unix$DISPLAY --device /dev/dri --name vscode --net="host" zaioll/vscode-elixir'
```
```
$ source ~/.bashrc
```

Once you set up the alias above, you can simply launch your "IDE" with simple command vscode.
Stop:

To stop the container and auto-remove it: Just use Ctrl+C