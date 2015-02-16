cd /tmp/emf/simpleParallelBash
echo totl: && tail -n 1 input.txt
cd standardOutput
echo done: && cat * | grep @@done  | wc -l 
echo succ: && cat * | grep @@BoriS | wc -l
echo fail: && grep @@done * | awk 'BEGIN { FS = ":" } ; { print $1 }' | xargs grep -L @@BoriS | wc -l
echo -----
grep @@done * | awk 'BEGIN { FS = ":" } ; { print $1 }' | xargs grep -L @@BoriS
