<!-- lecture3_peripherals.qmd -->

# Lecture 3: Peripherals and Interfacing

## Overview
- **Input and Output (IO)**: Embedded systems interface with external peripherals to gather input (e.g., sensors) and send output (e.g., motor control).
- **Types of IO**: Can be categorized as *polling*, *interrupt-driven*, or using *Direct Memory Access (DMA)* for efficiency.
  - **Polling**: The processor actively waits until a peripheral is ready. Inefficient as it wastes processing power.
  - **Interrupts**: The peripheral signals the processor when it has data, allowing efficient use of CPU resources.
  - **DMA**: Offloads data transfer to a dedicated controller, enabling parallel processing.

## Memory-Mapped vs Direct IO
- **Memory-Mapped IO**: IO devices are treated like memory locations, accessed using memory read/write instructions.
- **Direct IO**: Uses a separate address space for IO operations, typically with specialized instructions (e.g., IN and OUT instructions in the x86 architecture).

## Data Transfer Mechanisms
- **Programmed IO**: The processor executes specific instructions for data transfer. This is inherently slower and is suitable for simple, low-bandwidth peripherals.
- **DMA Mode**: Allows for efficient data transfer, especially when large data volumes are involved, by using an additional master controller to handle the transfers.

## Interrupts
- **Fixed Interrupt**: The ISR (Interrupt Service Routine) address is fixed and cannot be changed.
- **Vectored Interrupt**: The peripheral provides the ISR address, allowing for more flexible interrupt handling.
- **Interrupt Address Table**: A hybrid approach where an index is provided into a memory table to determine the ISR address.

## Examples of Peripheral Handling
- **Interrupt-Driven IO**: Discussed various types of interrupts, including *maskable* (which can be ignored during critical operations) and *non-maskable* (used for urgent events like power failure).

- **NIOS II Development Board**: The board supports non-vectored interrupts, relying on the HAL system library to determine the interrupt source.