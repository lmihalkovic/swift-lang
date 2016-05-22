#!/bin/bash

SWIFTC="/Users/laurent/Work/Projects/swift/build/Xcode-DebugAssert/swift-macosx-x86_64/Debug/bin/swiftc"
CMD=""

while [[ $# > 0 ]]
do
key="$1"

case $key in
	-std)
	SWIFTC="swiftc"
	;;
	-ast)
	CMD="-dump-ast -O "
	;;
	-silgen)
	CMD="-emit-silgen -O "
	;;
	-sil)
	CMD="-emit-sil -O "
	;;
	-silN)
	CMD="-emit-sil -Onone "
	;;
	*)
	INP="$1"
	;;
esac
shift # past argument or value
done

echo "Compiler: $SWIFTC"
echo "Source  : $INP"

$SWIFTC $CMD $INP

