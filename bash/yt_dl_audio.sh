#!/bin/bash

# A function to download audio from a YouTube video to a specific directory.
# Usage: yt_dl_audio <YouTube_video_ID>
function yt_dl_audio() {
  # The directory where you want to save the downloaded audio files.
  # Change this to your desired location.
  DOWNLOAD_DIR="$HOME/~/Documents/Audio/FX/youtubez/yt-dlp-mp3"
  
  # Check if the download directory exists; if not, create it.
  mkdir -p "$DOWNLOAD_DIR"

  # Check if a video ID was provided.
  if [ -z "$1" ]; then
    echo "Error: No YouTube video ID provided."
    echo "Usage: yt_dl_audio <YouTube_video_ID>"
    return 1
  fi
  
  # Run the yt-dlp command.
  yt-dlp "$1" --extract-audio --audio-format mp3 --output "$DOWNLOAD_DIR/%(title)s.%(ext)s" --cookies-from-browser chrome
}

# The script will execute the function when called.
yt_dl_audio "$@"