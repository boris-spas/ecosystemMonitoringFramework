#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] script.sh
#          The main script. 
# ------------------------------------------------------------------

function count_the_projects() {
	$PHARO "browser := MetacelloConfigurationBrowser new.repo := browser configBrowserModel availableRepositories first.projectList := browser configBrowserModel configurationList listItems. projectList size."
}


function iterate_over_projects() {
	N=$1 #number of projects
	for ((i=1;i<=$N; i++))
	do
		echo $i
	done
}

function load_EMF() {
	$PHARO "Gofer new url: 'http://smalltalkhub.com/mc/spasojev/EMF/main'; package: 'ConfigurationOfEATIBackend'; load. (Smalltalk at: #ConfigurationOfEMF) loadDevelopment."
}

function script_main() {
	load_EMF
	iterate_over_projects `count_the_projects`
}

