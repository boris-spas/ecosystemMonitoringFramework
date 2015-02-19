#!/bin/bash
# ------------------------------------------------------------------
# [BoriS] main
#          The main script of EMF
# ------------------------------------------------------------------

source variables.sh
source util.sh
source pre.sh
source script.sh
source post.sh

pre_script_main
script_main
post_script_main

