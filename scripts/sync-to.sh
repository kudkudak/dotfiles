#!/bin/sh

# You can use -n for dry run
rsync -L -arvv --no-perms --no-owner --no-group  -u --exclude-from='exclude.rsync' ./* $1
rsync -L -arvv   --existing --ignore-non-existing --no-perms --no-owner --no-group  -u --delete --exclude-from='exclude_delete.rsync' ./* $1
