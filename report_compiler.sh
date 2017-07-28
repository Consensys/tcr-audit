#/bin/sh

# some temp settings to allow whitespaces in title files being looped over
IFS=$'\n'; set -f

source ./compiler.cfg

rootDir=$(pwd)
recursiveLevel=1

echo "Config successfully read."
echo

if [ -z "$auditName" ]; then
    echo "Audit name is unset or set to the empty string."
    echo "Please fill out compiler.cfg"
    echo
    echo "Ending..."
fi

echo "Running through the content reports..."



recursiverm() {
	# increase title deepness
	recursiveLevel=$(expr $recursiveLevel + 1)

	for d in $(find . -not -path '*/\.*' -exec basename {} \; -maxdepth 1 -mindepth 1); do
		# visual cue for the section being processed
		printf "%0.s# " $(seq 1 $recursiveLevel)
		echo "$d"

		if [ -d "$d" ]; then
			# print the '#' char <recursiveLevel> amount of times for correct title deepness
			printf "%0.s#" $(seq 1 $recursiveLevel) >> "$rootDir"/"$auditName"_report.md

			#print the actual title
			echo " $d" >> "$rootDir"/"$auditName"_report.md;
			echo -e "\n" >> "$rootDir"/"$auditName"_report.md;

			(cd -- "$d" && recursiverm)
		else
			# check the filename without extension
			if [ "${d%.*}" != "0 - no_title" ]; then
				# print the '#' char <recursiveLevel> amount of times for correct title deepness
				printf "%0.s#" $(seq 1 $recursiveLevel) >> "$rootDir"/"$auditName"_report.md

				#print the actual title
				echo " ${d%.*}" >> "$rootDir"/"$auditName"_report.md
				echo -e "\n" >> "$rootDir"/"$auditName"_report.md
			elif [ "${d%.*}" != "0 - Audit Intro" ]; then
				echo "# $auditName Audit Report by ConsenSys Diligence" >> "$rootDir"/"$auditName"_report.md
				echo -e "\n" >> "$rootDir"/"$auditName"_report.md
			fi

			# concatenate the actual file
			cat $d >> "$rootDir"/"$auditName"_report.md
			echo -e "\n" >> "$rootDir"/"$auditName"_report.md
		fi
	done
	recursiveLevel=$(expr $recursiveLevel - 1)
}

# strange commands befora and after set a new delimiter char
# so that we can loop over files with whitespaces in their names
(IFS=$'\n'; set -f; cd "$contentsFolder"; recursiverm; cd ..; unset IFS; set +f) #./make-toc.sh -s 1 -d 2; unset IFS; set +f)