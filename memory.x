/**
 * See: https://github.com/electro-smith/libDaisy/blob/master/core/STM32H750IB_flash.lds
 *      https://github.com/stm32-rs/stm32h7xx-hal/blob/master/memory.x
 */

MEMORY
{
  FLASH     (RX)  : ORIGIN = 0x08000000, LENGTH = 128K

  /* DTCM (DTCMRAM) */
  RAM       (RWX) : ORIGIN = 0x20000000, LENGTH = 128K

  /* AXISRAM (SRAM) */
  AXISRAM   (RW)  : ORIGIN = 0x24000000, LENGTH = 512K

  /* SRAM (RAM_D2, RAM_D3) */
  SRAM3     (RWX) : ORIGIN = 0x30000000, LENGTH = 288K
  SRAM4     (RWX) : ORIGIN = 0x38000000, LENGTH = 64K

  /* Instruction TCM (ITCMRAM) */
  ITCM      (RWX) : ORIGIN = 0x00000000, LENGTH = 64K

  SDRAM     (RWX) : ORIGIN = 0xc0000000, LENGTH = 64M

  QSPIFLASH (RX)  : ORIGIN = 0x90000000, LENGTH = 8M
}

/* The location of the stack can be overridden using the
   `_stack_start` symbol.  Place the stack at the end of RAM */
_stack_start = ORIGIN(RAM) + LENGTH(RAM);

/* The location of the .text section can be overridden using the
   `_stext` symbol.  By default it will place after .vector_table */
/* _stext = ORIGIN(FLASH) + 0x40c; */

SECTIONS {
  .axisram : ALIGN(8) {
    *(.axisram .axisram.*);
    . = ALIGN(8);
    } > AXISRAM
  .sram3 (NOLOAD) : ALIGN(4) {
    *(.sram3 .sram3.*);
    . = ALIGN(4);
    } > SRAM3
  .sram4 (NOLOAD) : ALIGN(4) {
    *(.sram4 .sram4.*);
    . = ALIGN(4);
    } > SRAM4
} INSERT AFTER .bss;
