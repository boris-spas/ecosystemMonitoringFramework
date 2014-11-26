#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] pre_test.sh
#          Functions that test stuff from the pre.sh go here
# ------------------------------------------------------------------
source ../pre.sh
source ../variables.sh

function test_get_pharo_image() {
	get_pharo_image
}

function test_run_pre_config() {
	run_pre_config
}


test_run_pre_config

