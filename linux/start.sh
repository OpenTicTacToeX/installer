#!/bin/sh


if [ $EUID = 0 ]
then
	echo "you cannot run this as root"
	exit
fi
mkdir $HOME/.local/
mkdir $HOME/.local/share/
mkdir $HOME/.local/share/games
cd $HOME/.local/share/games

if [ -d "opentictactoex" ]
then
	echo removing opentictactoex
	rm -R opentictactoex/
fi
mkdir $HOME/.local/share/games/opentictactoex
cd opentictactoex
