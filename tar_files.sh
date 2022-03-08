#!/bin/bash

mkdir ~/tar_dir
mkdir ~/tar_dir/dir1
mkdir ~/tar_dir/dir2


for i in 1 2 3 4 5
do
   dd if=/dev/zero bs=10M count=5 of=~/tar_dir/file-${i}.bin
done	


for a in 1 2 3 4 5
do
   dd if=/dev/zero bs=1M count=10 of=~/tar_dir/dir1/file-${a}.bin
done


for b in 1 2 3 4 5
do
   dd if=/dev/zero bs=1M count=10 of=~/tar_dir/dir2/file-${b}.bin
done
