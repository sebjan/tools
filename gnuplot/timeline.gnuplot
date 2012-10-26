clear
reset

#set terminal pngcairo  transparent enhanced font "arial,10" size 800, 600
#set output 'capture.png'

set ylabel 'Watts' tc lt 1 
set yrange [ 0 : ] noreverse nowriteback 
set lmargin  9
set rmargin  2

set autoscale xfixmin 

set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000

#set termoption dash
set timefmt "%s"
set style fill transparent solid 1.0  noborder
set style line 3 lt 3 lc rgb "#0000ff" lw 0.5 pt 0.5 pi 4


#unset key
#set key outside right top vertical Left reverse noenhanced autotitles columnhead nobox
#set key invert samplen 4 spacing 1 width 0 height 0 font ",8"

load './color.gnuplot'

set title "`echo $GP_TITLE`"

name="`echo $GP_DATA_FILE`"
if (strlen(name) == 0) print "Please set GP_DATA_FILE environment variable with the filename to process!"; exit

plot    name using 1:9 ti columnheader with filledcurves x1 ls 8, \
	name using 1:($2+$3+$4+$5+$6+$7+$8) ti columnheader with filledcurves x1 ls 7, \
	name using 1:($2+$3+$4+$5+$6+$7) ti columnheader with filledcurves x1 ls 6, \
        name using 1:($2+$3+$4+$5+$6) ti columnheader with filledcurves x1 ls 5, \
        name using 1:($2+$3+$4+$5) ti columnheader with  filledcurves x1 ls 4, \
        name using 1:($2+$3+$4) ti columnheader with  filledcurves x1 ls 3, \
        name using 1:($2+$3) ti columnheader with filledcurves x1 ls 2, \
        name using 1:2 ti columnheader with filledcurves x1 ls 1

