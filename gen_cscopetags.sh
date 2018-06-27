#!/bin/sh
APPEND="$1"

cscope_dir=~/env/cscope
mkdir -p $cscope_dir
working_dir=`pwd`
cd /

find $working_dir/ -name '*.py' \
    -o -name '*.java' \
    -o -iname '*.[CH]' \
    -o -name '*.cpp' \
    -o -name '*.cc' \
    -o -name '*.c' \
    -o -name '*.hpp'  \
    -o -name '*.hh' \
    -o -name '*.h' \
    > $cscope_dir/cscope.files

cd $cscope_dir
cscope -b -q
cd $working_dir
export CSCOPE_DB=$cscope_dir/cscope.out
#export CSCOPE_DB
