clear
reset

#set terminal pngcairo  transparent enhanced font "arial,10" size 500, 350 
#set output 'histograms.png'

set ylabel 'Watts' tc lt 1 

set auto x

set border 3 front linetype -1 linewidth 1.000

set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000

unset key
#set key outside right top vertical Left reverse noenhanced autotitles columnhead nobox
set key outside right top vertical Left reverse noenhanced autotitles columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 font ",8"

set style histogram rowstacked title  offset character 0, 0, 0
set datafile missing '-'
set style data histogram
set style fill solid 1.00 border lt -1
#set style line 3 lt 3 lc rgb "#0000ff" lw 0.5 pt 0.5 pi 4 

set xtics border in scale 1,0.5 nomirror rotate by -45  offset character 0, 0, 0 
#set xtics border in scale 0,0 nomirror rotate by 0 offset character 0, 0, 0
set xtics  norangelimit font ",8"
#set xtics   ()

set ytics border in scale 0,0 mirror norotate  offset character 0, 0, 0 
set ztics border in scale 0,0 nomirror norotate  offset character 0, 0, 0 
set cbtics border in scale 0,0 mirror norotate  offset character 0, 0, 0 
#set rtics axis in scale 0,0 nomirror norotate  offset character 0, 0, 0 

set boxwidth 0.6 relative

load './color.gnuplot'

plot	newhistogram "OS Idle", for [i=2:9] 'da1' u i:xticlabels(1) ls i-1, \
	newhistogram "Suspend", for [i=2:9] 'da2' u i:xticlabels(1) ls i-1, \
	newhistogram "OS Idle (text+screen)", for [i=2:9] 'da3' u i:xticlabels(1) ls i-1, \
	newhistogram "UI Idle and VP (openbox)", for [i=2:9] 'da4' u i:xticlabels(1) ls i-1, \
	newhistogram "UI Idle and VP (lightdm)", for [i=2:9] 'da5' u i:xticlabels(1) ls i-1 




