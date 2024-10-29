function update_class
  pushd $HOME/code/cs839-fa24/sys-verif-solutions
  ./etc/update-web.sh ../sys-verif-fa24
  ./etc/template repo ../sys-verif-fa24-proofs
  popd
end
