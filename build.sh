root=~/EECS583Shared/llvm-14.0.6.src/
cd ${root}
cd build
make -j4 check-llvm-transforms-slpvectorizer check-llvm-transforms-slpvectorizer-x86