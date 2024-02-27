#!/bin/bash
set -e

USER_NAME="unexpectedness"
PROJECT_NAME="lexikon"
DOC_DIR="target/doc"

cleanup() {
  popd > /dev/null 2>&1 || true
}

generate_docs() {
  rm -rf "$DOC_DIR" && mkdir "$DOC_DIR"
  git clone "git@github.com:$USER_NAME/$PROJECT_NAME.git" "$DOC_DIR"
  pushd "$DOC_DIR"
  trap cleanup EXIT
  git symbolic-ref HEAD refs/heads/gh-pages
  rm .git/index
  git clean -fdx
  git remote set-url origin https://github.com/$USER_NAME/$PROJECT_NAME.git
}

publish_docs() {
  pushd "$DOC_DIR"
  trap cleanup EXIT
  #git checkout gh-pages
  git add .
  git commit -am "new documentation push."
  git push -f -u origin gh-pages
}

if [ "$1" == "--generate" ]; then
  generate_docs
  lein codox
elif [ "$1" == "--publish" ]; then
  publish_docs
else
  echo "Invalid argument. Use --generate or --publish."
  exit 1
fi