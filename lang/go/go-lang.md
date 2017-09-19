https://rominirani.com/setup-go-development-environment-with-atom-editor-a87a12366fcf#.ar40sp537

We will going to add additional plugins to make our Go Development easier inside of Atom.
First up, we are go to install and setup the Atom Editor with the required plugins. Follow these steps to install and setup Atom Editor.
Download and install the Atom Editor from https://atom.io
Ensure you have already installed Go on the same development machine.
Make sure that GO binaries are available in the PATH and that GOPATH Environment variable has been set up too.
Make sure that you are connected to the Internet since the plugins will be downloaded from external repositories.
Launch Atom.
Go to Preferences/Settings.
Click on +Install
In the Search packages search box, enter the following: go-plus. You should see one result come up as shown below. Click on Install and let it complete.
image03
Now go ahead and do the following additional steps too:
Search + install the following plugins too: autocomplete-go
Close Atom Editor and launch it again.
Go to Packages > Go Plus as shown below and select Get Missing Tools. This will download the rest of the tools for you.
image05
To validate the setup, go to Packages > Go Plus and Display Go Information. You should see a summary display as shown below. Notice that it has detected your Go binaries and also the GOPATH information.
Finally we want to install a terminal/console in Atom Editor itself , so that you can run your Go code directly from within the editor itself and you do not need to go outside. Go ahead and search + install the following plugin : terminal-plus. Go ahead and install it.
Restart your Atom Editor again.
Atom Editor in Action
Let us now validate our Atom Editor setup that we did and what we have got in return for all the plugins that we installed so far.
Assuming that you have launched the Atom Editor, the first step to do is to add a Project folder. Assuming that you have setup the GOPATH for your Go Projects, you can select a folder in which you are going to keep your project files.
In the Atom Editor, go to File > Add Project Folder… This will bring up a Folder selection dialog and you can point it to the root of your application.
Create a new file named main.go as follows and you can put in the standard Hello World program.
While typing do notice that auto-complete is now available (try Ctrl-Space too):
image02
On saving a file at any time, the file is checked for any compile time issues and several other things like automatically adding the imports or removing them if you are not using them is taken care of. That’s pretty neat. Go ahead and try that.
For e.g. if you make some basic errors in the Go file and you save the file, you will see the errors show up below as shown below:
image01
To further tweak what is happening under the hood by the go-plus plugin, you should go to Preferences/Settings, then Installed Packages, search for go-plus and click on Settings. This will show you easy to understand settings that it uses to do its work, for e.g. what tool to run on save, etc.
Now let us take a look at how to run the Go application from within the Atom Editor itself and via the terminal-plus plugin that we just installed.
First up, go to Preferences/Settings and then Installed Packages, search for terminal-plus and go to the Settings. Scroll down and you should see a setting for the Working Directory. Ensure that it is set to Project.
Now you can launch the Terminal at any time via the Ctrl + ` key combination. You can also toggle it with this combination.
image00
On launching the terminal, you should see it come up and you can validate if you are in the correct folder via the pwd command.
You can now use standard Go commands to run your application. For e.g. go run as shown below:
image07
Happy Go Programming with the Atom Editor.