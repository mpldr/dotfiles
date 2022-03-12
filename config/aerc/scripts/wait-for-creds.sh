#!/bin/sh

secret-tool lookup "$1" "$2"

while [ $? != 0 ]; do
	secret-tool lookup "$1" "$2"
done
