#/bin/bash
echo "Ju lutem fusni madhesine e file qe deshironi"
read file_s

sizable () {
touch ~/sizable_file
dd if=/dev/zero of=~/sizable_file bs=1M count=$file_s
}

sizable

