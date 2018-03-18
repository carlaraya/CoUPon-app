# CoUPon-app

## Seting Up Mailer


Make a new file with contents
```
development:
  GMAIL_USERNAME: <OUR EMAIL>
  GMAIL_PASSWORD: <OUR PASS>
```
and save it as `CoUPon-app/config/environment_variables.yml`.

## Installation

### Linux

_No need to install a ruby version manager or postgre manually._

First of all, if on Linux Mint, run to find out the base Ubuntu version:
```
$ cat /etc/upstream-release/lsb-release
```

An example output is trusty 14.04. This knowledge will be needed during Docker installation.

Follow these installation tutorials, in order.

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

https://docs.docker.com/engine/installation/linux/linux-postinstall/

https://docs.docker.com/compose/install/

### Windows/Mac

Install Docker Toolbox

Windows: https://docs.docker.com/toolbox/toolbox_install_windows/

Mac: https://docs.docker.com/toolbox/toolbox_install_mac/

For Windows, in the file ~/.docker/config.json, remove this line, if it exists:
```
"credsStore": "wincred"
```

### Rails Environment Installation

Then once the project is cloned, run to install ruby, rails, gems, and postgre:
```
$ docker-compose build
```

Open another terminal and run the server:
```
$ docker-compose up
```

Go back to previous terminal to setup the database:
```
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
```

Finally, go to http://localhost:3000/ to see that everything works correctly.

FOR WINDOWS/MAC: Enter `$ docker-machine ip default` and then go to `http://<the-output-ip-address>:3000/` instead of localhost.

RECOMMENDED BUT OPTIONAL: instead of typing `docker-compose run web rails` every damn time, add this line to `~/.bashrc`:

Linux:
```
railz() { docker-compose run web rails "$@"; sudo chown -R $USER:$USER .; }
```
Windows/Mac:
```
railz() { docker-compose run web rails "$@"; }
```

So instead of `$ docker-compose run web rails db:create` we can just run `$ railz db:create`.

(Note: from time to time, it will ask for sudo password, which is normal. For an explanation why, check out https://docs.docker.com/compose/rails/#build-the-project)

## Usage
To close the server, press Ctrl-C, or type in another terminal:
```
$ docker-compose down
```

To run it again (same as earlier):
```
$ docker-compose up
```

If running a rails command (e.g.: `$ rails generate controller Organization`), prepend `docker-compose run web`:
```
$ docker-compose run web rails generate controller Organization
```
or, if alias exists:
```
$ railz generate controller Organization
```

After modifying the Gemfile (or Dockerfile), run this instead of `bundle install`:
```
$ docker-compose build
```

## Troubleshooting

An error might appear when trying to start the server:
```
web_1 | A server is already
running. Check /CoUPon-app/tmp/pids/server.pid.
```
To fix, just delete the file `tmp/pids/server.pid` and restart the server.
If the error is persistent, do not use Ctrl-C to close the server. Instead, type `docker-compose down` on another terminal.

If the server complains `FATAL:  database "CoUPon-app_development" does not exist `, run these already mentioned commands while the server is running
```
$ railz db:create
$ railz db:migrate
$ railz db:seed
```
and then restart the server. Also, you might have to do this again after switching to a new branch.

If database still doesn't work, try dropping first _before_ running the 3 commands:
```
$ railz db:drop
```




For more info, read: https://docs.docker.com/compose/rails/
