#/bin/bash

# Check arguments otherwise show usage
if [ $# -ne 3 ]; then
  echo "Usage: $0 <camera_url> <output_folder> <chunk_duration>"
  exit 1
fi

camera_url=$1
output_folder=$2
chunk_duration=$3

# Create the output directory if it doesn't exist
mkdir -p "$output_folder"

output_pattern="$output_folder/%Y-%m-%d-%H-%M-%S.mkv"

# Catch CTRL-C and kill all child processes
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

echo "[RECORDER] Recording $camera_url to $output_folder with chunk duration $chunk_duration seconds"
# Run ffmpeg and restart it if it crashes
while true; do
    ffmpeg -hide_banner -loglevel error -i "$camera_url" -acodec copy -vcodec copy -f segment -segment_time "$chunk_duration" -reset_timestamps 1 -strftime 1 "$output_pattern"
    echo "[RECORDER] FFmpeg crashed, restarting..."
done