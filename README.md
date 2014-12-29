acme-ui
=======

The Angular UI application

###Project Layout
[server](https://github.com/wgorder/acme-ui/tree/master/server)
[client](https://github.com/wgorder/acme-ui/tree/master/client)

###Build dependencies
* [Install node/npm](http://nodejs.org/)
* [Install Bower](http://bower.io/#install-bower)
* [Install Gulp](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md)

### Build
```
./gradlew build
```

For more verbose output run with the debug flag

```
./gradlew build --debug
```

### Run only acme-ui
~~./gradlew :bootRun~~
wont work due to this bug -- https://github.com/spring-cloud/spring-cloud-netflix/issues/60

Instead do it the old fashion way...

```
java -jar acme-ui.jar
```

If you wish to run this with unoptimized js/css for easy debugging, and have your changes on the file system to static resource update immediately, you can run this application as follows.

From the root acme-ui directory, run the following command:

```
java -jar server/build/libs/acme-ui.jar --spring.profiles.active=local-dev --app.workdir=/Users/billy/Dev/Git-Repos/spring-cloud-examples/acme-ui

```
Where app.workdir is the full path to the acme-ui directory.

To enable automatic rebuilding of the coffee and less run the following command in a new window.

```
cd client
gulp watch

```

Now whenever you make changes to coffee or less files they will be automatically updated when you refresh your browser.  You can see how this works by examining the WebConfig in the server.  This was inspired by the resource handling talk at s2gx.  Basically what happens is when the local-dev profile is active static resources are read right off the file system and caching is disabled.


### Run All the applications
See [spring-cloud-examples](https://github.com/wgorder/spring-cloud-examples)
