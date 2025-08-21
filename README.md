# audio_tools

## Overview
This is a repository of useful audio manipulation and management scripts. I use these to do things like bulk edits, cleanups before pushing files to a hardware sampler, processing of field recordings, harvesting of new material for sampling, etc. I keep all bash scripts in `~/bin` and include this in my path.  These should be executable from any location in the filesystem, and write to a specific location. 


## What's this for?
This is a repository of tools for audio management. 
 - Bash tools that I keep in my ~/bin folder and add to my $PATH variable. 
 - Python tools for more complex purposes. 

## Requirements
As of right now, you need two tools, both installable via brew:
 - [SoX](https://github.com/chirlu/sox), a commandline audio editor
 	- Install via: `brew install sox`
 - [yt-dlp](https://github.com/yt-dlp/yt-dlp), a commandline YT video downloader. 
 	- Install via: `brew install yt-dlp`