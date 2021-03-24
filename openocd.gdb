target extended-remote :3333

set print asm-demangle on
set backtrace limit 8

# Disable this for ITM support
monitor arm semihosting enable

# Enable this for ITM support
#monitor tpiu config internal /tmp/itm.fifo uart off 480000000 2000000
#monitor itm port 0 on

break DefaultHandler
break HardFault
break rust_begin_unwind

info mem
load
#stepi
continue
