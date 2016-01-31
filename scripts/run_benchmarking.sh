
OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

touch $OUTPUT_FILE
for i in  1000 2500000 10000 100 5000 1000000 800 100000 430 5000000 4000; do
    for rep in `seq 1 10`; do
	for j in "-O" "-O2" "-O3"; do
		echo "Size: $i" >> $OUTPUT_FILE;
		echo "Compilation: $j" >> $OUTPUT_FILE;
		touch ./src/parallelQuicksort.c;
		make CFLAGS+=$j -C ./src/;
		./src/parallelQuicksort $i >> $OUTPUT_FILE;
	done;
    done ;
done
