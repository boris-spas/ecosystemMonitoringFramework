#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] script.sh
#          The main script. 
# ------------------------------------------------------------------

#######################################################################
#        THIS FUNC MUST NOT LOG! it is called to calc a value         #
#######################################################################
function count_the_projects() {
	pharo_exec "|browser repo projectList| browser := MetacelloConfigurationBrowser new.repo := browser configBrowserModel availableRepositories first.projectList := browser configBrowserModel configurationList listItems. projectList size."
}


function iterate_over_projects() {
	N=$1 #number of projects
	for ((i=1;i<=$N; i++))
	do	
		echo_date_box
		pharo_exec "EMFUtils loadProjectWithIndex: $i. Transcript cr;cr;cr. EMFUtils projectClasses size"
	done
}


function script_main() {
	iterate_over_projects `count_the_projects`
}

