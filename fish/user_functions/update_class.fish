function update_class
  pushd $HOME/code/cs839-fa24/sys-verif-solutions
  ./etc/update-web.sh ../sys-verif-fa24
  ./etc/template repo ../sys-verif-fa24-proofs
  ./etc/update-goose.sh
  make -k $(ls src/Goose/sys_verif_code/*.v | sed 's/\.v$/.vo/') 1>/dev/null
  popd
end
