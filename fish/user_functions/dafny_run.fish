function dafny_run
dafny /timeLimit:20 /compile:0 /compileTarget:go /arith:5 /noNLarith $argv
end
