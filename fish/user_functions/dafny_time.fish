function dafny_time
set -l file $argv[1]
dafny /timeLimit:10 /compile:0 /arith:5 /noNLarith /trace $file $argv[2..-1] > .timing.prof
cat .timing.prof | ./etc/summarize-timing
end
