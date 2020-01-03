RUNNING_NYANCAT=$(pgrep nyancat > /dev/null; echo $?)
if [ $RUNNING_NYANCAT -eq 1 ]; then
    exec termite -e "nyancat" --class nyancat &
fi
