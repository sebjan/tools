# gnuplot basic setup script
# call this script by doing:


#set terminal wxt enhanced font "arial,8" size 1024,768
set terminal pngcairo notransparent enhanced font "arial,10" size 1600, 1024


set yrange [ 0 : ] noreverse nowriteback 
set lmargin  9 
set rmargin  2 


#set ylabel 'Watts' tc lt 1 


set autoscale xfixmin 


set termoption dash 
set timefmt "%s" 
set style fill transparent solid 1.0  noborder 
set style line 3 lt 3 lc rgb "#0000ff" lw 0.5 pt 0.5 pi 4 

set xrange [0:2]


