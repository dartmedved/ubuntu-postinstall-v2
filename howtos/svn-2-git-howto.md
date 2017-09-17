https://git-scm.com/docs/git-svn

http://stackoverflow.com/questions/79165/how-to-migrate-svn-repository-with-history-to-a-new-git-repository

1302
down vote
Create a users file (i.e. users.txt) for mapping SVN users to Git:

user1 = First Last Name <email@address.com>
user2 = First Last Name <email@address.com>
...
You can use this one-liner to build a template from your existing SVN repository:

svn log --xml | grep author | sort -u | perl -pe 's/.*>(.*?)<.*/$1 = /' | tee users.txt
SVN will stop if it finds a missing SVN user not in the file. But after that you can update the file and pick-up where you left off.

Now pull the SVN data from the repository:

git svn clone --stdlayout --no-metadata --authors-file=users.txt svn://hostname/path dest_dir-tmp
This command will create a new Git repository in dest_dir-tmp and start pulling the SVN repository. Note that the "--stdlayout" flag implies you have the common "trunk/, branches/, tags/" SVN layout. If your layout differs, become familiar with --tags, --branches, --trunk options (in general git svn help).

All common protocols are allowed: svn://, http://, https://. The URL should target the base repository, something like http://svn.mycompany.com/myrepo/repository. That must not include /trunk, /tag or /branches.

Note that after executing this command it very often looks like the operation is "hanging/freezed", and it's quite normal that it can be stuck for a long time after initializing the new repository. Eventually you will then see log messages which indicates that it's migrating.

Also note that if you omit the --no-metadata flag, Git will append information about the corresponding SVN revision to the commit message (i.e. git-svn-id: svn://svn.mycompany.com/myrepo/<branchname/trunk>@<RevisionNumber> <Repository UUID>)

If a user name is not found, update your users.txt file then:

cd dest_dir-tmp
git svn fetch
You might have to repeat that last command several times, if you have a large project, until all of the Subversion commits have been fetched:

git svn fetch
When completed, Git will checkout the SVN trunk into a new branch. Any other branches are setup as remotes. You can view the other SVN branches with:

git branch -r
If you want to keep other remote branches in your repository, you want to create a local branch for each one manually. (Skip trunk/master.) If you don't do this, the branches won't get cloned in the final step.

git checkout -b local_branch remote_branch
# It's OK if local_branch and remote_branch are the same name
Tags are imported as branches. You have to create a local branch, make a tag and delete the branch to have them as tags in Git. To do it with tag "v1":

git checkout -b tag_v1 remotes/tags/v1
git checkout master
git tag v1 tag_v1
git branch -D tag_v1
Clone your GIT-SVN repository into a clean Git repository:

git clone dest_dir-tmp dest_dir
rm -rf dest_dir-tmp
cd dest_dir
The local branches that you created earlier from remote branches will only have been copied as remote branches into the new cloned repository. (Skip trunk/master.) For each branch you want to keep:

git checkout -b local_branch origin/remote_branch
Finally, remove the remote from your clean Git repository that points to the now deleted temporary repository:

git remote rm origin




http://flavio.castelli.name/2007/09/04/howto_use_git_with_svn/

install git and git-svn
create the working dir: mkdir strigi
init your git working dir: cd strigi && git-svn init https://svn.kde.org/home/kde/trunk/kdesupport/strigi git-svn init command is followed by the address of the svn repository (in this case we point to strigi’s repository)
Find a commit regarding the project (you can get it from cia version control). Warning: the command git-log will show project’s history starting from this revision.
Perform the command git-svn fetch -rREVISION Where REVISION is the number obtained before.
Update your working dir: git-svn rebase Now you’ll be able to work on your project using git as revision control system.
To keep update your working copy just perform:

git-svn rebase

You can commit your changes to the svn server using the command:

git-svn dcommit


git svn clone http://yourcompany.com/path/to/svn/project-abc project-abc



up vote
170
down vote
Cleanly Migrate Your Subversion Repository To a Git Repository. First you have to create a file that maps your Subversion commit author names to Git commiters, say ~/authors.txt:

jmaddox = Jon Maddox <jon@gmail.com>
bigpappa = Brian Biggs <bigpappa@gmail.com>
Then you can download the Subversion data into a Git repository:

mkdir repo && cd repo
git svn init http://subversion/repo --no-metadata
git config svn.authorsfile ~/authors.txt
git svn fetch


