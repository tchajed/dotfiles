function update_class
    pushd $HOME/code/cs839-fa25/sys-verif-solutions
    echo "updating web"
    ./etc/template web ../sys-verif-fa25
    echo "updating repo"
    ./etc/template repo ../sys-verif-fa25-proofs
    echo "updating goose"
    ./etc/update-goose.sh
    make -j8 -k $(ls src/code/sys_verif_code/**.v | sed 's/\.v$/.vo/') 1>/dev/null
    make -j8 -k $(ls src/generatedproof/sys_verif_code/**.v | sed 's/\.v$/.vo/') 1>/dev/null
    popd
end
