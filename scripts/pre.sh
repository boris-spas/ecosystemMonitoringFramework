#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] pre.sh
#          To be run before the main script. 
#          Does tear down
#          Does <pre> commands from the config.xml
# ------------------------------------------------------------------

function get_pharo_image() {
	echo_funtion_name $FUNCNAME
	
	curl get.pharo.org | bash

	if [[ ! -f pharo ]] ; then
		echo 'Pharo is not there, aborting.'
		exit
	fi

	echo_simple_line
}

function load_EMF() {
        $PHARO "Gofer new url: 'http://smalltalkhub.com/mc/spasojev/EMF/main'; package: 'ConfigurationOfEATIBackend'; load. (Smalltalk at: #ConfigurationOfEMF) loadDevelopment."
}

function get_config_file() {
	echo 'TODO!'
}

function run_pre_config() {
	echo 'TODO!'
}

function pre_script_main() {
	get_pharo_image
	load_EMF
	get_config_file
	run_pre_config
}
