if [ $1 -eq 0 ] ; then
    # Package removal, not upgrade
    systemctl --no-reload disable --now consul.service > /dev/null 2>&1 || :
fi
