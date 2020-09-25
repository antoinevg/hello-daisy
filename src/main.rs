#![no_main]
#![no_std]

extern crate panic_semihosting;

use cortex_m_rt::entry;
use cortex_m_semihosting::hprintln;

use stm32h7xx_hal::hal::digital::v2::OutputPin;
use stm32h7xx_hal::{pac, prelude::*};


#[entry]
fn main() -> ! {
    hprintln!("hello daisy!").unwrap();

    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = pac::Peripherals::take().unwrap();

    // constrain and freeze power
    let pwr = dp.PWR.constrain();
    let vos = pwr.freeze();

    // constrain and freeze clock
    let rcc = dp.RCC.constrain();
    let ccdr = rcc.sys_ck(100.mhz()).freeze(vos, &dp.SYSCFG);

    // configure pc7 (led_user) as output
    let gpioc = dp.GPIOC.split(ccdr.peripheral.GPIOC);
    let mut led_user = gpioc.pc7.into_push_pull_output();

    // get the delay provider
    let mut delay = cp.SYST.delay(ccdr.clocks);

    loop {
        hprintln!("entering main loop").unwrap();
        loop {
            led_user.set_high().unwrap();
            delay.delay_ms(100_u16);

            led_user.set_low().unwrap();
            delay.delay_ms(100_u16);
        }
    }
}
