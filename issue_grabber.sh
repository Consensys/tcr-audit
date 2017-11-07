#/bin/sh

# get the configs
source ./compiler.cfg
source ./githubUser.cfg

# check github token
if [ "$githubToken" = "" ]; then
	echo -e "\nNOTICE:\nNo token was found. Execution is ending because the actual fetching would fail.\n"
    return 1;
fi

# check user name
if [ "$githubUsername" = "" ]; then
	echo -n "No github username found in config file. Please input desired github username: "
	read REPLY
	githubUsername=$(echo "$REPLY" | cut -f1 -d /)
fi

# check repo name
if [ "$repoName" = "" ]; then
    echo -n "No repository name found in config file. Please input desired repo name: "
	read REPLY
    repoName=$(echo "$REPLY" | cut -f1 -d /)
fi

# list all issue
curl -H "Authorization: token $githubToken" "https://api.github.com/repos/$githubUsername/$repoName/issues" > issues.txt;

# get the issue number
# issueNumber=$(awk '/number/{print $2}')
# create an empty file named after the issue title
awk -f title.awk issues.txt

# get issue corpus
# awk '/title/{result = ""; for(i=2;i<=NF;++i) result = result " " $i; print result}'



# cleanup
# rm issues.txt
