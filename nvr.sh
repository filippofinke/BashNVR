#!/bin/bash

# load config.sh
source config.sh    

# check if camera_urls is empty
if [ -z "$camera_urls" ]; then
    echo "[NVR] Please add camera_urls to config.ini"
    exit 1
fi

# check if output_base_dir is empty
if [ -z "$output_base_dir" ]; then
    echo "[NVR] Please add output_base_dir to config.ini"
    exit 1
fi

# check if chunk_duration is empty
if [ -z "$chunk_duration" ]; then
    echo "[NVR] Please add chunk_duration to config.ini"
    exit 1
fi

# Check if delete_after_days is empty otherwise set to 0
if [ -z "$delete_after_days" ]; then
    delete_after_days=0
fi

pids=()

# Loop through the camera URLs
for i in "${!camera_urls[@]}"; do
    camera_url=${camera_urls[$i]}

    # Generate the output directory and filename pattern
    output_dir="$output_base_dir/camera$((i+1))"

    echo "[NVR] Starting recorder for $camera_url to $output_dir"
    # Start the recorder
    ./recorder.sh "$camera_url" "$output_dir" "$chunk_duration" &
    pids+=($!)
 
done

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
    echo "[NVR] Trapped CTRL-C, killing processes..."
    for pid in "${pids[@]}"; do
        kill -9 $pid
    done
    exit
}

if [ "$delete_after_days" -gt 0 ]; then
    echo "[NVR] Files older than $delete_after_days days will be deleted"
    while true; do
        echo "[NVR] Checking for files to delete..."
        find "$output_base_dir" -type f -mtime +"$delete_after_days" -print -delete
        # wait 1 hour
        sleep 3600
    done
else
    echo "[NVR] Files will not be deleted"
    wait
fi