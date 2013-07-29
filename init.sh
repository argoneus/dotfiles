# Shell script to create symlinks for config files
# Note:  assumes this will be executed in same dir as config files
# 10-6-12 by Nick Davis

scriptdir=$PWD
for cfg in `ls -d .??*` 
do
	echo "current file: $cfg"
	# skip .git
	if [ $cfg == ".git" ]; then
		echo "Skipping .git"
		continue
	fi

	# link .bashrc as .bash_aliases if _aliases doesn't already exist
	if [ $cfg == ".bashrc" -a -e ~/$cfg ]; then
		if [ ! -e ~/.bash_aliases ]; then
			ln -s $scriptdir/$cfg ~/.bash_aliases
			echo "Linking $scriptdir/$cfg as ~/.bash_aliases"
			continue
		fi
	fi

	if [ ! -e ~/$cfg ]; then
		ln -s $scriptdir/$cfg ~/$cfg
		echo "Linking $scriptdir/$cfg as ~/$cfg"
	else 
		echo "File ~/$cfg exists, so not symlinked"
	fi
done
