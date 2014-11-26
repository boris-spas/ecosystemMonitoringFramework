#!/bin/sh
# ------------------------------------------------------------------
# [BoriS] post.sh
#          Should be run after the main script is done. 
#          Shoudld to clean up an execute the 'post' part in the config.xml
# ------------------------------------------------------------------

function run_post_config() {
	echo_funtion_name $FUNCNAME

	ST=`xmllint --xpath "/config/target/post/st/text()" $CONFIG `
	ST=$ST'.SmalltalkImage current snapshot: true andQuit: true.'
	pharo_exec "$ST"

	xmllint --xpath "/config/target/post/sh/text()" $CONFIG > temp_script_for_config.sh
	sh temp_script_for_config.sh
	rm temp_script_for_config.sh
	
	echo_simple_line
}

function post_script_main() {
	echo_funtion_name $FUNCNAME	

	run_post_config
	
	echo_simple_line
}