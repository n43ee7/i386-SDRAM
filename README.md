# i386DX SDRAM Interface IP/Design

## Introduction
This project aims to bridge the classic Intel 80386 DX (i386 DX) microprocessor with Synchronous Dynamic Random-Access Memory (SDRAM), a technology that didn't originally coincide with the i386 era. This Repository contains a design report on a specialized SDRAM controller to properly interface with the legacy x86 architecture.

## Project Overview
In 1986, Intel revolutionized computing with the release of the Intel 80386 DX, a microprocessor that reached impressive clock speeds of up to 25 MHz. Despite its rapid innovation, the i386 DX didn't anticipate the advent of SDRAM technology in 1997. This project aims to bridge this gap, revitalizing the i386's capabilities by integrating it with SDRAM through a meticulously designed SDRAM controller.

## Key Features

- Seamless integration of SDRAM with the classic i386 DX microprocessor architecture.
- Utilization of Partitioned i386 Address bus and control bus pins to enable Memory operations
- SDRAM Controller design can initiate Read/Write operations and memory management (i.e. refresh and initialization)
- Timing Diagrams of retro x86 architecture can be harmonized with contemporary memory technologies.

## SDRAM Controller Design
### Top-level of the controller 
![TopBlockDiagram8-2-23](https://github.com/n43ee7/i386-SDRAM/assets/47240597/26ee0614-64c4-4205-b477-8835c5ea5102)

The top design shows the Address bus, Data bus, and control signals interface with the SDRAM controller from where the SDRAM memory device is connected to the SDRAM controller's Data bus and control signals (including CLK and Command) connected to the memory device. 
![TopDesign8-2-23](https://github.com/n43ee7/i386-SDRAM/assets/47240597/0eded092-2da0-420b-a503-fc0173024931)


This top-level design is defined in Verilog including a memory decoder that generates the CS# (Chip select) and so is READ and WRITE control signals using the CPU W/R#, M/IO# pins. As shown below.

![SDRAM_Control_Signals](https://github.com/n43ee7/i386-SDRAM/assets/47240597/8f4dfc9f-3b40-4162-9db8-ed0dd1ec585d)


### SDRAM Controller Operation:

Top-level State Machine: \
![TOP_FSM_ADVANCED_SD](https://github.com/n43ee7/i386-SDRAM/assets/47240597/30f91b6b-c34c-4c5d-b543-b2d89fd9e3de)

Initialization State diagram: \
![Initialzation_FSM](https://github.com/n43ee7/i386-SDRAM/assets/47240597/ae491f38-5df1-41cd-9e24-db44daf4360c)

Refresh State Diagram: \
![REFRESH_FSM](https://github.com/n43ee7/i386-SDRAM/assets/47240597/741002c8-b695-43ca-9012-90e1be6198bc)

Write State Diagram: \
![WRITE_FSM](https://github.com/n43ee7/i386-SDRAM/assets/47240597/021f0ef4-1803-4bd9-932e-f4cad7bd37da)

Read State Diagram: \
![READ_FSM](https://github.com/n43ee7/i386-SDRAM/assets/47240597/ee396805-3234-4786-a427-f3bcd73e6070)

Data Read Burst Latching for 32-bit Data Bus: \
![DATA_OUT_LATCH](https://github.com/n43ee7/i386-SDRAM/assets/47240597/562d320f-843f-4edf-be1f-e2fb41c5ecd0)

Timers utilized in the diagram: \
Timer 1: (Declared in Scope of SDRAM Controller Design) \
![TIMER1_RFRQ](https://github.com/n43ee7/i386-SDRAM/assets/47240597/a1cd513a-0617-4323-94c7-8974e2be540f)

Timer 0: (Declared in the Scope of SDRAM Controller Design) \
![TIMER0_WAIT100us](https://github.com/n43ee7/i386-SDRAM/assets/47240597/55ca04e4-4f09-48c7-936e-667a91ed2616)

SDRAM Decoder: \
![DCD_BLOCK](https://github.com/n43ee7/i386-SDRAM/assets/47240597/4b50f5cc-0602-493f-b5e9-5c710dce5cd9)

Unreferenced PLL Logic from the scope of code: \
![PLLVCO](https://github.com/n43ee7/i386-SDRAM/assets/47240597/6a2a2f6c-f839-4b91-b878-2690485551b3)


## Usage

1. Clone this repository to your local machine.
2. Explore the project files to understand the SDRAM controller's design and integration with the i386 DX.
3. Refer to the documentation and code comments for detailed insights into the project's technical aspects.


## Acknowledgments

- The project's inspiration is drawn from the Intel 80386 DX microprocessor and the transformative impact of SDRAM technology.
- Thanks to the open-source community for providing invaluable resources and tools that facilitated the project's development.

## License

This project is licensed under the [MIT License](LICENSE).

---
*Note: The Intel 80386 DX and other named components in this project are trademarks of their respective owners. This project references manufacture available information on the components used to design the SDRAM controller IP and software used to develop this. This repository is for educational purposes only and the owner/proprietor of this repository claims no responsibility for the usage of the information presented in this repository. Academic integrity policies may apply. Use at your own risk.*
