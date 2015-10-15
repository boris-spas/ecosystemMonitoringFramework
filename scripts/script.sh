#!/bin/bash
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
	ST=`xmllint --xpath "/config/target/analysis/st/text()" $CONFIG `

	for ((i=0;i<=$N; i++))
	do	
		echo_date_box
		echo 'starting on project '$i
		echo ''
		pharo_exec "EMFUtils loadProjectWithIndex: $i.""$ST" \
		&& echo "EMF-PROJECT-$i-SUCCESS"
	done
}

function iterate_over_projects_parallel() {
	N=$1 #number of projects
	ST=`xmllint --xpath "/config/target/analysis/st/text()" $CONFIG `

	# clone simple parallel bash
	git clone https://github.com/boris-spas/simpleParallelBash.git

	#build the script that runs in parallel
	echo "echo \"@@starting on \$1\"" > simpleParallelBash/processOneProject.sh
	echo "timeout 5h ./pharo $IMAGE eval \"EMFUtils loadProjectWithIndex: \$1. $ST\" && echo @@BoriS-SUCCESS!" >> simpleParallelBash/processOneProject.sh
	echo "echo \"@@done with \$1\"" >> simpleParallelBash/processOneProject.sh

	#build the input file for simple parallel bash
	for (( i = 0; i <= $N; i++ )); do
		echo $i >> simpleParallelBash/input.txt
	done

	cd simpleParallelBash
	bash run.sh processOneProject.sh input.txt 24 ../pharo ../pharo-vm ../Pharo.image ../Pharo.changes
	cd ..
}

function script_main() {
	iterate_over_projects_parallel `count_the_projects`
}

