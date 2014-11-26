#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] script.sh
#          The main script. 
# ------------------------------------------------------------------

function count_the_projects() {
	./pharo $IMAGE eval "browser := MetacelloConfigurationBrowser new.repo := browser configBrowserModel availableRepositories first.projectList := browser configBrowserModel configurationList listItems. projectList size."
}

function test_count_the_projects() {
	IMAGE=Pharo.image
	echo 'masdfasd'
	SIZE=`count_the_projects`
	if [[ $SIZE -lt 100 ]]; then
		echo 'Too few projects'
	fi
}

function iterate_over_projects() {
	N=$1 #number of projects
	for ((i=1;i<=$N; i++))
	do
		echo $i
	done
}

function script_main() {
	iterate_over_projects `count_the_projects`
}

