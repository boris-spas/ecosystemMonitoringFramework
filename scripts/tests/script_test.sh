#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] script_test.sh
#          Functions that test stuff from script.sh goes here
# ------------------------------------------------------------------
source ../script.sh

function test_count_the_projects() {
	IMAGE=Pharo.image
	echo 'masdfasd'
	SIZE=`count_the_projects`
	if [[ $SIZE -lt 100 ]]; then
		echo 'Too few projects'
	fi
}
