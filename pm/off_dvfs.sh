#!/bin/sh

echo 8 > /proc/sys/kernel/printk
mount -t debugfs none /debug
echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1 > /debug/pm_debug/enable_off_mode
echo 1 > /debug/pm_debug/enable_oswr_mode
echo enabled > /sys/devices/platform/omap_uart.2/tty/ttyO2/power/wakeup


random()
{
	v=`dd if=/dev/urandom count=1 2> /dev/null | cksum | cut -d ' ' -f 1`
	v1=`expr $1 + 1`
	i=`expr $v % $v1`
#	i=`echo "$i"|sed -e "s/\s\s*//g"`
	if [ $i -eq 0 ]; then
	i=1
	fi
	echo "$i"
}

opp=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`
echo "$opp is the available freqs"                                          
while [ 1 ]                                                                 
do                                                               
	for i in $opp                    
	do                               
		echo -n "$i" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
		cur_freq=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
		echo "Current freq is $cur_freq..."                                 
		sec=`random 5`                                                      
		echo "wakeup timer set to $sec sec..."                                      
		echo $sec > /debug/pm_debug/wakeup_timer_seconds                            
		echo -n "mem" > /sys/power/state                                            
		echo "Device counter has incremented by"                                    
		cat /debug/pm_debug/count | grep core_pwrdm | grep OFF                                 
	done                                                                        
done

