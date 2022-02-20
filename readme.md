# Kotlin Wrapper

This project contains shell/command scripts (kotlinw for Linux and kotlinw.cmd for Windows 10+)
that helps you to run kotlin programs/scripts on the command line.

The scripts can download and put kotin on your PATH available for use
(similarly to gradlew for Gradle).

Typical usage (you still need to make sure you have a correct JAVA_HOME env variable):

`kotlinw kotlin -version`

or

`kotlinw kotlin hello.kts`

