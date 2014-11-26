#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] script_test.sh
#          Functions that test stuff from script.sh goes here
# ------------------------------------------------------------------
source ../script.sh
source ../variables.sh

function test_count_the_projects() {
	echo 'masdfasd'
	SIZE=`count_the_projects`
	echo $SIZE
	if [[ $SIZE -lt 100 ]]; then
		echo 'Too few projects'
	fi
}

test_count_the_projects

