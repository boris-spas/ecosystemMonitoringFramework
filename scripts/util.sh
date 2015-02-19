#!/bin/bash
# ------------------------------------------------------------------
# [BoriS] util.sh
#          Helper functions go here
# ------------------------------------------------------------------

function echo_date_box() {
	echo '#######################################################################'
	echo "#              " `date`                "                         #"
	echo '#######################################################################'
}

function echo_simple_line() {
	echo '-----------------------------------------------------------------------'
}

function echo_funtion_name() {
	echo ''
	echo_simple_line
	echo $1
	echo_simple_line
}

function pharo_exec() {
	timeout 5h ./pharo $IMAGE eval $1
}
