# Go Webserver

This is an example project used to demonstrate an understanding of a basic
file webserver for serving static sites, including those generated with
bundling tools such as Vite.

## Usage

```sh
gh repo create -p cyrus01337/go-webserver --public --clone $(basename $PWD) .
```

`.` is the current directory, meaning the project will be generated in the directory this command is
invoked under, whereas omitting the `.` (path) creates a sub-directory and goes through the typical
interactive installation.

The webserver relies on an optional `.env` file to determine the port and build
directory through the respective `PORT=` and `BUILD_DIRECTORY=` environment
variables. For an example environment file (or a lazy edit), see `defaults.env` which is used
internally for default variables.
