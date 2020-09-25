# hello-daisy

Rust starter project for the @electro-smith [Daisy Seed](https://www.electro-smith.com/daisy/daisy).


## Dependencies

### Install arm target for Daisy

    rustup target add thumbv7em-none-eabihf

### Install gdb

    # install via macports (TODO homebrew, linux, windows)
    sudo port install arm-none-eabi-gdb

### Install openocd

Install from source or get it from: https://xpack.github.io/openocd/install/


## Generate project

    cargo install cargo-generate

    cargo generate \
        --git https://github.com/antoinevg/hello-daisy \
        --branch main \
        --name your-project-name

## Flash and run

1. Plug a [2x10 mini adapter](https://www.mouser.com/ProductDetail/Olimex-Ltd/ARM-JTAG-20-10?qs=%2Fha2pyFaduimZ3uNdhcul1TKdFseYHCwn8utVVzKdZk85XwbGkysHA%3D%3D) into the Daisy Seed with the red stripe facing up towards the white stripe.
1. Connect the other end to a [ST-Link](https://www.mouser.com/ProductDetail/STMicroelectronics/ST-LINK-V2?qs=sGAEpiMZZMu3sxpa5v1qrqPIYHPyeOmOUBuCAg6HF1c%3D) or similiar programmer.
1. Start openocd in one terminal:

        cd /path/to/{{project-name}}
        /path/to/openocd

1. Run program in another terminal:

        cd /path/to/{{project-name}}
        cargo build

        # some programmers may need you to hit the reset button on the Daisy Seed at this point

        cargo run
