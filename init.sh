# Shell script to create symlinks for config files
# Note:  assumes this will be executed in same dir as config files
# 10-6-12 by Nick Davis

scriptdir=$PWD
for cfg in `ls -d .??*` 
do
	echo "current file: $cfg"
	# skip .git
	if [ $cfg == ".git" ]; then
		continue
	fi

	if [ ! -e ~/$cfg ]
	then
		ln -s $scriptdir/$cfg ~/$cfg
	else 
		echo "File ~/$cfg exists, so not symlinked"
	fi
done
