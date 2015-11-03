# OrientDB image

Base image that exposes an [`orientdb`][orientdb] instance, in ports `2424` and
`2480`, using the default root password _0r13ntDB_.

## Running

To execute the image:

```bash
docker run -d --name orientdb kmussel/orientdb
```

It's also possible to redirect `orientdb` ports:

```bash
docker run -d --name orientdb -p 2424:2424 -p 2480:2480 kmussel/orientdb
```

To use another root password, redefine the environment variable
`ORIENTDB_ROOT_PASSWORD`:

```bash
docker run -d --name orientdb -e ORIENTDB_ROOT_PASSWORD=mysecurepassword kmussel/orientdb
```

To persist the data when the container is stopped use the -v option
```bash
docker run --name orientdb -d -p 2480:2480 -p 2424:2424 -e 'ORIENTDB_USER=kincurrent’ -e 'ORIENTDB_PWD=family' -v /var/lib/orientdb kmussel/orientdb
```

After running you'll need to go the url of the {hostip}:2480 and create the database and user that the web app will connect to. 
The environment variables set with the previous command - ORIENTDB_USER & ORIENTDB_PWD will be accessible from the web app when you link the docker containers together.  Docker will expose those env variables but prefixed with the the name of the link and "ENV" like ORIENTDB_ENV_ORIENTDB_USER.  

## LICENSE

Copyright (c) 2014

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[orientdb]: http://www.orientechnologies.com/orientdb/