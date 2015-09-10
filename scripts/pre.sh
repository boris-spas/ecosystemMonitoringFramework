#!/bin/bash
# ------------------------------------------------------------------
# [BoriS] pre.sh
#          To be run before the main script. 
#          Does build up
#          Does <pre> commands from the config.xml
# ------------------------------------------------------------------

function get_pharo_image() {
	echo_funtion_name $FUNCNAME
	
	curl get.pharo.org/30 | bash
	curl get.pharo.org/vm | bash

	if [[ ! -f pharo ]] ; then
		echo 'Pharo is not there, aborting.'
		exit
	fi

	echo_simple_line
}

function load_EMF() {
	echo_funtion_name $FUNCNAME

	pharo_exec "Gofer new url: 'http://smalltalkhub.com/mc/spasojev/EMF/main'; package: 'ConfigurationOfEMF'; load. (Smalltalk at: #ConfigurationOfEMF) loadDevelopment. Author fullName: 'me'. StartupPreferencesLoader allowStartupScript: false. SmalltalkImage current snapshot: true andQuit: true ."
	
	echo_simple_line
}

function get_config_file() {
	echo_funtion_name $FUNCNAME

	git clone $CONFIG_GIT_URL
	
	echo_simple_line
}

function run_pre_config() {
	echo_funtion_name $FUNCNAME

	ST=`xmllint --xpath "/config/target/pre/st/text()" $CONFIG `
	ST=$ST'.SmalltalkImage current snapshot: true andQuit: true.'
	pharo_exec "$ST"

	xmllint --xpath "/config/target/pre/sh/text()" $CONFIG > temp_script_for_config.sh
	sh temp_script_for_config.sh
	rm temp_script_for_config.sh

	echo_simple_line
}

function pre_script_main() {
	echo_funtion_name $FUNCNAME	

	get_pharo_image
	load_EMF
	get_config_file
	run_pre_config
	
	echo_simple_line
}

