#!/bin/sh

sudo umount ~/<WHERE_2>

sshfs <USER>@<HOST>:<WHERE> ~/<WHERE_2>

