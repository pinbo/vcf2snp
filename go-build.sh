#!/usr/bin/env bash

package=$1
if [ -z "$package" ]; then
  echo "usage: $0 <package-name>"
  exit 1
fi

package_name=${package/.go/}

platforms=("windows/amd64" "linux/amd64" "darwin/amd64")
gocmd='go'
if [ `which go.exe` ]; then
    gocmd='go.exe'
fi
echo go cmd $gocmd

for platform in "${platforms[@]}"
do
    platform_split=(${platform/\// })
    GOOS=${platform_split[0]}
    GOARCH=${platform_split[1]}
    output_name=$package_name'-'$GOOS'-'$GOARCH
    echo $GOOS
    echo $GOARCH
    echo $output_name
    
    if [ $GOOS = "windows" ]; then
        output_name+='.exe'
    fi
    echo "Building for $platform"

    env GOOS=$GOOS GOARCH=$GOARCH $gocmd build -o $output_name $package
    if [ $? -ne 0 ]; then
        echo 'An error has occurred! Aborting the script execution...'
        exit 1
    fi
done