#!/bin/zsh
VENV_PATH=/home/r0dix/.virtualenvs

cmd="ls -d $VENV_PATH | cut -d "/" -f 5"
I=0
ARRAY=0

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "-x            This option type with xdotool the command active_venv for you"
    echo "-h, --help    This option show this help"
    exit 0
fi

for VENV in $(ls -d $VENV_PATH/*/ | cut -d "/" -f 5)
do
    I=$(($I + 1 ))
    VENV_OP[$I]="$VENV"
    echo "OPCION $I : "$VENV
done
echo "Select a Virtualenv [NUMBER]"
read option

if [ $option -ne 0 ]; then
    VENV_PATH_ACT="$VENV_PATH/${VENV_OP[$option]}"
    echo "The option $option is activated: $VENV_PATH_ACT"
    echo $VENV_PATH_ACT > ~/.VENV_PATH_ACT
    echo "Active VirtualEnv with the command: <active_venv>"
fi
if [ "$1" = "-x" ]; then
    xdotool type "active_venv"
fi
exit 0
