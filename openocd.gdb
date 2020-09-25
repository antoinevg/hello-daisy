target extended-remote :3333

set print asm-demangle on
set backtrace limit 8

break DefaultHandler
break HardFault
break rust_begin_unwind

# TODO https://github.com/stm32-rs/stm32h7xx-hal/blob/master/examples/ITM.md
#monitor tpiu config internal /tmp/itm.fifo uart off 48000000
#monitor tpiu config external uart off 48000000 2000000
#monitor itm port 0 on

monitor arm semihosting enable

info mem
load
# stepi
continue