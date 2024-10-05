<!-- lecture5_sopc_buses.qmd -->

# Lecture 5: SoC and SOPC Buses

## Overview
- **System on Chip (SoC) and System on Programmable Chip (SOPC)**: SoCs integrate all components of a computer or other systems onto a single chip, while SOPCs use programmable logic to create flexible embedded solutions.
- **Bus Design**: The bus is the communication system that transfers data between components inside a system, and its design impacts the overall system performance.

## Bus Design Issues
- **Bus Width**: Determines the amount of data that can be transferred in a single cycle. Wider buses improve performance but increase cost.
- **Bus Type**: Can be *dedicated* (separate buses for different types of data) or *multiplexed* (shared bus for multiple purposes), impacting cost and efficiency.
- **Bus Operations**: Include basic operations like read, write, block transfer, and interrupt. Block transfers are particularly useful for filling cache lines.

## Synchronous vs Asynchronous Buses
- **Synchronous Bus**: Operates with a clock signal, making implementation simpler but requiring careful timing of actions to avoid delays.
- **Asynchronous Bus**: Uses handshaking between master and slave components, allowing for flexibility in timing but adding complexity.

## Bus Arbitration
- **Bus Arbitration Mechanisms**: Required when multiple bus masters need to access the bus. Can be *static* (predetermined priority) or *dynamic* (priority assigned based on demand).
  - **Fixed Priority**: Assigns a fixed priority to each master, which can lead to bus hogging by high-priority devices.
  - **Rotating Priority**: Adjusts priorities based on waiting time, ensuring fair access.
  - **Hybrid Policies**: Combine aspects of both fixed and rotating priorities to achieve a balance between fairness and efficiency.

## Examples of Bus Usage
- **Synchronous Bus Operations**: Memory read and write operations are synchronized with the bus clock, with or without wait states to manage slower memory.
- **Dynamic Bus Arbitration**: Allows multiple masters to request access to the bus and ensures that access is granted based on current system needs.
