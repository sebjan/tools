#!/usr/bin/python
# split a lmbench output file into several files: 1 file per test
# with first lines containing the test decription
# also generates a gnuplot file to be used to plot these data
import sys
import re


if __name__ == "__main__":

	if len(sys.argv) > 2:
		name = sys.argv[1]
		seed = sys.argv[2]
	else:
		exit


	f = file(name, "r")
	#catRe = re.compile(r'^\"')
	catRe = re.compile(r'^$')
	headRe = re.compile(r'^\D')
	count = 0
	skip = True
	newf = False
	header = False
	gp = file("gp-script-" + seed, "w")

	for l in f.readlines():
		cat = catRe.search(l)
		if cat:
			skip = False
			newf = True
		if skip:
			continue
		if newf:
			newf = False
			name = seed + "-{0:02d}".format(count)
			wr = file(name, "w")
			print "Creating new file: " + name
			count += 1
			header = True
			title = ""
			continue
#		if header:
#			print "  " + l
#			header = False
		head = headRe.search(l)
		if head:
#			wr.write("# " + l.translate(None, '"'))
#			print "  " + l
			title += l.translate(None, '"\n') + " "
		else:
			if header:
				# detected end of header / beginning of data
				header = False
				wr.write("# " + title + "\n")
				wr.write("X " + seed + "\n")
				print "Title = " + title
				#write to gnuplot script
				gp.write('set title "' + title + '"\n')
				gp.write('plot "' + name + '" u 1:2 w linespoints ti columnheader lc rgb "#a00000"\n')
			wr.write(l)



