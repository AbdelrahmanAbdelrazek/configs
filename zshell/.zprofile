#echo "ZPROFILE"
zsh_ver=$(zsh --version | awk '{print $2}' | cut -f1-2 -d.)
new_zsh=1
new_system=1
if [[ $(echo "$zsh_ver < 5.3" | bc -l) -eq 1 ]]; then
    new_system=0
    new_zsh=0
fi
export NEW_SYSTEM=$new_system
if [[ $new_zsh -eq 0 ]]; then
    export SHELL='/wv/abdelrab/usr/bin/zsh'
#    exec "/wv/abdelrab/usr/bin/zsh"
fi
