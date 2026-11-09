#!/bin/bash
# usage: profile.sh CHANNEL_ID tab(videos|shorts) N
id=$1; tab=$2; n=${3:-15}
subs=$(yt-dlp --flat-playlist --playlist-items 1 --print "%(channel_follower_count)s|%(channel)s" "https://www.youtube.com/channel/$id/$tab" 2>/dev/null | head -1)
yt-dlp --flat-playlist --playlist-items 1-$n --print "%(view_count)s" "https://www.youtube.com/channel/$id/$tab" 2>/dev/null | sort -n > /tmp/v.$$
cnt=$(wc -l < /tmp/v.$$); med=$(awk '{a[NR]=$1} END{print a[int((NR+1)/2)]}' /tmp/v.$$); max=$(tail -1 /tmp/v.$$)
echo "$subs | $tab last$cnt median=$med max=$max"; rm /tmp/v.$$
