#!/bin/bash
echo "Launching Enonic xp container..."
echo "Setting filesystem permissions"


if [[ -d $XP_HOME ]]
	then
	for XP_DISTRO_DIR in $(ls -1 $XP_ROOT/home.org )
	do
		ABSOLUTE_XP_DISTRO_DIR=$XP_HOME/$XP_DISTRO_DIR
		if [[ ! -d $ABSOLUTE_XP_DISTRO_DIR ]]
			then
			echo "$ABSOLUTE_XP_DISTRO_DIR does not exist, copying files from distro ( $XP_ROOT/home.org/$XP_DISTRO_DIR )..."
			cp -r $XP_ROOT/home.org/$XP_DISTRO_DIR $ABSOLUTE_XP_DISTRO_DIR
		fi
	done

	if [[ -f $XP_HOME/setenv.sh ]]
		then
		echo "Found custom setenv.sh file in home folder, copying it into runtime..."
		rm $XP_ROOT/bin/setenv.sh
		cp $XP_HOME/setenv.sh $XP_ROOT/bin/setenv.sh
	fi

else
	echo "$XP_ROOT/home does not exist, copying files from distro"
	cp -r $XP_ROOT/home.org $XP_HOME
fi

echo "Starting Enonic xp..."
cd $XP_ROOT/bin ; ./server.sh $@
