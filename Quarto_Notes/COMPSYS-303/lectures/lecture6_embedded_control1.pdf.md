<!-- lecture6_embedded_control1.qmd -->

# Embedded Control Systems 1

## Introduction to Embedded Control Systems

**Embedded control systems** are crucial for industrial automation and other real-time applications that require precise, timely responses. These systems often control physical processes, ensuring safety and reliability through careful computational analysis of execution times. This lecture focused on various elements of embedded control, such as real-time system properties, sampling and quantization, computational delays, and worst-case execution time (WCET) analysis (Slides 2-3).

## Real-Time Systems

**Definition**: Real-time systems are used in scenarios where timing is critical, such as industrial automation and safety-critical applications. These systems must perform their functions not only correctly (functional correctness) but also within specific timing constraints (Slide 3).

**Examples**: A robotic arm must stop within 10 ms of detecting human intrusion to prevent accidents. This combination of functional and timing correctness is what defines a real-time system.

## Sampling and Quantization

**Sampling**: Sampling refers to taking discrete snapshots of an analog signal over time. This process is fundamental in digitizing signals like video, audio, or physical voltages. The higher the sampling rate, the more accurately the original signal is represented (Slides 4, 8).

**Quantization**: Due to the discrete nature of computer data, real values must be approximated to the nearest value in a finite set. Quantization replaces real-world continuous values with discrete levels, introducing **quantization error** (Slide 5).

-   **Quantization Levels**: For an `n`-bit Analog-to-Digital Converter (ADC), there are $2^n$ levels, which determine how finely the signal is represented. For example, an 8-bit ADC has 256 quantization levels.

-   **Resolution**: The resolution of an ADC determines the voltage represented by each digital increment. For instance, a 10-bit ADC with a High Reference Voltage (HRV) of 5V and Low Reference Voltage (LRV) of 0V has a resolution of approximately 0.00488V per step (Slide 6).

## Aliasing

**Aliasing** occurs due to insufficient sampling rates. If the sampling rate is less than twice the frequency of the signal (the **Nyquist frequency**), higher-frequency signals appear indistinguishable from lower frequencies, leading to errors (Slides 9-11). For example, if a signal is sampled at 2.5 Hz, signals at 0.5 Hz, 3 Hz, and 5.5 Hz appear the same, leading to ambiguity.

## Computation Delays and Timing Variances

**Computation Delays**: In real-time systems, delays can occur due to inherent processing overhead, causing sampling or actuation to happen later than expected. Accurate delay characterization is needed to ensure that systems meet timing requirements (Slide 12).

**Sources of Timing Variance**:

-   **Unbounded Software Constructs**: Unpredictable branches, loops, recursion, and dynamic memory allocations can introduce delays (Slide 13).

-   **Speculative Hardware**: Features like pipelines, memory hierarchies (caches), and branch predictors in modern processors can lead to non-deterministic execution times.

## Worst-Case Execution Time (WCET)

**WCET** is the maximum time required for a system to complete a given task (Slide 14). Understanding WCET is critical for ensuring that an embedded control system meets its real-time constraints.

**Methods to Determine WCET**:

-   **Measured**: Simple to implement but may not explore all possible execution paths, thus providing non-guaranteed values.

-   **Static Analysis**: Uses an abstraction of the system to analyze all possible paths, ensuring coverage but requiring significant computational resources.

## Static Timing Analysis

**Control Flow Graph (CFG)**: Timing analysis starts with creating a **control flow graph** (CFG) to map program flow, representing different segments of code (Slides 18-19).

-   **Basic Blocks and Transitions**: CFG nodes are called **basic blocks**, which represent straight-line code without branches, and transitions show how the program moves between these blocks.

-   **Path Analysis**: Finding the **longest execution path** within the CFG is key to determining the worst-case scenario for execution time (Slide 20).

**Timed CFG**: A timed CFG uses clock cycle estimates for different operations—computation, load, store, branch, and return—to determine execution duration (Slide 23).

-   Example: **Load** and **Store** take 5 cycles, **Computation** takes 1 cycle, **Branch** (if taken) takes 3 cycles.

## WCET Analysis Using Max-Plus Algebra

The **Max-Plus** approach simplifies WCET analysis by using only max and plus operations to calculate the worst-case path cost (Slide 24).

-   For example, the WCET for two possible paths might be calculated as: $\text{wcet} = \max(19 + 14 + 10, 21 + 13 + 10) = 44$ clock cycles.

## Integer Linear Programming (ILP)

**ILP** is used for WCET analysis by defining an **objective function** to maximize execution time under given constraints (Slide 28-30). The constraints are typically linear inequalities describing valid program transitions and flow consistency, allowing ILP to provide an upper bound for WCET.

## Coding Guidelines for Time Predictability

-   **Bounded Loops**: Always use bounded loops to guarantee an upper bound on execution time (Slide 36). For example, in the **GCD** function, the loop is bounded to ensure a predictable runtime.

-   **Static Memory Allocation**: Prefer static allocation over **dynamic memory allocation** (e.g., `malloc`) to prevent runtime unpredictability caused by memory fragmentation or variable allocation times (Slide 38).

-   **Avoiding Interrupts**: Where possible, avoid **interrupts** due to their impact on execution time variability. Instead, use polling or reactive processors that can queue interrupts predictably (Slide 39).

-   **Fixed Point Arithmetic**: Use **fixed-point arithmetic** over floating-point for better predictability, as floating-point operations are not always supported natively and can have variable runtime characteristics.

## PRET Philosophy

The **PRET (Precision Timed)** philosophy emphasizes treating time as a first-class citizen, aiming for a **time-predictable system** (Slide 35). The objective is to achieve predictability in hardware, software-hardware interfaces, and the software itself, ensuring reliable operation within a time-constrained environment.

## Conclusion

This lecture provided insights into the design and analysis of **embedded control systems**. Key topics included **real-time system requirements**, **sampling and quantization**, **computation delays**, **WCET analysis**, and **coding practices for time predictability**. Accurate timing analysis and predictable software execution are crucial for the development of safe and reliable embedded control systems. The concepts discussed lay the foundation for designing robust control systems that meet strict real-time requirements.