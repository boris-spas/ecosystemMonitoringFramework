#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] pre.sh
#          To be run before the main script. 
#          Does tear down
#          Does <pre> commands from the config.xml
# ------------------------------------------------------------------

function echoDateBox() {
        echo '#######################################################################'
	echo "#              " `date`                "                         #"
	echo '#######################################################################'
}

function get_pharo_image() {
	echo "Obtaining Pharo"
	curl get.pharo.org | bash

	if [[ ! -f pharo ]] ; then
		echo 'Pharo is not there, aborting.'
		exit
	fi
}

function get_config_file() {
	echo 'TODO!'
}

function run_pre_config() {
	echo 'TODO!'
}


