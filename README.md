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
The top-level design of the SDRAM controller is as shown:

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
