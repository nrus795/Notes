<!-- lecture10_industrial_automation2.qmd -->

# Lecture 10: Industrial Automation 2

## IEC 61131 Standard
- **PLC Programming Languages**: The IEC 61131 standard defines programming languages for PLCs, including Ladder Logic, Instruction List, Structured Text, Function Block Diagrams, and Function Charts.
- **Ladder Logic**: An old but still widely used language, using graphical symbols to represent control actions, making it easy to understand and maintain.

## Ladder Logic Features
- **Basic Elements**: Includes contacts, coils, and connectors, with vertical power rails representing power flow through the rungs of the diagram.
- **Timers and Counters**: Used for controlling time-based operations, with variations like On-Delay, Off-Delay, and Pulse timers. Counters are used to count occurrences and trigger actions after a specific count.

## Example: Pneumatic Cylinder
- **Control Sequence**: A pneumatic cylinder controlled by ladder logic, moving forward when a START button is pressed, and returning when fully extended. This sequence can be represented as a Moore Machine for precise state transitions.
- **Concurrency in Ladder Logic**: Used to control multiple devices simultaneously, ensuring that state transitions occur correctly based on sensor input and predefined logic.