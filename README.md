# Go Webserver

This is an example project used to demonstrate an understanding of a basic
file webserver for serving static sites, including those generated with
bundling tools such as Vite.

## Usage

```sh
gh repo create -p cyrus01337/go-webserver --public --clone $(basename $PWD) . --
--recurse-submodules
```

`.` is the current directory, meaning the project will be generated in the directory this command is
invoked under, whereas omitting the `.` (path) creates a sub-directory and goes through the typical
interactive installation.

To run the application:
```sh
go run .
```

To deploy the application:
```sh
docker compose up -d
```
