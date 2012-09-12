# gnuplot example script for generating 2 png files including 9 plots each
# using multiplot

set output 'plot1.png' 
set multiplot layout 3, 3

set title "libc bcopy unaligned "
plot	"4430-new-00" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-00" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "libc bcopy aligned "
plot	"4430-new-01" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-01" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory bzero bandwidth "
plot	"4430-new-02" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-02" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "unrolled bcopy unaligned "
plot	"4430-new-03" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-03" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "unrolled partial bcopy unaligned "
plot	"4430-new-04" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-04" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory read bandwidth "
plot	"4430-new-05" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-05" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory partial read bandwidth "
plot	"4430-new-06" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-06" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory write bandwidth "
plot	"4430-new-07" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-07" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory partial write bandwidth "
plot	"4430-new-08" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-08" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"

unset multiplot

set output 'plot2.png' 
set multiplot layout 3, 3

set title "Memory partial read/write bandwidth "
plot	"4430-new-09" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-09" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory load parallelism "
plot	"4430-new-11" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-11" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Memory load latency stride=16 "
plot	"4430-new-13" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-13" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=32 "
plot	"4430-new-14" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-14" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=64 "
plot	"4430-new-15" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-15" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=128 "
plot	"4430-new-16" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-16" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=256 "
plot	"4430-new-17" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-17" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=512 "
plot	"4430-new-18" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-18" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "stride=1024 "
plot	"4430-new-19" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-19" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"
set title "Random load latency stride=16 "
plot	"4430-new-21" u 1:2 w linespoints ti columnheader lc rgb "#a00000", \
	"4460-new-21" u 1:2 w linespoints ti columnheader lc rgb "#0000a0"

unset multiplot
