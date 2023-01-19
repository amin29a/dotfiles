

INSTALLATION
============

download from below link
https://git-scm.com/







HELP
====

open manual for a subject
```
git help 'subject'
#for example
git help blame
```

------------------------------------------------------------------------------------------

initialize git on current directory
```
git init
git status
git add directory/file_name
git add .
git add -A

git reset directory/file_name
git reset .
git reset . --hard

git commit -m "commit_message"

git log
git log -S search_phrase(regex)
git log -S search_phrase(regex) --oneline
```



------------------------------------------------------------------------------------------

TAGS
====

see list of tags
```
git tag
```
To show a tag information
```
git show tag_name
```
tag last commit
```
git tag -a tag_name -m 'tag_message'
```
tag specified commit
```
git tag -a tag_name commit_id -m 'tag_message'
```
filter tags by tag_name
```
git tag -l "regex"
```
push tags to remote repository
```
git push origin --tags
```
checkout tags
```
git checkout tag_name
```

------------------------------------------------------------------------------------------

BLAME
=====

show who made changes in specific file
```
git blame file_name 
```
in 1 line
```
git blame file_name -L#
```
in line range (from # to #)
```
git blame file_name -L#,#
```

------------------------------------------------------------------------------------------

BISECT
======
Move between commits with binary search to find specific change or bug

to start process
```
git bisect start
```
specify the state for current build of project
(bad means we still have that specific bug)
(we specify that current commit we have problem)
```
git bisect bad
```
We are also specifying a commit that does not have specified bug or change.
```
git bisect good commit_id 
```
by specifiying good and bad commit we can find the exact commit when bug introduced
```
git bisect bad
git bisect good
git bisect good
git bisect bad
git bisect good
#...
```
------------------------------------------------------------------------------------------

