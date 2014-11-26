#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] pre.sh
#          To be run before the main script. 
#          Does tear down
#          Does <pre> commands from the config.xml
# ------------------------------------------------------------------

function get_pharo_image() {
	echo "Obtaining Pharo"
	curl get.pharo.org | bash

	if [[ ! -f pharo ]] ; then
		echo 'Pharo is not there, aborting.'
		exit
	fi
}

function test_get_pharo_image() {
	get_pharo_image
}

function get_config_file() {
	echo 'TODO!'
}

function run_pre_config() {
	echo 'TODO!'
}

function pre_script_main() {
	get_pharo_image
	get_config_file
	run_pre_config
}
