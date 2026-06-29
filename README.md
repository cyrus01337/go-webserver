# Go Webserver

This is an example project used to demonstrate an understanding of a basic
file webserver for serving singular files and, in the future, bundled sites like
those generated with bundling tools such as Vite.

## Usage

```sh
gh repo create -p cyrus01337/go-webserver --public --clone $(basename $PWD) .
```

`.` is the current directory, meaning the project will be generated in the directory this command is
invoked under, whereas omitting the `.` (path) creates a sub-directory and goes through the typical
interactive installation.
