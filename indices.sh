#!/bin/bash
action=
dir=
url=

usage()
{
    echo "usage: ./indices.sh --action <create/delete> --dir <mapping-file-dir> --url <elasticsearch-url>"
}

while [ "$1" != "" ]; do
    case $1 in
        -a | --action )         shift
                                action=$1
                                ;;
        -d | --dir )            shift
                                dir=$1
                                ;;
        -u | --url )            shift
                                url=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# validate action and role
if [ "$action" != "create" ] && [ "$action" != "delete" ]; then
    usage
    exit 1
fi

if [ "$dir" = "" ] || [ "$url" = "" ]; then
    usage
    exit 1
fi

echo 'action:' $action
echo 'dir:' $dir
echo 'host:' ${url%/}
echo 'is that correct?[ENTER]'
read

if [ "$action" = "create" ]; then
    for file in "$dir"/*
    do
        name="${file##*/}"
        index="${name%.*}"
        printf "$index\n"
        curl -X PUT -H "Content-Type: application/json" -d @"$file" "${url%/}/$index"
        printf "\n\n"
    done
fi

if [ "$action" = "delete" ]; then
    for file in "$dir"/*
    do
        name="${file##*/}"
        index="${name%.*}"
        printf "$index\n"
        curl -X DELETE "${url%/}/$index"
        printf "\n\n"
    done
fi