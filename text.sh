#/bin/bash

base64 /dev/urandom | head -c 10000000 > /$(pwd)/random.txt


