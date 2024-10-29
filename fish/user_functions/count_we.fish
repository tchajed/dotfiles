function count_we
grep -ci '\bwe\b' $argv
echo -n "total: "
cat $argv | grep -v '^\s*%' | grep -ci '\bwe\b' | dye --bold
end
