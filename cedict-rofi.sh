#!/bin/bash
cedict="cedict_1_0_ts_utf-8_mdbg.txt"
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -x|--xclip)
    xclip=true
    shift # past argument
    shift # past value
    ;;
    -c|--cedict)
    cedict=$2
    shift # past argument
    shift # past value
    ;;
    -h|--help|-*)
    help=true
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
if [ "$help" = true ]; then
    echo "Usage: cedict-rofi.sh [OPTION] {INPUT}"
    echo "-x,  --xclip          Take input from clipboard (requires xclip)"
    echo "-c,  --cedit [path]   Path to cedict database (defaults to cedict_1_0_ts_utf-8_mdbg.txt)"
    echo "-h,  --help           Print this help message"
    exit 0
fi
if [ "$xclip" = true ]; then
    input=`xclip -o`
elif [[ -n $1 ]]; then
    input="$1"
fi
echo $(grep "^[^#;]" $cedict | rofi -dmenu -p "Search CEDICT" -i -z -filter $input)
