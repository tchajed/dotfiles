function watch_coqc --argument wait
  if test -z "$wait"
    set wait 2
  end
  while true
    ps-coqc > /tmp/ps-coqc
    clear
    cat /tmp/ps-coqc
    if test ! -s /tmp/ps-coqc
      rm /tmp/ps-coqc
      break
    end
    sleep $wait
  end
end
