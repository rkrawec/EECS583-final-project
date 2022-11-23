#PATH2LIB=~/HW2/build/HW2/LLVMHW2.so        # Specify your build directory in the project
# PATH2LIB=~/EECS583-final-project/build/SLPVectorizer/SLPVec.so
CLANG=~/EECS583Shared/bin/clang
OPT=~/EECS583Shared/bin/opt
PASS=-slp-vectorizer
DEBUG=${2}

# Delete outputs from previous run.
rm -f  ${1}_after_vectorizer after_vectorizer_output *.bc

# Convert source code to bitcode (IR)
${CLANG} -emit-llvm -c ${1}.c -o ${1}.bc
# Instrument profiler
${OPT} -enable-new-pm=0 -pgo-instr-gen -instrprof ${1}.bc -o ${1}.prof.bc
# Generate binary executable with profiler embedded
${CLANG} -fprofile-instr-generate ${1}.prof.bc -o ${1}.prof
# Collect profiling data
./${1}.prof ${INPUT}
# Translate raw profiling data into LLVM data format
llvm-profdata merge -output=pgo.profdata default.profraw

# Canonicalize natural loops
#opt -enable-new-pm=0 -o ${1}.ls.bc -vectorize-slp  < ${1}.bc > /dev/null            #This is the original pass
${OPT} -enable-new-pm=0 -o ${1}.ls.bc ${PASS} < ${1}.bc ${DEBUG} > /dev/null #This is our pass 

# Generate binary excutable before FPLICM: Unoptimzied code
${CLANG} ${1}.ls.bc -o ${1}_after_vectorizer

# Produce output from binary to check correctness
./${1}_after_vectorizer > after_vectorizer_output

llvm-dis ${1}.ls.bc -o ${1}.ll


# Cleanup
rm -f  ${1}_after_vectorizer after_vectorizer_output *.bc
