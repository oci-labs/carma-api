
echo "git branch -D apiBotTempBranch"
git branch -D apiBotTempBranch

echo "git checkout -b apiBotTempBranch"
git checkout -b apiBotTempBranch

echo "git branch -D $BRANCH"
git branch -D $BRANCH

echo "git checkout $BRANCH"
git checkout $BRANCH

echo "git branch -D apiBotTempBranch"
git branch -D apiBotTempBranch

if [ -d $BRANCH ]
  then
    echo "Directory exists, do nothing"
  else
    mkdir $BRANCH
fi

echo "node blueprint-docify/index.js $BRANCH"
node blueprint-docify/index.js $BRANCH

echo "git add $BRANCH"
git add $BRANCH

echo "git stash"
git stash

echo "git branch -D gh-pages"
git branch -D gh-pages

echo "git checkout gh-pages"
git checkout gh-pages

if [ -d $BRANCH ]
  then
    echo "rm -rf -- $BRANCH"
    rm -rf -- $BRANCH

    echo "add $BRANCH"
    git add $BRANCH -u
  else
    echo "No directory, delete nothing"
fi

echo "git stash apply"
git stash apply

echo "git add $BRANCH"
git add $BRANCH

# Capture any additional updates into the published site.
echo rm -rf -- schemas/ assets/ index.html
rm -rf -- schemas/ assets/ index.html

echo git checkout $BRANCH -- schemas assets index.html
git checkout $BRANCH -- schemas assets index.html

echo "git status"
git status

echo "git commit -m "Update API documentation [skip ci][no-ci]""
git commit -m "Update API documentation [skip ci][no-ci]"

echo "git push git@github.com:oci-labs/carma-api gh-pages"
git push git@github.com:oci-labs/carma-api gh-pages

