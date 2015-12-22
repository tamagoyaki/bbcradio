#!/bin/bash
#

declare -A chs
chs["radio 1"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_one.m3u8"
chs["radio 2"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_two.m3u8"
chs["radio 3"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_three.m3u8"
chs["radio 4"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_fourfm.m3u8"
chs["radio 4 extr"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_four_extra.m3u8"
chs["radio 5"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_five_live.m3u8"
chs["radio 5 extr"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_radio_five_live_sports_extra.m3u8"
chs["radio 6 music"]="http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/low/ak/bbc_6music.m3u8"

sortedstations=`for a in "${!chs[@]}"; do echo "$a"; done | sort`

IFS=$'\n'
select ch in "quit" $sortedstations; do
    if [ -z "$ch" ]; then
	continue
    fi
    
    if [ "$ch" = "quit" ]; then
	exit
    fi
	
    url=`echo ${chs[$ch]} | awk '{print $1}'`
    #echo $url
    ffplay -nodisp $url
done
