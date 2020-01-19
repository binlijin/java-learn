#! /usr/bin/env bash                                                                                                                                                                                            

LIST=tags

for tag in `cat "$LIST"`; do
  #git tag -d $tag
  git push --delete origin $tag
done

