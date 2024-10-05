<!-- lecture6_embedded_control1.qmd -->

# Lecture 6: Embedded Control Systems 1

## Embedded Control Systems
- **Real-Time Systems**: Industrial embedded systems are real-time in nature and often safety-critical, requiring both functional correctness and timing correctness.
  - **Functional Correctness**: Ensures that the system performs the desired function (e.g., a robotic arm stopping on intrusion).
  - **Timing Correctness**: Ensures that the system operates within specified deadlines (e.g., stopping within 10 ms of intrusion).

## Sampling and Quantization
- **Sampling**: The process of taking snapshots of a signal over time (e.g., video, sound, voltage).
- **Quantization**: Replacing real values with an approximation from a finite set of discrete values. For an n-bit ADC, there are $2^n$ quantization levels (e.g., an 8-bit ADC has 256 levels).

## Aliasing
- **Aliasing**: Occurs due to insufficient sampling rates, resulting in different signals appearing indistinguishable. To prevent aliasing, signals must be sampled above the Nyquist frequency (at least twice the highest frequency component).

## Computation Delays
- **Sources of Delays**: Include unbounded software (e.g., unpredictable runtime branches, unbounded loops), floating-point operations, search algorithms, and cache misses.
- **Worst-Case Execution Time (WCET)**: The longest time it takes to complete execution. Can be determined through measurement or static analysis, but speculative hardware makes static analysis difficult.

## Static Timing Analysis
- **Control Flow Graph (CFG)**: Used to determine the longest path of execution, crucial for determining WCET. Compilation transforms code into machine-level instructions, enabling timing analysis of each operation.