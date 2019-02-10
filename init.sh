# Shell script to create symlinks for config files
# Note:  assumes this will be executed in same dir as config files
# 10-6-12 by Nick Davis

scriptdir=$PWD
codedir=~/code
scriptsdir=~/scripts
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

# install z.lua directory matching tool
if [ ! -e "$codedir" ]; then
	echo "Creating $codedir"
	mkdir $codedir 
fi
if [ ! -e "$scriptsdir" ]; then
	echo "Creating $scriptsdir"
	mkdir $scriptsdir
fi

# clone github repo
if [ ! -e "$codedir/z.lua" ]; then
	echo "Cloning repo"
	cd $codedir
	git clone https://github.com/skywind3000/z.lua
fi
# create symbolic link to ~/scripts
if [ ! -e "$scriptsdir/z.lua" ]; then
	echo "Symlinking z.lua"
	cd $scriptsdir
	ln -s $codedir/z.lua/z.lua .
fi

# add to .bashrc
if [ ! -e ~/.bashrc ]; then
	echo "Creating .bashrc"
	touch ~/.bashrc
fi

if ! grep -q "z.lua" ~/.bashrc; then
	echo "Appending z.lua to ~/.bashrc"
	str1='eval "$(lua '
	str2=$scriptsdir/z.lua
	str3=' --init bash enhance once)"'
	echo "$str1$str2$str3" >> ~/.bashrc
fi

