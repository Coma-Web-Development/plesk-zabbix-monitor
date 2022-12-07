#!/bin/bash

source vars.conf
source library.sh

main()
{
	askToUpdate
    testRequirements
    copyFiles
	exit 0
}

main

# unknown error
exit 255	
